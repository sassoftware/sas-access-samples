# Trino

## Introduction

Trino is a tool designed to efficiently query vast amounts of data using distributed queries. If you work with terabytes or petabytes of data, you are likely using tools that interact with Hadoop and HDFS. Trino was designed as an alternative to tools that query HDFS using pipelines of MapReduce jobs, such as Hive or Pig, but Trino is not limited to accessing HDFS. Trino can be and has been extended to operate over different kinds of data sources, including traditional relational databases and other data sources such as Cassandra.
Trino was designed to handle data warehousing and analytics: data analysis, aggregating large amounts of data and producing reports. These workloads are often classified as Online Analytical Processing (OLAP).

## Resources

- [Trino Documentation](https://trino.io/docs/current/client/jdbc.html)
- [Trino JDBC Driver Installation and Connection](https://trino.io/docs/current/client/jdbc.html)
- [SAS JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)

## Prerequisites

Before you can connect to Trino through JDBC from SAS Viya, you need to have the following:

1. Access to a Trino platform: You must have access to a Trino instance with the appropriate credentials.

2. Trino JDBC driver: You must download and install the [Trino JDBC driver](https://trino.io/docs/current/client/jdbc.html).

3. Working installation of SAS Viya.

**To install the JDBC driver:**

1. Download the [Trino JDBC driver](https://trino.io/docs/current/client/jdbc.html).

2. Install the JDBC driver according to the instructions provided by Trino.

## Overview

| Trino               |                                                                                   |
| -------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | [https://trino.io/](https://trino.io/)                                                               |
| **JDBC JAR File Path**   | [trino-jdbc-434.jar](https://repo1.maven.org/maven2/io/trino/trino-jdbc/434/trino-jdbc-434.jar)                        |
| **JDBC URL Syntax** | jdbc:trino://<hostname>:8080/                                           |
| **JDBC Driver Class Name**      | io.trino.jdbc.TrinoDriver                                                       |
## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to Trino using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib jdbc
  driverclass="io.trino.jdbc.TrinoDriver"
  URL="jdbc:trino://<hostname>:8080/"
  user="myuser"
  preserve_tab_names=yes
  preserve_col_names=yes
  dbmax_text=512
```

- CAS Library creation

```sas
cas;
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                driverclass="io.trino.jdbc.TrinoDriver",
                url="jdbc:trino://<hostname>:8080/",
                user="myuser");
caslib _all_ assign;
```
``
## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

|            Smoke Tests                           |                      |     |
| ------------------------------------- | -------------------- | --- |
| [**Table Creation Tests**](..#table-creation-tests) | | |
|                                       | Create Airline Table | In progress |
|                                       | Create Cars Table    | In progress |
| [**Proc SQL Tests**](..#proc-sql-tests) | | |
|                                       | Create Table         | In progress |
|                                       | Update Table         | In progress |
|                                       | Delete Table         | In progress |
|                                       | Insert into Table    | In progress |
|                                       | Drop Table           | In progress |
| [**Implicit SQL Test**](..#implicit-sql-tests) | | In progress |
| [**FEDSql Test**](..#fedsql-test) | | In progress |
| **Information Catalog Crawler Agent** | | |
|                                       | CAS Library Based Discovery Agent | In progress |
|                                       | SAS Compute Library Based Discovery Agent | In progress |
## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to Trino through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [Trino Website](https://trino.io/) section in the Trino documentation & support.