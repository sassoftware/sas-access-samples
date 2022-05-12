# SAS/ACCESS Sample Files Index

SAS/ACCESS sample files for SAS Data Connector on SAS Viya 4.

## Overview
The SAS Data Connector rovides connection between SAS Cloud Analytic Services (CAS) and various data sources.  
It uses Database client on CAS controller/worker nodes to communicate to the Database, load data, and perform CAS actions.


This directory contains Database-specific files for the SAS Data Connector Samples on SAS Viya 4.
The sample programs will demonstrate the Read, Save, and Where functionalities, by connecting to a CAS Server, connecting
to data sources, and performing specified actions, such as Load Table, Save Table, Column Info, etc.

## Generic files
* sdcBulkloadSample.sas
* sdcCasutilSample.sas
* sdcFileInfoSample.sas
* sdcColumnInfoSample.sas
* sdcLoadSample.sas
* sdcSaveSample.sas 


## Instructions
1. Download the samples repository onto your local computer
2. Within the samples replaced the indicated fields with your specific desired datasource and database login credentials (username, password, server, database, etc.) and server host and port.
3. You are now ready to run the sample test programs.


## Supported Data Sources

- Amazon Redshift
- Google BigQuery
- Greenplum
- Hadoop
- Impala
- JDBC
- MS SQL Server
- MongoDB
- MySQL
- Netezza
- ODBC
- Oracle
- PostgreSQL
- Salesforce
- SAP HANA
- Snowflake
- Teradata
- Vertica
- Yellowbrick
