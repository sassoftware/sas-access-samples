 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: procAppend.sas                                           */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Impala                                     */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname           */
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

proc delete data=mydblib.new1;
run;

/******************************************/
/* FAIL: TRY TO CREATE TABLE FROM DATASET */
/* THAT DOESN'T EXIST                     */
/******************************************/

data mydblib.new1;
 set work.new;
run;

/******************************************/
/* CREATE DATA SET WORK.NEW               */
/* THAT DOESN'T EXIST NEW                 */
/*****************************************/

data work.new;
x=1;
run;

/******************************************/
/* PASS: CREATE TABLE FROM DATASET        */
/*                                       */
/*****************************************/


data mydblib.new1;
 set work.new;
run;

proc delete data=mydblib.new1;
run;
