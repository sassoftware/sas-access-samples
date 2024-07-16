# SQLite

## Introduction

SQLite is an in-process library that implements a [self-contained](https://www.sqlite.org/selfcontained.html), [serverless](https://www.sqlite.org/serverless.html), [zero-configuration](https://www.sqlite.org/zeroconf.html), [transactional](https://www.sqlite.org/transactional.html) SQL database engine. The code for SQLite is in the [public domain](https://www.sqlite.org/copyright.html) and is thus free for use for any purpose, commercial or private. SQLite is the [most widely deployed](https://www.sqlite.org/mostdeployed.html) database in the world with more applications than we can count, including several [high-profile projects.](https://www.sqlite.org/famous.html)

SQLite is an embedded SQL database engine. Unlike most other SQL databases, SQLite does not have a separate server process. SQLite reads and writes directly to ordinary disk files. A complete SQL database with multiple tables, indices, triggers, and views, is contained in a single disk file. The database [file format](https://www.sqlite.org/fileformat2.html) is cross-platform - you can freely copy a database between 32-bit and 64-bit systems or between [big-endian](http://en.wikipedia.org/wiki/Endianness) and [little-endian](http://en.wikipedia.org/wiki/Endianness) architectures. These features make SQLite a popular choice as an [Application File Format](https://www.sqlite.org/appfileformat.html). SQLite database files are a [recommended storage format](https://www.sqlite.org/locrsf.html) by the US Library of Congress. Think of SQLite not as a replacement for [Oracle](http://www.oracle.com/database/index.html) but as a replacement for [fopen()](http://man.he.net/man3/fopen)

SQLite is a compact library. With all features enabled, the [library size](https://www.sqlite.org/footprint.html) can be less than 750KiB, depending on the target platform and compiler optimization settings. (64-bit code is larger. And some compiler optimizations such as aggressive function inlining and loop unrolling can cause the object code to be much larger.) There is a tradeoff between memory usage and speed. SQLite generally runs faster the more memory you give it. Nevertheless, performance is usually quite good even in low-memory environments. Depending on how it is used, SQLite can be [faster than direct filesystem I/O](https://www.sqlite.org/fasterthanfs.html).

SQLite is [very carefully tested](https://www.sqlite.org/testing.html) prior to every release and has a reputation for being very reliable. Most of the SQLite source code is devoted purely to testing and verification. An automated test suite runs millions and millions of test cases involving hundreds of millions of individual SQL statements and achieves [100% branch test coverage](https://www.sqlite.org/testing.html#coverage). SQLite responds gracefully to memory allocation failures and disk I/O errors. Transactions are [ACID](http://en.wikipedia.org/wiki/ACID) even if interrupted by system crashes or power failures. All of this is verified by the automated tests using special test harnesses which simulate system failures. Of course, even with all this testing, there are still bugs. But unlike some similar projects (especially commercial competitors) SQLite is open and honest about all bugs and provides [bugs lists](https://www.sqlite.org/src/rptview?rn=1) and minute-by-minute [chronologies](https://www.sqlite.org/src/timeline) of code changes.

The SQLite code base is supported by an [international team](https://www.sqlite.org/crew.html) of developers who work on SQLite full-time. The developers continue to expand the capabilities of SQLite and enhance its reliability and performance while maintaining backwards compatibility with the [published interface spec](https://www.sqlite.org/c3ref/intro.html), [SQL syntax](https://www.sqlite.org/lang.html), and database [file format](https://www.sqlite.org/fileformat2.html). The source code is absolutely free to anybody who wants it, but [professional support](https://www.sqlite.org/prosupport.html) is also available.

The SQLite project was started on [2000-05-09](https://www.sqlite.org/src/timeline?c=2000-05-29+14:26:00). The future is always hard to predict, but the intent of the developers is to support SQLite through the year 2050. Design decisions are made with that objective in mind.

We the developers hope that you find SQLite useful and we entreat you to use it well: to make good and beautiful products that are fast, reliable, and simple to use. Seek forgiveness for yourself as you forgive others. And just as you have received SQLite for free, so also freely give, paying the debt forward.


## Resources

- [SQLite Official Web Site](https://www.sqlite.org/index.html)
- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/n1usgr00wc9cvln1gnyp1807qu17.htm)
- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)

## Prerequisites

Before you can connect to SQLite through JDBC from  SAS Viya, you need to have the following:

1. Access to a SQLite database: You must have access to a SQLite database with the appropriate credentials.

2. SQLite JDBC driver: You must download and install the [SQLite JDBC driver](https://github.com/xerial/sqlite-jdbc/releases/download/3.46.0.0/sqlite-jdbc-3.46.0.0.jar). 

3. Working installation of SAS Viya

**To install the JDBC driver:**

1. Download the [SQLite JDBC driver](https://github.com/xerial/sqlite-jdbc/releases/download/3.46.0.0/sqlite-jdbc-3.46.0.0.jar)

2. Unzip the JDBC driver into a location on the SAS Viya server.

## Overview

| SQLite              |                                                                                   |
| ------------------- | --------------------------------------------------------------------------------- |
| **Company URL**     | https://www.sqlite.org                                                     |
| **JDBC JAR File**   | [sqlite-jdbc-3.46.0.0](https://github.com/xerial/sqlite-jdbc/releases/download/3.46.0.0/sqlite-jdbc-3.46.0.0.jar) |
| **JDBC URL Syntax** | "jdbc:sqlite://<file>                           |
| **JDBC Class**      | org.sqlite.JDBC                                                          |

## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to SQLite using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname mylib sasiojdb
  URL="jdbc:sqlite://<file>"
  preserve_names=yes;
```

- CAS Library creation

```sas
caslib mycaslib desc='JDBC Caslib'
   dataSource=(srctype='jdbc',
                url="jdbc:sqlite://<file>");
```

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

| [**Table Creation Tests**](..#table-creation-tests)                  |                      |     |
| ------------------------------------- | -------------------- | --- |
|                                       | Create Airline Table | &check;  |
|                                       | Create Cars Table    | &check;  |
| [**Proc SQL Tests**](..#proc-sql-tests)                    |                      |     |
|                                       | Create Table         | &check;  |
|                                       | Update Table         | Failed |
|                                       | Delete Table         | &check;  |
|                                       | Insert into Table    | &check;  |
|                                       | Drop Table           | &check;  |
| [**Implicit SQL Test**](..#implicit-sql-tests)               |                      | &check;  |
| [**FEDSql Test**](..#fedsql-test)                      |                      | Failed  |
| **Information Catalog Crawler Agent** |                      | &check;  |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to SQLite through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```
