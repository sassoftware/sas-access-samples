 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: partitionedData.sas                                      */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Hadoop                                     */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname           */
 /*          then submit this program.                                */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. You may need to      */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/


 /*=============================*/
 /* PARTITIONED DATA  Sample 1  */
 /*=============================*/


/* CLEAN UP */

proc delete data=mydblib.dpart; run;


 /*=============================*/
 /* CREATE PARTITIONED DATA     */
 /*=============================*/

 data mydblib.dpart (post_table_opts ="partitioned by (dates date)
        stored as sequencefile") ;
   input FLIGHT $3. +5 DATES date7. +2 ORIG $3. +3 DEST $3. +3
         DELAYCAT $15. +2 DESTYPE $15. +8 DELAY;
   informat DATES date7.;
   format DATES date9.;
   datalines;
114     01MAR98  LGA   LAX   1-10 Minutes     Domestic                8
202     01MAR98  LGA   ORD   No Delay         Domestic               -5
219     01MAR98  LGA   LON   11+ Minutes      International          18
114     02MAR98  LGA   LAX   No Delay         Domestic                0
202     02MAR98  LGA   ORD   1-10 Minutes     Domestic                5
219     02MAR98  LGA   LON   11+ Minutes      International          18
622     02MAR98  LGA   FRA   No Delay         International           0
114     03MAR98  LGA   LAX   No Delay         Domestic               -1
202     03MAR98  LGA   ORD   No Delay         Domestic               -1
219     03MAR98  LGA   LON   1-10 Minutes     International           4
302     03MAR98  LGA   WAS   1-10 Minutes     Domestic                5
;

  /*=============================*/
 /* DATA PARTITIONED BY DATE    */
 /*=============================*/

title 'SHOULD SEE ONLY 3 ROWS';
proc sql;
 select flight from mydblib.dpart where dates = '01mar98'd;
quit;
