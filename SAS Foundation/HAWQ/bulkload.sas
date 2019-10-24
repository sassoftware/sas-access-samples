 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: bulkload.sas                                             */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to HAWQ                                       */
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

  /* CREATE GLOBAL MACROS FOR BULKLOAD */

 %GLOBAL PORT;   /* Port for Hawq bulk loader */
 %GLOBAL HOST; /* Client box for Hawq bulk load */

 /* ASSIGN GLOBAL MACRO VALUES FOR  BULKLOAD */

 %let PORT   =;
 %let HOST   =;

  /*=========================*/
 /* BULKLOAD Sample 1       */
 /*=========================*/

 /* CLEAN UP */

proc delete data=mydblib.testblkld1; run;
proc delete data=mydblib.testblkld2; run;

 /* CREATE WORK DATA SET */
data work.testblkld;
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



 /*===================================*/
 /* BULKLOAD THE DATA. YOU WILL NEED  */
 /* TO SET HOST AND PORT VALUES       */
 /* SET PROTOCOL TO GPFDIST           */
 /*===================================*/


proc sql;
create table mydblib.testblkld1
  (BULKLOAD=YES
   BL_PORT=&port
   BL_HOST=&host
   BL_PROTOCOL="gpfdist"
   bl_format='CSV')
  as select * from work.testblkld;
quit;

data mydblib.testblkld2 (
   BULKLOAD=YES
   BL_PORT=&port
   BL_HOST=&host
   BL_PROTOCOL="gpfdist"
   );
   set  work.testblkld;
run;
