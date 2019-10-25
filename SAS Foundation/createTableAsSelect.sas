 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: createTableAsSelect.sas                                  */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS Software for Relational Databases             */
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

 /*=========================*/
 /* CTAS Sample 1           */
 /*=========================*/

/* CLEAN UP */
proc delete data=mydblib.RDTAB78; run;
proc delete data=mydblib.CRTAB78A; run;
proc delete data=mydblib.CRTAB78B; run;


/* CREATE DBMS TABLE */
data mydblib.RDTAB78;
do x = 1 to 10;
do y = 1 to 10;
output; end; end; run;

/*=================================================*/
/* DO NOT ATTEMPT CREATE-TABLE-AS-SELECT           */
/* PASSDOWN (CTAS)                                 */
/*=================================================*/
options nodbidirectexec;

proc sql noerrorstop;


 create table mydblib.CRTAB78A as
  select y from mydblib.RDTAB78
  where x gt 5 order by y;

 /* WITH IP TRIGGER */
 create table mydblib.CRTAB78B as
  select distinct y from mydblib.RDTAB78
  where x gt 5 order by y;

 quit;


data work.noexeA; set mydblib.CRTAB78A; by y; run;
data work.noexeB; set mydblib.CRTAB78B; by y; run;

proc delete data=mydblib.CRTAB78A; run;
proc delete data=mydblib.CRTAB78B; run;


/*=================================================*/
/* ATTEMPT CREATE-TABLE-AS-SELECT PASSDOWN (CTAS)  */
/*=================================================*/

options dbidirectexec;

proc sql noerrorstop;

 create table mydblib.CRTAB78A as
  select y from mydblib.RDTAB78
  where x gt 5 order by y;



 create table mydblib.CRTAB78B as
  select distinct y from mydblib.RDTAB78
  where x gt 5 order by y;

 quit;



data work.exeA; set mydblib.CRTAB78A; by y; run;
data work.exeB; set mydblib.CRTAB78B; by y; run;

/* DATASETS SHOULD COMPARE EQUAL */
proc compare base=work.noexeA
             comp=work.exeA
             error briefsummary note;run;

proc compare base=work.noexeB
             comp=work.exeB
             error briefsummary note;run;
