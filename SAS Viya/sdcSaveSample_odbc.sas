%let srctype = odbc;
%let username = tktstst4;
%let password = ???;
%let database = tktssqlu8;
%let schema = tktstst4;

%let dataset = save_only;
%let datasetout = save_only_out;
%let cas_session = mysess;
%let caslib_alias = datalib;

%let kube_namespace = rp;

/*Connect to CAS*/
options cashost="controller.sas-cas-server-default.&kube_namespace..svc.cluster.local" casport=5570;
cas &cas_session;

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

/*Create a table in CAS*/
libname caslib cas sessref=mysess tag="";
%macro createTable(dsname, nrows);
    data caslib.&dsname;
        DO i = 1 TO &nrows;
            j = i-50;
            w = i/10;
            OUTPUT;
        END;
    RUN;
%mend createTable;
%createTable(&dataset, 20);

/*save action*/
proc cas ;
   save
   caslib="&caslib_alias"
   name="&datasetout"
   table={caslib="&caslib_alias" ,name="&dataset"};
run;
quit;

/*Need to add server= option for other DBMS except ODBC in libname statment*/
libname gridlib &srctype user=&username pwd=&password dsn=&database;
proc print data=gridlib.&datasetout;
run;

/* Clean-up */
proc cas;
    session &cas_session;
    action deleteSource
    caslib="&caslib_alias"
    source="&datasetout"
    ;
run;
quit;

/*Remove CAS session*/
cas &cas_session. terminate;
