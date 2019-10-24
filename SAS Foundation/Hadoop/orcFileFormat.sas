 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: orcFileFormat.sas                                        */
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


 /*=====================*/
 /* ORC SAMPLE 1        */
 /*=====================*/


/* CLEAN UP */

proc delete data=mydblib.seqtab1; run;
proc delete data=mydblib.compare; run;


 /*===================================*/
 /* CREATE ORC DATA WITH PARTIONED BY */
 /*===================================*/

data mydblib.compare
     work.apd
     mydblib.seqtab1 (DBCREATE_TABLE_OPTS="PARTITIONED BY (dealer string)
                     STORED AS ORC");


 input car $ color $ dealer $ sales returns dest $;
cards;
Toyota Red Smith 10000 100 NC
Toyota Red Smith 15000 110 CT
Chevy Green Smith 17000 45 NJ
Ford Blue Smith 12000 0 CA
Toyota Red Jones 4000 20 NC
Ford Blue Finch 10000 400 NC
Toyota Red Smith 10000 100 NJ
Ford White Smith 15000 110 NC
Ford Blue Smith 12000 0 NJ
Toyota Green Jones 4000 20 NC
Toyota Black Jones 4000 20 FL
Toyota Red Jones 4000 20 NC
Ford Blue Finch 10000 400 AL
Chevy White Finch 10000 400 SC
Ford Black Finch 10000 400 SC
Chrysler Blue Finch 20000 400 NC
Chrysler Green Finch 20000 400 CT
Toyota Green Jones 10000 100 NC
Toyota Red Finch 15000 110 CT
Ford Green Smith 17000 45 NJ
;
run;



title1 'PROC PRINT OF DBLIB.SEQTAB1';
proc print data=mydblib.seqtab1; run;

title1 'PROC PRINT OF DBLIB.COMPARE';
proc print data=mydblib.compare; run;
