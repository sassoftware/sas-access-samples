 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: sdcFileInfo.sas                                          */
 /*   TITLE: SAS Data Connector to ODBC Sample Program: FileInfo      */
 /* PRODUCT: SAS/ACCESS to ODBC                                       */
 /*  SYSTEM: UNIX                                                     */
 /*     REF: SAS Viya Programming Documentation: CAS User's Guide     */
 /*   USAGE: Shows specific file information of the desired path      */
 /*    NOTE: Some interfaces are case sensitive. You  may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

/* Specify the DBMS engine, for example: ODBC */
%let srctype=odbc;

%let cas_session = mysess;
%let caslib_alias = datalib;


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
Oracle, Netezza, and MSSWL require catalog parameter */

%let username = ???????;
%let password = ???????;
%let database = ???????;
%let schema = ???????;

%let CONNOPTS=%str(user=???????
					pwd=???????
					dsn=???????);

/* Connect to CAS using cashost and casport, optional in SAS Studio */
/* options cashost="????????" casport=????; */


/* Create a CAS Session */
cas &cas_session;


/* Specify a path where the sample data is located */
%let path=???????;


/* Add a caslib with source type "path" that references the specified path*/
proc cas;
  session &cas_session;
  table.addCaslib / 
    caslib="mydata"
    datasource={srctype="path"}   
	path="&path";
run;
quit;


proc cas;
/* Run fileInfo action to list all file types in path*/
table.fileInfo /
    allfiles=true;


/* Run fileInfo action on a specific file name */
table.fileInfo /
    path='samdat1.csv';


/* Run fileInfo action on a specific file name, and displays size in Kilobytes */
table.fileInfo /
    path='samdat1.csv'
	kbytes=true;


/* Run fileInfo action on a specific file name with wildcards for file name */
table.fileInfo /
    path='%samdat1%';  


/* Run fileInfo action on a specific file name with wildcards for file type */
table.fileInfo /
    path='%.csv';  

run;
quit;


/* Remove CAS session */
cas &cas_session. terminate;
