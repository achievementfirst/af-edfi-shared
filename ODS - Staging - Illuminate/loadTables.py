"""
Name: loadTables.py
Description: Script extracts data (specific to Illuminate assessments) from the edfi ODS and loads
it into the AWS Aurora db

Note:
The following code can be run locally or as a lambda function by converting the main function
to a lambda handler. 

"""

import argparse
import configparser
import os
import pymssql
import psycopg2
from psycopg2 import extras
import re
from parseRows import *

config = configparser.ConfigParser()

def main():
    parser = argparse.ArgumentParser(
        description='Copy data from Source tables to Staging.')
    parser.add_argument('configuration file', type=str,
                        help='configuration file')
    parser.add_argument('--test', '-t', action='store_true', default=False,
                        help='print queries only.')
    args = parser.parse_args()

    config.read(getattr(args, 'configuration file'))
    
    tables = config['tables']
    for table in tables:
        rows = extract_table(
                table,
                print_only=args.test,
                local=True)
        parsed_rows = parse_rows(rows, table)
        load_to_staging(
                parsed_rows,
                table,
                print_only=args.test,
                local=True)


def extract_table(table, print_only=False, local=True):
    """ Loads queried rows from the ODS
    returns matrix of query results """

    cred = config['source']

    print('Connecting to source db...')
    conn = pymssql.connect(
            server=cred['host'],
            database=cred['dbname'],
            user=cred['username'],
            password=cred['password'],
            port=cred['port'])

    print("Extract table: " + table)

    with open(os.path.join(config['sql']['source'], f'{table}.sql'), 'r',
              encoding='utf') as f:
        query = f.read()
        
    if print_only:
        print(query)
        return []

    with conn.cursor() as cursor:
        cursor.execute(query)
        rows = cursor.fetchall()

    conn.close()
    
    print("Done query table: " + table)

    return rows

def parse_rows(rows, table):
    """ parses rows from the ODS for insertion in AFStaged, based on inputted table
        returns parsed matrix of query results """

    if table == 'Assessment':
        parsed_rows = parse_assessment(rows)
    elif table == 'AssessmentAcademicSubject':
        parsed_rows = parse_assessmentacademicsubject(rows)
    elif table == 'AssessmentAssessedGradeLevel':
        parsed_rows = parse_assessmentassessedgradelevel(rows)
    elif table == 'AssessmentItem':
        parsed_rows = parse_assessmentitem(rows)
    elif table == 'AssessmentItemCategoryDescriptor':
        parsed_rows = parse_assessmentitemcategorydescriptor(rows)
    elif table == 'AssessmentItemLearningStandard':
        parsed_rows = parse_assessmentitemlearningstandard(rows)
    elif table == 'AssessmentItemResultDescriptor':
        parsed_rows = assessmentitemresultdescriptor(rows)
    elif table == 'AssessmentPerformanceLevel':
        parsed_rows = parse_assessmentperformancelevel(rows)
    elif table == 'AssessmentReportingMethodType':
        parsed_rows = parse_assessmentreportingmethodtype(rows)
    elif table == 'AssessmentScore':
        parsed_rows = parse_assessmentscore(rows)
    elif table == 'Descriptor':
        parsed_rows = parse_descriptor(rows)
    elif table == 'LearningStandard':
        parsed_rows = parse_learningstandard(rows)
    elif table == 'StudentAssessment':
        parsed_rows = parse_studentassessment(rows)
    elif table == 'StudentAssessmentItem':
        parsed_rows = parse_studentassessmentitem(rows)
    elif table == 'StudentAssessmentPerformanceLevel':
        parsed_rows = parse_studentassessmentperformancelevel(rows)
    elif table == 'StudentAssessmentScoreResult':
        parsed_rows = parse_studentassessmentscoreresult(rows)
    else:
        print('Invalid table name')
        raise Exception('PythonCatchException')
       
    return parsed_rows

def load_to_staging(parsed_rows, table, print_only=False, local=True):
    """ loads parsed rows from ODS into Aurora db """

    with open(os.path.join(config["sql"]["staged"], f'{table}.sql'), 'r',
              encoding='utf') as f:
        query = f.read()
        if print_only:
            print(query)
            return


    cred = config['destination']
    conn = psycopg2.connect(
            dbname=cred['dbname'],
            user=cred['username'],
            password=cred['password'], host=cred['host'],
            port=cred['port'])

    schema = config['sql']['schema']

    print(f'Inserting data into {schema}.{table}')
    with conn.cursor() as cursor:
        delete_command  = f'DELETE FROM {schema}."{table}"'

        cursor.execute(delete_command)
        try:
            extras.execute_batch(cursor, query, parsed_rows)
        except:
            print(cursor.query)
            raise

    print(f'Done inserting into {schema}.{table}')
    conn.commit()
    conn.close()


if __name__ == "__main__":
    main()
