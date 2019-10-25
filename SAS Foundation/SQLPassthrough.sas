 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: SQLPassthrough.sas                                       */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS Software for Relational Databases             */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname           */
 /*          trsmauto, then submit this program.                      */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. Your may need to     */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/
 
 /******************************************************************/
 /* SAS/ACCESS interface to Teradata users:                        */
 /*                                                                */
 /* When using the PROC SQL Pass-Through Facility, Teradata        */
 /* users must specify an explicit COMMIT statement to close a     */
 /* transaction. Teradata users must also specify an explicit      */
 /* COMMIT statement immediately after every Data Definition       */
 /* Language (DDL) statement.  If your DBMS-name is TERA, then     */
 /* the COMMIT statement would be:  execute (commit) by TERA;      */
 /*                                                                */
 /******************************************************************/

 /*=========================*/
 /* Pass-Through Sample 1  */
 /*=========================*/

title 'Pass-Through Sample 1: Brief Data for All Invoices';

options linesize=120;

proc sql;
connect to &dbms as mydb (&CONNOPT);
%put %superq(sqlxmsg);

   select INVNUM, NAME, BILLEDON,
          AMTINUS format=dollar20.2
   from connection to mydb
      (select INVNUM, BILLEDON, AMTINUS, NAME
          from SAMDAT9, SAMDAT11
          where SAMDAT9.BILLEDTO=SAMDAT11.CUSTOMER
          order by BILLEDON, INVNUM);
%put %superq(sqlxmsg);

disconnect from mydb;
quit;

proc sql;
connect to &dbms as mydb (&CONNOPT);
%put %superq(sqlxmsg);

create view samples.brief as
   select INVNUM, NAME, BILLEDON,
          AMTINUS format=dollar20.2
   from connection to mydb
      (select INVNUM, BILLEDON, AMTINUS, NAME
          from SAMDAT9, SAMDAT11
          where SAMDAT9.BILLEDTO=SAMDAT11.CUSTOMER);

%put %superq(sqlxmsg);

disconnect from mydb;

options ls=120 label;

select * from samples.brief
   order by BILLEDON, INVNUM;

quit;

  /*=========================*/
  /* Pass-Through Sample 2  */
  /*=========================*/

options ls=120;

title 'Pass-Through Sample 2: Interns Who Are Family Members of Employees';

proc sql;
connect to &dbms as mydb (&CONNOPT);
%put %superq(sqlxmsg);

select samdat13.LASTNAME, samdat13.FIRSTNAM,
       samdat13.EMPID, samdat13.FAMILYID,
       samdat13.GENDER, samdat13.DEPT,
       samdat13.HIREDATE
   from connection to mydb
      (select * from SAMDAT10) as query1, samples.samdat13
   where query1.EMPID=samdat13.FAMILYID;

%put %superq(sqlxmsg);

disconnect from mydb;
quit;


 /*=========================*/
 /* Pass-Through Sample 3  */
 /*=========================*/

proc sql;

   create view samples.allemp as
     select * from mydblib.SAMDAT10;

quit;

%let dept='ACC%';

proc sql stimer;
title 'Pass-Through Sample 3: Employees Who Earn Below the Dept Average
Salary';
connect to &dbms (&CONNOPT);

select EMPID, LASTNAME
   from samples.allemp
   where DEPT like &dept and SALARY <
         (select avg(SALARY)
             from connection to &dbms
                (select SALARY from SAMDAT10
                    where DEPT like &dept));
%put %superq(sqlxmsg);
disconnect from &dbms;

quit;
