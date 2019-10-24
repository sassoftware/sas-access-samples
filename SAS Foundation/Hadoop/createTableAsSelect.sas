 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: createTableAsSelect.sas                                  */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Hadoop                                     */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec,                         */
 /*          createLibname, then submit this program.                 */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. You may need to      */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

 /*==========================*/
 /* CTAS Sample #1          */
 /*==========================*/

 /* CLEAN UP */
proc delete data=mydblib.ts_STRING; run;
proc delete data=mydblib.mydblibsas; run;
proc delete data=mydblib.ysas; run;

/* CREATE SAMPLE DATA */

data mydblib.ts_STRING;
format ts datetime25.6;
ts=datetime();
run;

 /*==============================*/
 /* STANDARD READ OF SAMPLE DATA */
 /*==============================*/

option sastrace=',,,d' sastraceloc=saslog nostsuffix;
proc sql;
connect to &dbms(&CONNOPT);
create table mydblibsas as select * from connection to &dbms(
SELECT ts FROM ts_STRING
);
quit;

option sastrace=',,,' sastraceloc=saslog nostsuffix;
data _null_; set mydblibsas; put _all_; run;


 /*========================================*/
 /* EXPLICIT SQL CTAS READ OF SAMPLE DATA  */
 /* USE  READ_METHOD=JDBC WHEN HDFS NOT    */
 /* AVAILABLE                              */
 /*========================================*/


option sastrace=',,,d' sastraceloc=saslog nostsuffix;
proc sql;
connect to &dbms(&CONNOPT READ_METHOD=JDBC);
create table ysas as select * from connection to &dbms(
SELECT ts FROM ts_STRING
);
quit;

option sastrace=',,,' sastraceloc=saslog nostsuffix;
data _null_; set ysas; put _all_; run;
