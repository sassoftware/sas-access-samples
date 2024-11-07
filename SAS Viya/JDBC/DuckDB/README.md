# DuckDB

## Introduction

DuckDB is an open-source, in-process SQL database system designed for fast analytical queries on large datasets. It's optimized for single-node operation, making it ideal for data science and analytics tasks on laptops or servers without needing a separate database server. DuckDB supports SQL queries directly within applications and data pipelines, making it highly compatible with Python, R, and other data science tools. Its columnar storage format and vectorized execution make it efficient for handling complex queries on data stored in formats like Parquet and CSV, providing a lightweight, scalable alternative to heavier database systems.

## Resources

- [DuckDB Documentation](https://duckdb.org/docs/)
- [DuckDB JDBC Driver Documentation](https://duckdb.org/docs/api/java)
- [SAS JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)

## Prerequisites

Before you can connect to DuckDB through JDBC from SAS Viya, you need to have the following:

1. DuckDB JDBC driver: You must download and install the [DuckDB JDBC Driver](https://duckdb.org/docs/api/java).
2. Working installation of SAS Viya.

**To install the JDBC driver:**

1. Download the [DuckDB JDBC Driver](https://duckdb.org/docs/api/java).
2. Install the JDBC driver according to the instructions provided by DuckDB.

## Overview

| Trino                      |                                                                                                            |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Company URL**            | [https://duckdb.org](https://duckdb.org)                                                                   |
| **JDBC JAR File Path**     | [duckdb_jdbc-1.1.2.jar](https://repo1.maven.org/maven2/org/duckdb/duckdb_jdbc/1.1.2/duckdb_jdbc-1.1.2.jar) |
| **JDBC URL Syntax**        | jdbc:duckdb:                                                                                               |
| **JDBC Driver Class Name** | org.duckdb.DuckDBDriver                                                                                    |

## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to DuckDB using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib jdbc
  DRIVERCLASS="org.duckdb.DuckDBDriver"
  URL="jdbc:duckdb:/location/of/database"
  preserve_tab_names=yes
  preserve_col_names=yes
  dbmax_text=512
```

- CAS Library creation

```sas
cas;
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                driverclass="org.duckdb.DuckDBDriver",
                url="jdbc:duckdb:/location/of/database");
caslib _all_ assign;
```

``

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

| Smoke Tests                                         |                                           |                                                                         |
| ----------------------------------------------------- | ------------------------------------------- | ------------------------------------------------------------------------- |
| [**Table Creation Tests**](..#table-creation-tests) |                                           |                                                                         |
|                                                     | Create Airline Table                      | Passed - Though Character fields appear to be null                      |
|                                                     | Create Cars Table                         | Passed - Though Character fields appear to be null                      |
| [**Proc SQL Tests**](..#proc-sql-tests)             |                                           |                                                                         |
|                                                     | Create Table                              | Passed                                                                  |
|                                                     | Update Table                              | Failed - Error - record level updates not supported by JDBC driver      |
|                                                     | Delete Table                              | Failed - Error - record level updates not supported by JDBC driverPasse |
|                                                     | Insert into Table                         | Failed - Floating Point Overflow                                        |
|                                                     | Drop Table                                | Passed                                                                  |
| [**Implicit SQL Test**](..#implicit-sql-tests)      |                                           | Passed                                                                  |
| [**FEDSql Test**](..#fedsql-test)                   |                                           | Passed                                                                  |
| **Information Catalog Crawler Agent**               |                                           |                                                                         |
|                                                     | CAS Library Based Discovery Agent         | In progress                                                             |
|                                                     | SAS Compute Library Based Discovery Agent | In progress                                                             |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to DuckDB through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [DuckDB Website](https://duckdb.org/) for documentation & support.

In general testing has shown that when working with DuckDB use of explicit SQL has the best outcomes. for example when querying a parquet file stored on ADLS code that looks something like shown below will get good results.

libname myduckj jdbc url="jdbc:duckdb:/tmp/mydb" DRIVERCLASS="org.duckdb.DuckDBDriver" preserve_tab_names=yes preserve_col_names=yes dbmax_text=512;

proc sql outobs=30;
connect using myduckj as j_duck;
execute by j_duck (set global extension_directory = '/tmp/duckdb');
execute by j_duck (set home_directory = '/tmp/mydb');
execute by j_duck (INSTALL azure);
execute by j_duck (LOAD azure);
execute by j_duck (SET azure_storage_connection_string = 'DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=mykey;EndpointSuffix=core.windows.net');
select * from connection to j_duck (select count(*) from 'azure://path/nyctiny.parquet');
execute by j_duck (DROP table IF EXISTS test);
execute by j_duck ( CREATE TABLE test AS SELECT * FROM 'azure://path/nyctiny.parquet');
select * from connection to j_duck (select * from test);
quit;
