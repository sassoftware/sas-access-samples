# SQream DB

## Introduction

SQream DB is a high-performance columnar analytic SQL database management system designed for big data analytics. SQream DB supports regular SQL including [a substantial amount of ANSI SQL](https://docs.sqream.com/en/latest/reference/sql_feature_support.html#sql-feature-support), uses [serializable transactions](https://docs.sqream.com/en/latest/feature_guides/transactions.html#transactions), and [scales horizontally](https://docs.sqream.com/en/latest/feature_guides/concurrency_and_scaling_in_sqream.html#concurrency-and-scaling-in-sqream) for concurrent statements. Even a [basic SQream DB machine](https://docs.sqream.com/en/latest/getting_started/hardware_guide.html#hardware-guide) can support tens to hundreds of terabytes of data.

## Resources

- [SQream DB Documentation](https://docs.sqream.com/en/latest/index.html)
- [Connect to SQream Using SAS Viya](https://docs.sqream.com/en/latest/connecting_to_sqream/client_platforms/sas_viya.html)
- [SQream’s support portal](https://sqream.atlassian.net/servicedesk/)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)
- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)

## Prerequisites

Before you can connect to SQream through JDBC from  SAS Viya, you need to have the following:

1. Access to a SQream database: You must have access to a SQream database with the appropriate credentials.

2. SQream JDBC driver: You must download and install the [SQream JDBC driver](https://sq-ftp-public.s3.amazonaws.com/sqream-jdbc-4.5.9.jar). 

3. Working installation of SAS Viya

**To install the JDBC driver:**

1. Download the [SQream JDBC driver](https://sq-ftp-public.s3.amazonaws.com/sqream-jdbc-4.5.9.jar)

2. Unzip the JDBC driver into a location on the SAS Viya server.

SQream recommends creating the directory `/opt/sqream` on the SAS Viya server.

## Overview

| SQream              |                                                                                   |
| ------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | https://sqream.com                                                                |
| **JDBC JAR File**   | [sqream-jdbc-4.5.9](https://sq-ftp-public.s3.amazonaws.com/sqream-jdbc-4.5.9.jar) |
| **JDBC URL Syntax** | jdbc:Sqream://<hostname>:<port>/<database>;cluster=true                           |
| **Default Port**    | 5000 (cluster=false), 3108 (cluster=true)                                                              |
| **JDBC Class**      | com.sqream.jdbc.SQDriver                                                          |

## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to SQream using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib sasiojdb
  URL="jdbc:Sqream://<endpoint>:5000/master;cluster=false"
  schema="myschema"
  user="myuser"
  password="mypw"
  preserve_names=yes;
```

- CAS Library creation

```sas
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                url="jdbc:Sqream://<endpoint>:5000/master;cluster=false",
                schema="myschema",
                user="myuser",
                password="mypw");
```

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

| [**Table Creation Tests**](..#table-creation-tests)                  |                      |     |
| ------------------------------------- | -------------------- | --- |
|                                       | Create Airline Table | &check;  |
|                                       | Create Cars Table    | &check;  |
| [**Proc SQL Tests**](..#proc-sql-tests)                    |                      |     |
|                                       | Create Table         | &check;  |
|                                       | Update Table         | &check;  |
|                                       | Delete Table         | &check;  |
|                                       | Insert into Table    | &check;  |
|                                       | Drop Table           | &check;  |
| [**Implicit SQL Test**](..#implicit-sql-tests)               |                      | &check;  |
| [**FEDSql Test**](..#fedsql-test)                      |                      | &check;  |
| **Information Catalog Crawler Agent** |                      | &check;  |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to SQream through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [Troubleshooting](https://docs.sqream.com/en/latest/connecting_to_sqream/client_platforms/sas_viya.html#troubleshooting-sas-viya) section in the SQream documentation
