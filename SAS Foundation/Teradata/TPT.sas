 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: tpt.sas                                                  */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Teradata                                   */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname,          */
 /*          then submit this program.                                */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. Your may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

 /* LIBNAME FOR TERADATA TPT BULKLOAD.  */
libname mybulk &dbms &CONNOPT tpt=yes;

 /*==========================*/
 /* TPT Sample 1             */
 /*==========================*/

proc delete data=mybulk.test1; run;
proc delete data=mybulk.test2; run;

data work.test;
  x=1; output;
run;

proc append base=mybulk.test1 (tpt=yes fastload=yes)
 data=work.test;
run;

proc delete data=mybulk.test1; run;

proc sql;
 create table mybulk.test2 (tpt=yes fastload=yes) as
   select * from work.test;
quit;


data work.test;
  x=1; output;
  x=2; output;
  x=3; output;
  x=4; output;
  x=5; output;
run;


proc sql;
  create table mybulk.test1 (tpt=yes fastload=yes)
    as select * from work.test;
quit;

proc delete data=mybulk.test1; run;

proc sql;
  create table mybulk.test1 (tpt=yes multistmt=yes)
    as select * from work.test;
quit;

proc delete data=mybulk.test1; run;

proc sql;
 create table mybulk.test1 (tpt=yes multiload=yes)
   as select * from work.test;
quit;


/* clean up */
proc delete data=mybulk.test1; run;
proc delete data=mybulk.test2; run;
