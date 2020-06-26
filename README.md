# af-edfi-shared

<h3>Description</h3>
<p>This repository contains the starter code to transfer data from the Ed-Fi ODS to a reporting database and Tableau Desktop templates. In our ETL framework, source data is first loaded into the Ed-Fi ODS v3.3 and then transferred to a staging database. This staging database also contains the ODS v3.3 data schema. Additional datasets including custom datasets and ad-hoc data trackers are loaded directly into the staging database. Finally, this data is transferred to a central reporting database that powers data visualizations in Tableau.</p>

<p>The data pipeline code to transfer student and enrollment data from the ODS to the staging & reporting db can be found in the following directories:</p>
<ul>
<li>ODS – Staging – IC</li>
<li>Staging – Reporting – IC</li>
</ul>

<p>The data pipeline code to transfer assessment data from the ODS to the staging & reporting db can be found in the following directories:</p>
<ul>
<li>ODS – Staging – Illuminate</li>
<li>Staging – Reporting – Illuminate</li>
</ul>

<p>The data structures for the reporting database can be found in the Reporting Data Structures directory. The Tableau Desktop templates and the underlying SQL queries can be found in the Tableau Desktop Templates and SQL Queries directory respectively.</p>

<h3>Prerequisites</h3>
<ol>
<li>Data pipelines – Python version 3.6 or higher</li>
<li>Tableau Templates – Tableau Desktop version 2019.2 or higher</li>
<li>Staging database - Amazon Aurora</li>
<li>Reporting database - Amazon Redshift</li>
<ol>



