# Data Virtuality DB

## Introduction

Data Virtuality is a data integration and management platform for instant data access, easy data centralization, and data governance. It empowers companies to get fast and direct insights from scattered data. By uniquely combining data virtualization and data replication, Data Virtuality Platform provides data teams the flexibility to always choose the right method for the specific requirement. It is an enabler for Data Fabric and Data Mesh by providing the self-service capabilities and data governance features that are indispensable for these frameworks. Enterprises around the world, such as BSH, PGGM, PartnerRe, Crédit Agricole, and Vontobel use the Data Virtuality Platform to build modern data architectures that meet today’s and tomorrow’s business requirements.

## Resources

- [Data Virtuality Documentation](https://datavirtuality.com/en/docs-and-support/)
- [Data Virtuality Support Portal](https://support.datavirtuality.com/hc/en-us)
- [Data Virtuality JDBC Driver Installation and Connection](https://docs.datavirtuality.com/v3/jdbc-driver-installation-and-connection)
- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)

## Prerequisites

Before you can connect to Data Virtuality through JDBC from SAS Viya, you need to have the following:

1. Access to a Data Virtuality platform: You must have access to a Data Virtuality instance with the appropriate credentials.

2. Data Virtuality JDBC driver: You must download and install the [Data Virtuality JDBC driver](https://datavirtuality.com/en/download-driver/).

3. Working installation of SAS Viya.

**To install the JDBC driver:**

1. Download the [Data Virtuality JDBC driver](https://datavirtuality.com/en/download-driver/).

2. Install the JDBC driver according to the instructions provided by Data Virtuality.

## Overview

| Data Virtuality               |                                                                                   |
| -------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | [https://datavirtuality.com/en](https://datavirtuality.com/en)                                                               |
| **JDBC JAR File Path**   | [datavirtuality-jdbc_4.0.3.jar](https://datavirtuality.com/wp-content/uploads/2023/07/datavirtuality-jdbc_4.0.3.jar)                        |
| **JDBC URL Syntax** | jdbc:datavirtuality:datavirtuality@mms://<hostname>                                           |
| **Default Port**    | 45012                                                                            |
| **JDBC Driver Class Name**      | com.Data Virtuality.vdp.jdbc.Driver                                                       |
## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to Data Virtuality using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib jdbc
  driverclass="com.datavirtuality.dv.jdbc.Driver"
  url="jdbc:datavirtuality:datavirtuality@mms://<hostname>:45012"
  schema="myschema"
  user="myuser"
  password="mypw"
  preserve_tab_names=yes
  preserve_col_names=yes;
  /*materialized=yes; //Allows for permanment table creation */
```

- CAS Library creation

```sas
cas;
caslib dvcas desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                driverclass="com.datavirtuality.dv.jdbc.Driver",
                url="jdbc:datavirtuality:datavirtuality@mms://<hostname>:45012",
                schema="myschema",
                user="myuser",
                password="mypw");
caslib _all_ assign;
```
``
## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

|            Smoke Tests                           |                      |     |
| ------------------------------------- | -------------------- | --- |
| [**Table Creation Tests**](..#table-creation-tests) | | |
|                                       | Create Airline Table | &check; |
|                                       | Create Cars Table    | &check; |
| [**Proc SQL Tests**](..#proc-sql-tests) | | |
|                                       | Create Table         | &check; |
|                                       | Update Table         | &check; |
|                                       | Delete Table         | &check; |
|                                       | Insert into Table    | &check; |
|                                       | Drop Table           | &check; |
| [**Implicit SQL Test**](..#implicit-sql-tests) | | &check; |
| [**FEDSql Test**](..#fedsql-test) | | &check; |
| **Information Catalog Crawler Agent** | | |
|                                       | CAS Library Based Discovery Agent                     | &check; |
|                                       | SAS Compute Library Based Discovery Agent                     | &check; |
## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to Data Virtuality through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [Data Virtuality Support](https://support.datavirtuality.com/hc/en-us) section in the Data Virtuality documentation & support.