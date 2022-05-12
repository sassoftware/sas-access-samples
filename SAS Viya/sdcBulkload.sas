 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: sdcBulkload_cf.sas    	 	                              */
 /*   TITLE: SAS Data Connector Sample Program: Bulkload/Bulkunload   */
 /* PRODUCT: SAS/ACCESS                                               */
 /*  SYSTEM: UNIX                                                     */
 /*     REF: SAS Viya Programming Documentation: CAS User's Guide     */
 /*   USAGE: Showcases basic CASUTIL statements with bulkload 		  */
 /*  		  and bulkupload, in an end-to-end sample program         */
 /*    NOTE: Some interfaces are case sensitive. You  may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

/* Specify the DBMS engine, for example: ODBC */
%let srctype = postgres;


/*Specify connection parameters within a string

Edit the below variables with the required DBMS-specific conection options
Also, specify such variables within the CONNOPS string, as this will be used for the other sample programs

Most datasources will require username, password, database, and schema/server
Please refer to the connopts.xlsx file for specific connection requirements for each DBMS engine

BigQuery: requires protject and cred_path parameters
Hadoop: requires hadoopJarPath, hadoopConfigDir, and dtm parameters
Impala: requires port and conopts parameters
JDBC: requires url, class, and classpath parameters
Salesforce: requires authendpoint and catalog parameters
SAP Hana: requires instance and tabletype parameters
Teradata: requires dataTransferMode parameter
Oracle, Netezza, and MSSWL require catalog parameter

*/
%let username = ????????;
%let password = ????????;
%let database = ????????;
%let server = ????????;

%let cas_session = mysess;
%let caslib_alias = datalib;

%let CONNOPTS=%str(user="????????"
					pass="????????"
					database="????????"
					server="????????");

/* Connect to CAS using cashost and casport, optional in SAS Studio */
/* options cashost="????????" casport=????; */


/* Create cas session and cas libname statement*/
cas &cas_session;
libname caslib cas sessref=&cas_session tag="";


/* Execute addCaslib action*/
proc cas;
session &cas_session;
action addCaslib caslib="&caslib_alias" 
		datasource={ srctype="&srctype", 
			username="&username", 
			password="&password",
			database="&database",
			server="&server",
			bulkload=true,
			bulkunload=true} ;
run; 
quit;


/* Create sample load table in DBMS: using DBMS-specific Libname engine*/
libname gridlib &srctype &CONNOPTS;


/* Create sample dataset*/
data bulkloadsample;
   input name $ age sex $ bdate mmddyy.;
   datalines;
Amy 3 F 030185
Bill 12 M 121277
Charlie 35 M 010253
David 19 M 101469
Elinor 42 F 080845
Pearl 78 F 051222
Vera 96 F 101200
Frank 24 M 092663
Georgia 1 F 040687
Henry 46 M 053042
;
run;


/* creates and verifies data in CAS */
data caslib.bulksample;
   set work.bulkloadsample;
run;

proc print data=caslib.bulksample;
run;


/* proc casutil contents for the table in CAS */
proc casutil;
    contents casdata="bulksample";
quit;


/* save via bulkload and verify */
proc casutil;
    save casdata="bulksample" casout="bulksamplesave" replace;
quit;

proc print data=gridlib.bulksamplesave;
run;


/* load via bulkunload and verify */
proc casutil;
    load casdata="bulksamplesave" casout="bulksampleload";
    list tables;
quit;

proc print data=caslib.bulksampleload;
run;


/* clean up sources and drop tables */
proc casutil;
    deletesource casdata="bulksamplesave";
    droptable casdata="bulksample";
    droptable casdata="bulksampleload";
quit;


/* remove CAS session */
cas &cas_session. terminate;
