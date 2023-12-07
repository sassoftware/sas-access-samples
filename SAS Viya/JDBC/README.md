# 3rd Party JDBC Drivers Review

## Overview



| Database                          | Smoke Testing Date | Driver Version |
| --------------------------------- | ------------------ | -------------- |
| [Data Virtuality](DataVirtuality/README.md)                        | 2023-10-19 | datavirtuality-jdbc_4.0.3.jar |
| [Denodo](Denodo/README.md)                           | 2023-07-31 | denodo-vdp-jdbcdriver-8.0-update-20230301.jar |
| [SQream](SQream/README.md)       | 2023-07-31 | sqream-jdbc-4.5.9 |
| [Trino](Trino/README.md)       | In progress | trino-jdbc-434.jar |


## Getting Started

SAS/ACCESS Interface to JDBC includes SAS Data Connector to JDBC. SAS/ACCESS Interface to JDBC enables access to relational databases by means of SQL and the Java Database Connectivity (JDBC) API. A JDBC driver is required for the data source from which you want to access data. JDBC drivers are available from DBMS vendors and other third-party JDBC driver developers.

- [SAS/ACCESS Interface to JDBC](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/p1soj7yuc1975yn1nndc3s11dhsv.htm)

- [Support for JDBC on the SAS Viya Platform](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/acreldb/p1soj7yuc1975yn1nndc3s11dhsv.htm)

- [JDBC Data Connector](https://go.documentation.sas.com/doc/en/pgmsascdc/v_038/casref/n1ldk5vubre9oen10bdqoqkfc1y7.htm)

## Smoke Testing

This section explains how to perform a smoke test to ensure that the connection is working correctly. A smoke test is a quick and simple test that verifies that the basic functionality of the connection is working as expected.

### Table Creation Tests

- Create Airline Table

```sas
proc delete data=mylib.airline;
run;
data mylib.airline; set sashelp.airline;
run;
```

- Create Class Table

```sas
proc delete data=mylib.class;
run;
data mylib.class; set sashelp.class;
run;
```

### Proc SQL Tests

- Create Table

```sas
proc delete data=mylib.class2;
run;
proc sql;
create table mylib.class2 as select * from mylib.class;
quit;
```

- Update Table

```sas
proc sql;
update mylib.class set name='billyb' where name='Alfred';
quit;
```

- Delete Table

```sas
proc sql;
delete from mylib.class where name = 'Alfred';
quit;
```

- Insert into Table

```sas
proc sql;
insert into mylib.class (name) values ('ted');
quit;
proc delete data=mylib.class2 mylib.class;
run;
```

- Drop Table

```sas
/* expect table not there, common problem */
/* an ERROR message means table not found wasn’t detected */
proc sql;
drop table mylib.nosuch;
quit;
```

### Implicit SQL Tests

```sas
data mylib.class;
set sashelp.class;
run;

proc sql;
select age **2 from mylib.class;
quit;

proc sql;
select distinct age **2 from mylib.class;
quit;
```

### FedSQL Test

Simple Proc fesql demonstrates LIBNAME options conveyed from LIBNAME to TKTS.

```sas
/* IPTRACE shows the generated query */
options msglevel=n;

proc fedsql iptrace;
select * from mylib.class;
quit;
```
