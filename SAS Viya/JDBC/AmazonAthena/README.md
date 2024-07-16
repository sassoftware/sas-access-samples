# Amazon Athena

## Introduction

Amazon Athena is an interactive query service that makes it easy to analyze data directly in Amazon Simple Storage Service (Amazon S3) using standard SQL. With a few actions in the AWS Management Console, you can point Athena at your data stored in Amazon S3 and begin using standard SQL to run ad-hoc queries and get results in seconds.

For more information, see [Getting started](https://docs.aws.amazon.com/athena/latest/ug/getting-started.html).

Amazon Athena also makes it easy to interactively run data analytics using Apache Spark without having to plan for, configure, or manage resources. When you run Apache Spark applications on Athena, you submit Spark code for processing and receive the results directly. Use the simplified notebook experience in Amazon Athena console to develop Apache Spark applications using Python or [Athena notebook APIs](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-api-list.html).

For more information, see [Getting started with Apache Spark on Amazon Athena](https://docs.aws.amazon.com/athena/latest/ug/notebooks-spark-getting-started.html).

Athena SQL and Apache Spark on Amazon Athena are serverless, so there is no infrastructure to set up or manage, and you pay only for the queries you run. Athena scales automatically—running queries in parallel—so results are fast, even with large datasets and complex queries.

## Resources

- [Amazon Athena Documentation](https://docs.aws.amazon.com/athena/)
- [Amazon Athena User Guide](https://docs.aws.amazon.com/athena/latest/ug/what-is.html)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)
- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)

## Prerequisites

Before you can connect to Amazon Athena through JDBC from  SAS Viya, you need to have the following:

1. Access to a Amazon Athena database: You must have access to a Amazon Athena database with the appropriate credentials.

2. Amazon Athena JDBC driver: You must download and install the [Amazon Athena JDBC driver](https://downloads.athena.us-east-1.amazonaws.com/drivers/JDBC/SimbaAthenaJDBC-2.1.5.1001/AthenaJDBC42-2.1.5.1001.jar). 

3. Working installation of SAS Viya

**To install the JDBC driver:**

1. Download the [Amazon Athena JDBC driver](https://downloads.athena.us-east-1.amazonaws.com/drivers/JDBC/SimbaAthenaJDBC-2.1.5.1001/AthenaJDBC42-2.1.5.1001.jar)

2. Unzip the JDBC driver into a location on the SAS Viya server.

## Overview

| Amazon Athena              |                                                                                   |
| ------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | https://Amazon Athena.com                                                                |
| **JDBC JAR File**   | [Amazon Athena-jdbc-2.1.5](https://downloads.athena.us-east-1.amazonaws.com/drivers/JDBC/SimbaAthenaJDBC-2.1.5.1001/AthenaJDBC42-2.1.5.1001.jar) |
| **JDBC URL Syntax** | jdbc:awsathena://AwsRegion=<AwsRegion>;S3OutputLocation=<S3Location>;AwsCredentialsProviderClass=com.simba.athena.amazonaws.auth.profile.ProfileCredentialsProvider;AwsCredentialsProviderArguments=default|
| **Default Port**    | 444                                                              |
| **JDBC Class**      | com.simba.athena.jdbc.Driver                                                       |

## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to Amazon Athena using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib sasiojdb
  URL="jdbc:awsathena://AwsRegion=<AwsRegion>;S3OutputLocation=<S3Location>;AwsCredentialsProviderClass=com.simba.athena.amazonaws.auth.profile.ProfileCredentialsProvider;AwsCredentialsProviderArguments=default"
  schema="myschema";
```

- CAS Library creation

```sas
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                url="jdbc:awsathena://AwsRegion=<AwsRegion>;S3OutputLocation=<S3Location>;AwsCredentialsProviderClass=com.simba.athena.amazonaws.auth.profile.ProfileCredentialsProvider;AwsCredentialsProviderArguments=default",
                schema="myschema");
```

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

| [**Table Creation Tests**](..#table-creation-tests)                  |                      |     |
| ------------------------------------- | -------------------- | --- |
|                                       | Create Airline Table |   |
|                                       | Create Cars Table    |   |
| [**Proc SQL Tests**](..#proc-sql-tests)                    |                      |     |
|                                       | Create Table         |   |
|                                       | Update Table         |   |
|                                       | Delete Table         |   |
|                                       | Insert into Table    |   |
|                                       | Drop Table           |   |
| [**Implicit SQL Test**](..#implicit-sql-tests)               |                      |   |
| [**FEDSql Test**](..#fedsql-test)                      |                      |   |
| **Information Catalog Crawler Agent** |                      |   |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to Amazon Athena through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

You can refer to the [Troubleshooting](https://downloads.athena.us-east-1.amazonaws.com/drivers/JDBC/SimbaAthenaJDBC-2.1.5.1000/docs/Simba+Amazon+Athena+JDBC+Connector+Install+and+Configuration+Guide.pdf) section in the Amazon Athena documentation
