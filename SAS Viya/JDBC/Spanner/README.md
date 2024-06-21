# Spanner

## Introduction

Spanner is a fully managed, mission-critical database service that offers transactional consistency at global scale, automatic, synchronous replication for high availability, and support for two SQL dialects: GoogleSQL (ANSI 2011 with extensions) and PostgreSQL.

## Resources

- [Spanner Documentation](https://cloud.google.com/spanner/docs/)
- [Spanner JDBC Drivers](https://cloud.google.com/spanner/docs/jdbc-drivers)

## Prerequisites

***Note: we assume here that the Spanner database to access is configured with the Google Standard SQL dialect. For a Spanner database configured with the PostgreSQL dialect, see Access a PostgreSQL dialect database.***

Before you can connect to Spanner through JDBC from SAS Viya, you need to have the following:

1. Access to a Spanner instance and database (Google Standard SQL dialect) with a Service Account credentials file.

2. [Spanner JDBC Driver](https://cloud.google.com/spanner/docs/jdbc-drivers) from Google.

***Note: there seems to be two drivers available to connect a Google Standard SQL dialect database. However the links to download the Simba version are broken.***

3. Working installation of SAS Viya.

**To install the JDBC driver:**

1. Download the Spanner JDBC driver from this [site](https://cloud.google.com/spanner/docs/jdbc-drivers).

   - Click on **Maven Central** > **Versions** > **Browse** (on the latest version, 2.19.3 at the time these instructions were written). You should land to a page similar to [this](https://repo1.maven.org/maven2/com/google/cloud/google-cloud-spanner-jdbc/2.19.3/).

   - Download the biggest file with a name corresponding to google-cloud-spanner-jdbc-X.XX.X-single-jar-with-dependencies.jar

2. Copy the JDBC driver in /data-drivers/jdbc according to the [instructions](https://support.sas.com/documentation/installcenter/viya/SASViyaReadMe.htm#139721599534704specify-external-jdbc-drivers) provided by SAS.

   ![](images/franir_2024-06-19-13-58-48.png)

## Overview

| Spanner                    |                                                                                   |
| -------------------------- | --------------------------------------------------------------------------------- |
| **Company URL**            | https://cloud.google.com/spanner                                                  |
| **JDBC JAR File Path**     | [google-cloud-spanner-jdbc-2.19.3-single-jar-with-dependencies.jar](https://repo1.maven.org/maven2/com/google/cloud/google-cloud-spanner-jdbc/2.19.3/google-cloud-spanner-jdbc-2.19.3-single-jar-with-dependencies.jar) |
| **JDBC URL Syntax**        | jdbc:cloudspanner:/projects/\<project\>/instances/\<instance-name\>/databases/\<database-name\>?credentials=\<credentials-file-path\>;lenient=true |
| **Default Port**           | N/A                                                                               |
| **JDBC Driver Class Name** | com.google.cloud.spanner.jdbc.JdbcDriver                                          |

## Setting up the connection

This section provides step-by-step instructions on how to set up the connection to Spanner using JDBC from SAS Viya Compute or CAS.

- SAS Compute Library creation

```sas
libname spanner jdbc
   url="jdbc:cloudspanner:/projects/<project>/instances/<instance>/databases/<database>?credentials=<credentials-file-path>;lenient=true"
   preserve_names=yes
   ;
```

- CAS Library creation

```sas
caslib casspan datasource=(srctype="jdbc"
   url="jdbc:cloudspanner:/projects/<project>/instances/<instance>/databases/<database>?credentials=<credentials-file-path>;lenient=true",
   ) libref=casspan ;
```

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

| Smoke Tests                                         | Item                                            | Comments                                                                           |
| --------------------------------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------------------- |
| **Listing contents**                                |                                                 |                                                                                    |
|                                                     | From SAS Compute                                | X (unable to list tables from the default "no name" schema)                        |
|                                                     | From CAS                                        | &check; (unable to narrow down the list of tables to the default "no name" schema) |
| **Reading data**                                    |                                                 |                                                                                    |
|                                                     | From SAS Compute (extract in SAS)               | &check; (need to know the table name)                                              |
|                                                     | From CAS (load in CAS)                          | &check;                                                                            |
| [**Table Creation Tests**](..#table-creation-tests) |                                                 |                                                                                    |
|                                                     | Create Table (using DATA Step) from SAS Compute | X (wrong syntax generated)                                                         |
|                                                     | Save Table from CAS                             | X (wrong syntax generated)                                                         |
| **Append data**                                     |                                                 | &check;                                                                            |
| [**Proc SQL Tests**](..#proc-sql-tests)             |                                                 |                                                                                    |
|                                                     | Create Table                                    | X (wrong syntax generated)                                                         |
|                                                     | Update Table                                    | &check;                                                                            |
|                                                     | Delete Rows from a Table                        | &check;                                                                            |
|                                                     | Insert into Table                               | &check;                                                                            |
|                                                     | Drop Table                                      | &check;                                                                            |
| [**Implicit SQL Test**](..#implicit-sql-tests)      |                                                 | &check;                                                                            |
| [**FEDSql Test**](..#fedsql-test)                   |                                                 | X (issue with "no name" schema)                                                    |
| **Information Catalog Crawler Agent**               |                                                 |                                                                                    |
|                                                     | CAS Library Based Discovery Agent               | &check; (unable to narrow down the list of tables to the default "no name" schema) |
|                                                     | SAS Compute Library Based Discovery Agent       | X (unable to list table from the default "no name" schema)                         |

## Troubleshooting

This section provides guidance on how to troubleshoot common issues that may arise when connecting to Spanner through JDBC from SAS Studio on SAS Viya. This may include issues with the JDBC driver, connectivity issues, or issues with data access and retrieval.

You can run the following code for getting full detailed log.

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax;
```

## Access a PostgreSQL Dialect Database

### Introduction

When you create a new database in Spanner, you have a choice between GoogleSQL and PostgreSQL dialects. More information [here](https://cloud.google.com/spanner/docs/postgresql-interface).

If you need to access a PostgreSQL dialect database, you have 2 options with SAS:

- using the native PostgreSQL engine
- using [JDBC access](https://cloud.google.com/spanner/docs/jdbc-drivers) and a [PostgreSQL JDBC driver](https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar)

In both cases, an adapter is needed and is provided by Google: [PGAdapter](https://cloud.google.com/spanner/docs/pgadapter).

Example of how to run PGAdapter using Docker:

```shell
docker run -d -p 5432:5432 \
    -v <credentials-file-path>:/credentials.json \
    gcr.io/cloud-spanner-pg-adapter/pgadapter:latest \
    -p <project> -i <instance> -d <database> \
    -c /credentials.json -x
```

The server on which this adapter runs will be the server targeted in the SAS instructions (LIBNAME or CASLIB).

### Setting up the connection

This section provides step-by-step instructions on how to set up the connection to Spanner configured with a PostgreSQL dialect from SAS Viya Compute or CAS.

If using JDBC, copy the [PostgreSQL JDBC driver](https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar) in /data-drivers/jdbc according to the [instructions](https://support.sas.com/documentation/installcenter/viya/SASViyaReadMe.htm#139721599534704specify-external-jdbc-drivers) provided by SAS.

- Using the PostgreSQL engine
  
  - SAS Compute Library creation

  ```sas
  libname spanner postgres user="dummy" password="dummy" database="dummy" 
     schema="public" server="<PGAdapter-server>" preserve_names=yes
     ; 
  ```

  - CAS Library creation

  ```sas
  caslib casspan datasource=(srctype="postgres"
     schema="public" server="<PGAdapter-server>"
  ) libref=casspan ; 
  ```

- Using the JDBC engine
  
  - SAS Compute Library creation

  ```sas
  libname spanner jdbc 
     url="jdbc:postgresql://<PGAdapter-server>:5432/<database>"
     preserve_names=yes
     ;
  ```

  - CAS Library creation

  ```sas
  caslib casspan datasource=(srctype="jdbc"
     url="jdbc:postgresql://<PGAdapter-server>:5432/<database>" schema="public"
     ) libref=casspan ;
  ```

## Smoke Testing

| Smoke Tests                                         | Item                                            | Using the PostgreSQL engine           | Using the JDBC engine and a PostgreSQL JDBC driver |
| --------------------------------------------------- | ----------------------------------------------- | ------------------------------------- | -------------------------------------------------- |
| **Listing contents**                                |                                                 |                                       |                                                    |
|                                                     | From SAS Compute                                | X (unsupported Postgres expression)   | &check;                                            |
|                                                     | From CAS                                        | X (unsupported Postgres expression)   | &check;                                            |
| **Reading data**                                    |                                                 |                                       |                                                    |
|                                                     | From SAS Compute (extract in SAS)               | &check; (need to know the table name) | &check;                                            |
|                                                     | From CAS (load in CAS)                          | &check; (need to know the table name) | &check;                                            |
| [**Table Creation Tests**](..#table-creation-tests) |                                                 |                                       |                                                    |
|                                                     | Create Table (using DATA Step) from SAS Compute | X (requires a primary key)            | X (requires a primary key)                         |
|                                                     | Save Table from CAS                             | X (requires a primary key)            | X (requires a primary key)                         |
| **Append data**                                     |                                                 | X (bad syntax generation)             | &check;                                            |
| [**Proc SQL Tests**](..#proc-sql-tests)             |                                                 |                                       |                                                    |
|                                                     | Create Table                                    | X (requires a primary key)            | X (requires a primary key)                         |
|                                                     | Update Table                                    | &check;                               | &check;                                            |
|                                                     | Delete Rows from a Table                        | &check;                               | &check;                                            |
|                                                     | Insert into Table                               | &check;                               | &check;                                            |
|                                                     | Drop Table                                      | &check;                               | &check;                                            |
| [**Implicit SQL Test**](..#implicit-sql-tests)      |                                                 | &check;                               | &check;                                            |
| [**FEDSql Test**](..#fedsql-test)                   |                                                 | X (bad schema generation)             | &check;                                            |
| **Information Catalog Crawler Agent**               |                                                 |                                       |                                                    |
|                                                     | CAS Library Based Discovery Agent               | X (unable to list tables)             | &check;                                            |
|                                                     | SAS Compute Library Based Discovery Agent       | X (unable to list tables)             | &check;                                            |


## Appendices

### SAS Testing Program for a Google SQL Dialect Database

```sas
/* Driver class: com.google.cloud.spanner.jdbc.JdbcDriver */
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax ;

/* Connect: OK */
libname spanner jdbc 
   url="jdbc:cloudspanner:/projects/sas-gelsandbox/instances/gel-spanner/databases/gel-gs-sql?credentials=/gcpdm/sa/.gel-sas-user.json;lenient=true"
   preserve_names=yes
   ;


/* List: KO */
/* Unable to list tables from the default "no name" schema */ 
proc datasets lib=spanner ;
quit ;


/* Read: OK */
proc print data=spanner.singers ;
run ;


/* Create with data step: KO */
proc delete data=spanner.airline ;
run ;
data spanner.airline ;
   set sashelp.airline ;
run ;


/* Create with proc sql: KO */
proc delete data=spanner.class ;
run ;
proc sql ;
   create table spanner.class as select * from sashelp.class ;
quit ;


/* Update with proc sql: OK */
proc sql ;
   update spanner.singers set FirstName='Marcel' where FirstName='Paul' ;
quit ;


/* Delete rows with proc sql: OK */
proc sql ;
   delete from spanner.singers where FirstName='Marcel' ;
quit ;


/* Insert rows with proc sql: OK */
proc sql ;
   insert into spanner.singers(SingerId, FirstName) values (11,'Ted') ;
quit ;


/* Delete table proc delete: OK */
proc delete data=spanner.singers ;
run ;


/* Delete table proc sql: OK */
proc sql ;
   drop table spanner.singers ;
quit ;


/* Query table proc sql: OK */
proc sql ;
   select age **2 from spanner.singers ;
quit ;
proc sql ;
   select distinct age **2 from spanner.singers ;
quit ;


/* fedSQL: KO */
/* IPTRACE shows the generated query */
options msglevel=n ;
proc fedsql iptrace ;
   select * from spanner.singers ;
quit ;


/* CAS connect: OK */
/* Connection happens when "list files" is run */
cas _all_ terminate ;
cas mysession ;

/* Drop caslib if exists */
proc cas ;
   action table.dropCaslib / caslib="casspan" quiet=true ;
quit ;

/* Define a Spanner caslib */
caslib casspan datasource=(srctype="jdbc"
   url="jdbc:cloudspanner:/projects/sas-gelsandbox/instances/gel-spanner/databases/gel-gs-sql?credentials=/gcpdm/sa/.gel-sas-user.json;lenient=true",
   ) libref=casspan ;

/* List Spanner tables: OK but unable to narrow down the list of tables to the default "no name" schema */
proc casutil incaslib="casspan" ;
   list files ;
quit ;


/* CAS load table: OK */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   load casdata="singers" casout="singers" ;
quit ;


/* CAS save table: KO */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   save casdata="singers" casout="singers2" ;
quit ;
```

### SAS Testing Program for a PostgreSQL Dialect Database using PostgreSQL engine

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax ;

/* Connect: OK */
libname spanner postgres user="dummy" password="dummy" database="dummy" 
   schema="public" server="rext03-0063.race.sas.com" preserve_names=yes
   ; 


/* List: KO */
/* unsupported Postgres expression to list tables */ 
proc datasets lib=spanner ;
quit ;


/* Read: OK */
proc print data=spanner.facilities ;
run ;


/* Create with data step: KO */
/* requires a primary key */
proc delete data=spanner.class ;
run ;
data spanner.class ;
   set sashelp.class ;
run ;


/* Create with proc sql: KO */
/* requires a primary key */
proc delete data=spanner.class2 ;
run ;
proc sql ;
   create table spanner.class2 as select * from sashelp.class ;
quit ;


/* Create with explicit PT OK */
proc delete data=spanner.class ;
run ;
proc sql ;
   connect using spanner ;
   execute (
      CREATE TABLE "class" ("Name" VARCHAR(8),"Sex" VARCHAR(1),"Age" DOUBLE PRECISION,"Height" DOUBLE PRECISION,"Weight" DOUBLE PRECISION, PRIMARY KEY("Name"))
   ) by spanner ;
   disconnect from spanner ;
quit ;
/* Append KO */
/* Bad syntax generation */
proc append base=spanner.class data=sashelp.class ;
run ;


/* Update with proc sql: OK */
proc sql ;
   update spanner.facilities set name='Pickleball Court 2' where name='Tennis Court 2' ;
quit ;


/* Delete rows with proc sql: OK */
proc sql ;
   delete from spanner.facilities where name='Pickleball Court 2' ;
quit ;


/* Insert rows with proc sql: OK */
proc sql ;
   insert into spanner.facilities(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) values (9, 'PingPong table', 0, 5, 400, 15) ;
quit ;


/* Delete table proc delete: OK */
proc delete data=spanner.class ;
run ;


/* Delete table proc sql: OK */
proc sql ;
   drop table spanner.facilities ;
quit ;


/* Query table proc sql: OK */
proc sql ;
   select membercost **2 from spanner.facilities ;
quit ;
proc sql ;
   select distinct membercost **2 from spanner.facilities ;
quit ;


/* fedSQL: KO */
/* IPTRACE shows the generated query */
/* bad schema generation */
options msglevel=n ;
proc fedsql iptrace ;
   select * from spanner.facilities ;
quit ;


/* CAS connect: OK */
/* Connection happens when "list files" is run */
cas _all_ terminate ;
cas mysession ;

/* Drop caslib if exists */
proc cas ;
   action table.dropCaslib / caslib="casspan" quiet=true ;
quit ;

/* Define a Spanner caslib */
caslib casspan datasource=(srctype="postgres"
   schema="public" server="rext03-0063.race.sas.com"
) libref=casspan ; 

/* List Spanner tables: KO */
/* unsupported Postgres expression to list tables */
proc casutil incaslib="casspan" ;
   list files ;
quit ;


/* CAS load table: OK */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   load casdata="facilities" casout="facilities" replace ;
quit ;

/* CAS save table: KO */
/* requires a primary key */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   save casdata="facilities" casout="facilities2" ;
quit ;
```

### SAS Testing Program for a PostgreSQL Dialect Database using JDBC engine

```sas
options sastrace=',,,d' sastraceloc=saslog nostsuffix msglevel=i
linesize=132 pagesize=max validvarname=any validmemname=extend noquotelenmax ;

/* Connect: OK */
libname spanner jdbc 
   url="jdbc:postgresql://rext03-0063.race.sas.com:5432/gel-gs-sql"
   preserve_names=yes
   ;


/* List: OK */
proc datasets lib=spanner ;
quit ;


/* Read: OK */
proc print data=spanner.facilities ;
run ;


/* Create with data step: KO */
/* requires a primary key */
proc delete data=spanner.class ;
run ;
data spanner.class ;
   set sashelp.class ;
run ;


/* Create with proc sql: KO */
/* requires a primary key */
proc delete data=spanner.class2 ;
run ;
proc sql ;
   create table spanner.class2 as select * from sashelp.class ;
quit ;


/* Create with explicit PT OK */
proc delete data=spanner.class ;
run ;
proc sql ;
   connect using spanner ;
   execute (
      CREATE TABLE "class" ("Name" VARCHAR(8),"Sex" VARCHAR(1),"Age" DOUBLE PRECISION,"Height" DOUBLE PRECISION,"Weight" DOUBLE PRECISION, PRIMARY KEY("Name"))
   ) by spanner ;
   disconnect from spanner ;
quit ;
/* Append OK */
proc append base=spanner.class data=sashelp.class ;
run ;


/* Update with proc sql: OK */
proc sql ;
   update spanner.facilities set name='Pickleball Court 2' where name='Tennis Court 2' ;
quit ;


/* Delete rows with proc sql: OK */
proc sql ;
   delete from spanner.facilities where name='Pickleball Court 2' ;
quit ;


/* Insert rows with proc sql: OK */
proc sql ;
   insert into spanner.facilities(facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) values (9, 'PingPong table', 0, 5, 400, 15) ;
quit ;


/* Delete table proc delete: OK */
proc delete data=spanner.class ;
run ;


/* Delete table proc sql: OK */
proc sql ;
   drop table spanner.facilities ;
quit ;


/* Query table proc sql: OK */
proc sql ;
   select membercost **2 from spanner.facilities ;
quit ;
proc sql ;
   select distinct membercost **2 from spanner.facilities ;
quit ;


/* fedSQL: OK */
/* IPTRACE shows the generated query */
options msglevel=n ;
proc fedsql iptrace ;
   select * from spanner."facilities" ;
quit ;


/* CAS connect: OK */
/* Connection happens when "list files" is run */
cas _all_ terminate ;
cas mysession ;

/* Drop caslib if exists */
proc cas ;
   action table.dropCaslib / caslib="casspan" quiet=true ;
quit ;

/* Define a Spanner caslib */
caslib casspan datasource=(srctype="jdbc"
   url="jdbc:postgresql://rext03-0063.race.sas.com:5432/gel-gs-sql" schema="public"
   ) libref=casspan global ;

/* List Spanner tables: OK */
proc casutil incaslib="casspan" ;
   list files ;
quit ;


/* CAS load table: OK */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   load casdata="facilities" casout="facilities" replace ;
quit ;

/* CAS save table: KO */
proc casutil incaslib="casspan" outcaslib="casspan" ;
   save casdata="facilities" casout="facilities2" ;
quit ;
```
