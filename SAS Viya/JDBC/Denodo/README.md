# Denodo DB

## Introduction

Denodo is a leading data virtualization platform that provides comprehensive data integration and data modeling capabilities across disparate systems. It centralizes the [security and governance of the unified data](https://community.denodo.com/docs/html/browse/8.0/en/), enabling business users to access it in real-time. Some of its most notable features include its ability to handle [large data volumes](https://hkrtrainings.com/denodo-platform) and its [advanced query optimizer](https://hkrtrainings.com/denodo-platform).

## Resources

- [Denodo 8.0 Documentation](https://community.denodo.com/docs/html/browse/8.0/en/)
- [Denodo Support Portal](https://support.denodo.com/)
- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)

## Prerequisites

Before you can connect to Denodo through JDBC from SAS Viya, you need to have the following:

1. Access to a Denodo virtual database: You must have access to a Denodo virtual database with the appropriate credentials.

2. Denodo JDBC driver: You must download and install the [Denodo JDBC driver](https://community.denodo.com/drivers/jdbc/8.0).

3. Working installation of SAS Viya.

**To install the JDBC driver:**

1. Download the [Denodo JDBC driver](https://community.denodo.com/drivers/jdbc/8.0).

2. Install the JDBC driver according to the instructions provided by Denodo.

## Overview

| Denodo               |                                                                                   |
| -------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | https://denodo.com                                                               |
| **JDBC JAR File Path**   | [<DENODO_HOME>/tools/client-drivers/jdbc/vdp-jdbcdriver-core/denodo-vdp-jdbcdriver.jar](https://community.denodo.com/docs/html/browse/8.0/en/vdp/developer/access_through_jdbc/access_through_jdbc)                        |
| **JDBC URL Syntax** | jdbc:denodo://&lt;hostName&gt;:&lt;port&gt;/&lt;databaseName&gt;[?&lt;paramName&gt;=&lt;paramValue&gt; [&lt;paramName&gt;=&lt;paramValue&gt;]*]                                           |
| **Default Port**    | [9999 and 9997](https://community.denodo.com/docs/html/browse/7.0/platform/installation/appendix/default_ports_used_by_the_denodo_platform_modules/default_ports_used_by_the_denodo_platform_modules)                                                                            |
| **JDBC Driver Class Name**      | com.denodo.vdp.jdbc.Driver                                                       |
## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to SQream using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib jdbc
  driverclass="com.denodo.vdb.jdbcdriver.VDBJDBCDriver"
  URL="jdbc:denodo://<hostname>:9999/<databasenName>?ssl=true"
  schema="default"
  user="myuser"
  password="mypw";
/*materialized=yes; //Allows for permanment table creation */
```

- CAS Library creation

```sas
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                driverclass="com.denodo.vdb.jdbcdriver.VDBJDBCDriver",
                url="jdbc:denodo://<hostname>:9999/<databasenName>?ssl=true",
                schema="default"
                user="myuser",
                password="mypw");
```
``
## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.
|            Smoke Tests                           |                      |     |
| ------------------------------------- | -------------------- | --- |
| [**Table Creation Tests**](..#table-creation-tests)              |       |     |
|                                       | Create Airline Table | &check; |
|                                       | Create Cars Table    | &check;  |
| [**Proc SQL Tests**](..#proc-sql-tests)                    |                      |     |
|                                       | Create Table         |  &check;   |
|                                       | Update Table         |  X (Expected)   |
|                                       | Delete Table         |  X (Expected)   |
|                                       | Insert into Table    |  &check;   |
|                                       | Drop Table           |  &check;   |
| [**Implicit SQL Test**](..#implicit-sql-tests)                 | *                     | &check;    |
| [**FEDSql Test**](..#fedsql-test)                     | *                    |  X MYLIB.CLASS does not exist   |
| **Information Catalog Crawler Agent** | *                     |  N/A   |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to Denodo through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [Troubleshooting](https://community.denodo.com/kb/en/category/Troubleshooting) section in the Denodo documentation