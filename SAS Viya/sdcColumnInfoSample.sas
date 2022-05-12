 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: sdcColumninfo.sas                                        */
 /*   TITLE: SAS Data Connector to ODBC Sample Program: Columninfo    */
 /* PRODUCT: SAS/ACCESS to ODBC                                       */
 /*  SYSTEM: UNIX                                                     */
 /*     REF: SAS Viya Programming Documentation: CAS User's Guide     */
 /*   USAGE: Shows specific column information of the desired table   */
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
Oracle, Netezza, and MSSWL require catalog parameter

*/

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


/* Run a proc cas addCasLib action using the specific data connector options specified above */
proc cas;
session &cas_session;
action addCaslib caslib="&caslib_alias" 
		datasource={ srctype="&srctype", 
			user="&username", 
			pass="&password",
			database="&database",
			schema="&schema",
			catalog="*"};
run; 
quit;


/* Create in-memory tables in CAS using CAS Libname engine */
libname caslib cas sessref=&cas_session tag="";

data caslib.COLUMNSAMPLE;
  input FLIGHT $3. +5 DATES $7. +3 DEPART $5. +2 ORIG $3.
         +3 DEST $3.  +7 MILES +6 BOARDED +6 CAPACITY;
   datalines;
114     01MAR98    7:10  LGA   LAX       2475       172       210
202     01MAR98   10:43  LGA   ORD        740       151       210
219     01MAR98    9:31  LGA   LON       3442       198       250
622     01MAR98   12:19  LGA   FRA       3857       207       250
132     01MAR98   15:35  LGA   YYZ        366       115       178
271     01MAR98   13:17  LGA   PAR       3635       138       250
302     01MAR98   20:22  LGA   WAS        229       105       180
114     02MAR98    7:10  LGA   LAX       2475       119       210
202     02MAR98   10:43  LGA   ORD        740       120       210
219     02MAR98    9:31  LGA   LON       3442       147       250
622     02MAR98   12:19  LGA   FRA       3857       176       250
132     02MAR98   15:35  LGA   YYZ        366       106       178
;
run;


/* Proc cas columninfo action  */
proc cas;
   	table.columnInfo / 
	table={name = "COLUMNSAMPLE", 
			caslib = "&caslib_alias"};
run;
quit;

/*Proc cas columninfo action with specified vars variable  */
proc cas;
   	table.columnInfo / 
	table={name="COLUMNSAMPLE",
			caslib = "&caslib_alias"
			vars={"FLIGHT", "DATES", "BOARDED", "CAPACITY"}};
run;
quit;

/*Proc cas columninfo action alternative method of specifying variables to display*/
proc cas;
   	table.columnInfo / 
	inputs = {{name="FLIGHT"},{name="BOARDED"}}
	table={name = "COLUMNSAMPLE", 
			caslib = "&caslib_alias"};
run;
quit;


/* Remove CAS session */
cas &cas_session. terminate;