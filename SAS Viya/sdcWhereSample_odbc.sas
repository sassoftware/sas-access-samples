%let srctype = odbc;
%let username = tktstst4;
%let password = ???;
%let database = tktssqlu8;
%let schema = tktstst4;

%let dataset = where_load;
%let cas_session = mysess;
%let caslib_alias = datalib;

%let kube_namespace = rp;

/*Connect to CAS*/
options cashost="controller.sas-cas-server-default.&kube_namespace..svc.cluster.local" casport=5570;
cas &cas_session;

/*Create a table in DBMS*/
/*Need to add server= option for other DBMS except ODBC*/
proc sql nocheck noerrorstop;
    connect to &srctype (user=&username pwd=&password dsn=&database);

    execute (begin tran) by &srctype;
    execute (create table &dataset (i int, j char(15), k int, l varchar(20), m date)) by &srctype;
    execute (insert into &dataset values(1,'China', 0, 'Abc', '1999-12-31' )) by &srctype;
    execute (insert into &dataset values(2,'Philippines', 200, 'Abc123', '1999-01-31')) by &srctype;
    execute (insert into &dataset values(3,'India', 300, 'DeF333', null)) by &srctype;
    execute (insert into &dataset values(4,'', 400, 'xYZ1122', '2009-10-31')) by &srctype;
    execute (insert into &dataset values(5,'null', 500, 'Abc432', '1996-12-01')) by &srctype;
    execute (insert into &dataset values(6, null, 600, '2233Abc', '1998-02-15')) by &srctype;
    execute (insert into &dataset values(7, 'USA', null, '44Abc44', '1978-04-15')) by &srctype;
    execute (insert into &dataset values(8, 'Russia', 1000, '', '1901-05-18')) by &srctype;
    execute (commit) by &srctype;
run;
quit;

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

libname caslib sasioca sessref=mysess tag="";

/*drop table in CAS*/
%macro oerdroptable(dataset, caslib_alias);
  proc cas;
    session &cas_session;
    action droptable
    caslib="&caslib_alias"
    table="&dataset"
    ;
  run;
  quit;
%mend oerdroptable;

/*Print dataset*/
%macro printdata(dsname);
    proc sql;
        select * from caslib.&dataset order by i;
    quit;
%mend printdata;


/*where with <>*/
proc cas;
    session mysess;
    action loadtable
    caslib="&caslib_alias" path="&dataset"
    where="j <> 'USA' and k < 100";
run;
quit;

%printdata(&dataset);
%oerdroptable(&dataset, &caslib_alias);


/*where with not null and empty string columns*/
proc cas;
    session mysess;
    action loadtable
    caslib="&caslib_alias" path="&dataset"
    where="j is not null and l=''";
run;
quit;

%printdata(&dataset);
%oerdroptable(&dataset, &caslib_alias);


/*where with IN*/
proc cas;
    session mysess;
    action loadtable
    caslib="&caslib_alias" path="&dataset"
	where="l in ('Abc', 'Abc123456', 'NotReal')";
run;
quit;

%printdata(&dataset);
%oerdroptable(&dataset, &caslib_alias);


/*where with BETWEEN*/
proc cas;
    session mysess;
    action loadtable
    caslib="&caslib_alias" path="&dataset"
	where="k between 350 and 450";
run;
quit;

%printdata(&dataset);
%oerdroptable(&dataset, &caslib_alias);


/*where with LIKE*/
proc cas;
    session mysess;
    action loadtable
    caslib="&caslib_alias" path="&dataset"
	where="j like 'P%' ";
run;
quit;

%printdata(&dataset);
%oerdroptable(&dataset, &caslib_alias);

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
