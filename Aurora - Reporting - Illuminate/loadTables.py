"""
Name: loadTables.py
Description: Script extracts data (specific to Illuminate assessments) from the Aurora db,
generates csv files on S3 and loads data from these csv files into Redshift using the COPY function

Note:
Some variables are set and assigned values as environment variables in Lambda. All variables below
defined as os.environ[] should be set as Lambda variables for successful execution.
"""

import argparse
import base64
import boto3
import botocore
import configparser
import csv
import json
import os
import psycopg2

from boto3.s3.transfer import S3Transfer

config = configparser.ConfigParser()

## AWS Lambda handler
def lambda_handler(event, context):
    print('Execution started for StagedtoRedshiftLoad - Illuminate')
    
    local_ini = '/tmp/config.ini'
    
    try:
        print('Connecting to S3')
        client = boto3.client('s3')    
        print('Connected to S3')
        
        print('Downloading config file from S3')
        ## Location of the config file in S3
        client.download_file(os.environ['s3_bucket'], 
            os.environ['s3_path'], local_ini)

        print('Config file downloaded')
    except botocore.exceptions.ClientError as e:
        print(e)
        raise Exception('PythonRetryException').with_traceback(e.__traceback__)
    except configparser.Error as e:
        print(e)
        raise Exception('PythonCatchException').with_traceback(e.__traceback__)
    
    try:    
        print('Reading config file into configparser')
        config.optionxform=str
        with open(local_ini, 'r') as ini_fp:
            config.read_file(ini_fp)
        print('Config file read')
    except IOError as e:
        print(e)
        raise Exception('PythonRetryException').with_traceback(e.__traceback__)
    except configparser.Error as e:
        print(e)
        raise Exception('PythonCatchException').with_traceback(e.__traceback__)

    tables = config['tables']

    print(f'Loading tables: {list(tables)}') 

    staged_to_s3(tables)
    s3_to_redshift(tables)

    try:
        print("Removing config file from tmp folder")
        os.remove(local_ini)
    except OSError:
        pass

    print("Config file removed")

    print('Execution finished for StagedtoRedshiftLoad - Illuminate')


def staged_to_s3(tables):
    """ Loads tables from AF staged to a .csv file on S3 bucket"""
    s3_config = config['s3'] 

    cred = config['source']

    print('Connecting to staging...')

    try:
        source_connection = psycopg2.connect(
                dbname=cred['dbname'],
                user=cred['username'],
                password=cred['password'],
                host=cred['host'],
                port=cred['port'])
    except psycopg2.Error as e:
        print(e)
        raise Exception('PythonRetryException').with_traceback(e.__traceback__)
    
    print('Connected to staging.')
    for table in tables:

        print(f'Querying {table} from staging...')

        with open(os.path.join('SQL', f'{table}.sql'),
                  'r', encoding='utf-8-sig') as sql_file:
            query = sql_file.read()

        with source_connection.cursor() as source_cursor:
            source_cursor.execute(query)
            rows = source_cursor.fetchall()
        
        print(f'Loading {table} to S3...')

        csv_filename = f'{table}.csv'
        csv_filename = os.path.join('/tmp', csv_filename)

        with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            for row in rows:
                writer.writerow(row)
        
        print(f'Loaded {table} to S3.')

        
        client = boto3.client('s3')
        client.delete_object(Bucket=s3_config['s3_upload_bucket'],
                Key=f'{s3_config["s3_upload_path"]}/{table}.csv')
        transfer = S3Transfer(client)
        transfer.upload_file(csv_filename, s3_config['s3_upload_bucket'],
                f'{s3_config["s3_upload_path"]}/{table}.csv')

        os.remove(csv_filename)

    source_connection.close()


def s3_to_redshift(tables):
    """ Loads tables .csv file from s3 bucket into Redshift tables"""

    print('Connecting to Redshift...')
    cred = config['redshift']
    s3_config = config['s3']

    try:
        destination_connection = psycopg2.connect(
                dbname=cred['dbname'],
                user=cred['username'],
                password=cred['password'],
                host=cred['host'],
                port=cred['port'])
    except psycopg2.Error as e:
        print(e)
        raise Exception('PythonRetryException').with_traceback(e.__traceback__)

    print('Connected to Redshift')

    for table in tables:

        schema = tables[table].lower()
  
        print('{}.{}: loading to Redshift'.format(schema, table))



        upload_bucket = s3_config['s3_upload_bucket']
        upload_path = s3_config['s3_upload_path']
        execution_role = s3_config['execution_role']
        

        copy_cmd  = f"copy {schema}.{table} from "
        copy_cmd += f"'s3://{upload_bucket}/{upload_path}/{table}.csv' "
        copy_cmd += f"credentials 'iam_role={execution_role};"
        copy_cmd += "FORMAT AS CSV ACCEPTINVCHARS ACCEPTANYDATE BLANKSASNULL EMPTYASNULL TRIMBLANKS TRUNCATECOLUMNS;" 

        print(f'Copying {table} to redshift...')

        
        with destination_connection.cursor() as destination_cursor:
            try:
                if table in ('assessment','assessmentitem','itemreportinggroup','itemstandard', 'standard', 'reportinggroup'):
                    delete_cmd = "DELETE FROM {schema}.{table} where TestYear = " + config['year']['load_year']
                elif table in ('studentstandardscore','studentreportinggroupscore','studentaggregatescore'):
                    delete_cmd = "DELETE FROM {schema}.{table} where EndYear = " + config['year']['load_year']
                print(delete_cmd)
                destination_cursor.execute(delete_cmd)
                print('Table contents deleted.')
            except Exception as err:
                print (err)
                destination_connection.rollback()
            else:
                print('Copying data after delete.')
                destination_cursor.execute(copy_cmd)
                destination_connection.commit()

        print('{}: load to redshift done'.format(table))

        

    destination_connection.close()

