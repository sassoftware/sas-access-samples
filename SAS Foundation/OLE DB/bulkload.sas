 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: OLSAM08.SAS                                              */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to OLE DB                                      */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname,          */
 /*          then submit this program.                                */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. You  may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

 /* ASSIGN ODBC TO SQL SERVER BULKLOAD LIBNAME */

libname mybulk &dbms &connopt bcp=yes;


 /*==========================*/
 /* BULKLOAD Sample 1        */
 /*==========================*/

  /****************************/
 /* CHECK DBMS TABLE DROPPED */
 /****************************/

proc delete data=mybulk.DUBLKTAB;
run;



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


data mybulk.DUBLKTAB;
   set work.DUBLKDAT;
run;

 /****************************/
 /* Read Table               */
 /****************************/



proc print data=mybulk.DUBLKTAB;
 format bdate date7.;
title 'proc print of table';
run;
