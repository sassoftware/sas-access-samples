 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: bulkload.sas                                             */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Oracle                                     */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname,          */
 /*          then submit this program.                                */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. You may need to      */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

 /*==========================*/
 /* BULKLOAD Sample 1        */
 /*==========================*/


proc delete data=mydblib.ORBULK13; run;

 /* BULKLOAD ON. LOAD ONLY 2000 ROWS */
data mydblib.ORBULK13 ( bulkload=yes
                  BL_OPTIONS=' ERRORS=999, LOAD=2000'  );
 do i=1 to 10000 ;
 c1=1; output;
 end;
run;

 /* DROP BULK TABLE */
proc delete data=mydblib.ORBULK13; run;
