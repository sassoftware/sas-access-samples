 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: bulkload.sas                                             */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Aster                                      */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec,                         */
 /*          createLibname.sas, then submit this program.             */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. Your may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

  /* CREATE GLOBAL MACROS FOR BULKLOAD */

 %GLOBAL bl_path;   /* Path to Aster bulk loader */
 %GLOBAL bl_dbname; /* Database name for bulk load */
 %GLOBAL bl_host;   /* Hostname for bulk load */

 /* ASSIGN GLOBAL MACRO VALUES FOR  BULKLOAD */

 %let bl_path   =;
 %let bl_dbname =;
 %let bl_host   =;

 /*==========================*/
 /* BULKLOAD Sample 1        */
 /*==========================*/


 /***********************/
 /*  CREATE DATASET     */
 /***********************/

data work.DUBLKDAT;
   input name $ age sex $ bdate mmddyy.;
   cards;
amy 3 f 030185
bill 12 m 121277
charlie 35 m 010253
david 19 m 101469
elinor 42 f 080845
pearl 78 f 051222
vera 96 f 101200
frank 24 m 092663
georgia 1 f 040687
henry 46 m 053042
joann 27 f 020461
buddy 66 m 101432
;
run;


 /************************************/
 /*  CREATE DBMS TABLE WITH OPTIONS  */
 /************************************/

/* BULKLOAD VALUES ASSIGNED IN ATSMAUTO */


proc sql;
create table mydblib.DUBLKTAB (
    BULKLOAD=YES
    bl_path=&bl_path
    bl_dbname=&bl_dbname
    bl_host=&bl_host
) as select * from work.DUBLKDAT;
quit;


 /****************************/
 /* Read Table               */
 /****************************/

proc print data=mydblib.DUBLKTAB;
 format bdate date7.;
title 'proc print of table';
run;


 /****************************/
 /* CLEANUP                  */
 /****************************/



proc delete data=mydblib.DUBLKTAB;
run;
