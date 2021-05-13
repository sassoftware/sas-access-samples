%let srctype = odbc;
%let username = tktstst4;
%let password = ???;
%let database = tktssqlu8;
%let schema = tktstst4;

%let dataset = read_only;
%let datasetload = read_only_load;
%let cas_session = mysess;
%let caslib_alias = datalib;

%let kube_namespace = rp;

/*Connect to CAS*/
options cashost="controller.sas-cas-server-default.&kube_namespace..svc.cluster.local" casport=5570;
cas &cas_session;

/*Create a table in DBMS*/
/*Need to add server= option for other DBMS except ODBC in libname statment*/
libname gridlib &srctype user=&username pwd=&password dsn=&database;
%macro createTable(dsname, nrows);
    data gridlib.&dsname;
        DO i = 1 TO &nrows;
            j = i-50;
            w = i/10;
            OUTPUT;
        END;
    RUN;
%mend createTable;
%createTable(&dataset, 20);

/*Execute addCaslib action*/
/*1. catalog= option is dedicated for ODBC_SQLSERVER*/
/*2. Other DBMS should add server= option*/
proc cas; 
	session &cas_session; 
	action addCaslib caslib="&caslib_alias" 
		datasource={srctype="&srctype", 
			username="&username", 
			password="&password",
			database="&database",
            schema="&schema",
            catalog="*"}; 
run;
quit;

/*loadtable action*/
proc cas;
	session &cas_session; 
	action loadtable
	casout={name="&datasetload"}
	caslib="&caslib_alias" 
	path="&dataset"; 
run; 
quit;

libname caslib cas sessref=mysess tag="";
proc print data=caslib.&datasetload;
run;

/* Clean-up */
proc cas;
    session &cas_session;
    action deleteSource
    caslib="&caslib_alias"
    source="&dataset"
    ;
run;
quit;

/*Remove CAS session*/
cas &cas_session. terminate;
