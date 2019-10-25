 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: procAppend.sas                                           */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS Software for Relational Databases             */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec createLibname,           */
 /*          then submit this program.                                */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. Your may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

 /*================================*/
 /* Test Errors Sample 1           */
 /*================================*/

/* CLEAN UP */
proc delete data=mydblib.TRFORCE;
proc delete data=mydblib.TRFORCE1;
run;

data work.new;
c1='you'; output;
c1='me'; output;
run;

 /*=============================================*/
 /* PASS: APPEND TO NEW TABLE USING DBFORCE=NO  */
 /*=============================================*/

proc append base=mydblib.TRFORCE( DBFORCE=NO )
 data=work.new;
run;

title 'PASS: APPEND 2 ROWS';
proc print data=mydblib.TRFORCE;
run;

proc delete data=mydblib.TRFORCE;
run;

 /*=============================================*/
 /* PASS: APPEND TO NEW TABLE USING DBFORCE=YES */
 /*=============================================*/


proc append base=mydblib.TRFORCE( DBFORCE=YES )
 data=work.new;
run;

title 'PASS: APPEND 2 ROWS';
proc print data=mydblib.TRFORCE;
run;

/* CREATE NEW TABLE WITH EXPLICIT COL LENGTH) */

data mydblib.TRFORCE1( DBTYPE  = (C1='varchar(2)'));
c1='we'; output;
c1='us'; output;
 run;

 /*=============================================*/
 /* FAIL: APPEND FAILS DUE TO DIFFERENT COLUMN  */
 /* LENGTHS. SHOULD FAIL WITH ERROR MESSAGE     */
 /*=============================================*/

proc append base=mydblib.TRFORCE1( DBFORCE=NO )
 data=work.new;
run;

title 'APPEND FAILS. NO ROWS ADDED';
proc print data=mydblib.TRFORCE1;
run;
