 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: coreSamples.sas                                          */
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
 /* LIBNAME Sample 1       */
 /*=========================*/

proc print data=mydblib.SAMDAT7
   (keep=lname fname state hphone);
   where state = 'NJ';
   title 'Libname Sample 1: New Jersey Phone List';
run;

 /*=========================*/
 /* LIBNAME Sample 2       */
 /*=========================*/

data work.highwage;
  set mydblib.SAMDAT5(drop=sex birth hired);
  if salary>60000 then
    CATEGORY='High';
  else if salary<30000 then
    CATEGORY='Low';
  else
    CATEGORY='Avg';
run;


proc print data=work.highwage;
  title 'Libname Sample 2: Salary Analysis';
  format SALARY dollar10.2;
run;

 /*=========================*/
 /* LIBNAME Sample 3       */
 /*=========================*/
libname mydblib &dbms &CONNOPT connection=unique;
data work.combined;
  merge mydblib.SAMDAT7 mydblib.SAMDAT8(in=super
    rename=(SUPID=IDNUM));
  by IDNUM;
  if super;
run;

proc print data=work.combined;
  title 'Libname Sample 3: Supervisor Information';
run;

 /*=========================*/
 /* LIBNAME Sample 4       */
 /*=========================*/

data work.payroll;
  update mydblib.SAMDAT5
         mydblib.SAMDAT6;
  by IDNUM;
run;
libname mydblib &dbms &CONNOPT connection=sharedread;

proc print data=work.payroll;
  title 'Libname Sample 4: Updated Payroll Data';
run;

 /*=========================*/
 /* LIBNAME Sample 5       */
 /*=========================*/
title 'Libname Sample 5: Total Salary by Jobcode';

proc sql;
  select JOBCODE label='Jobcode',
         sum(SALARY) as total
         label='Total for Group'
         format=dollar11.2
  from mydblib.SAMDAT5
  group by JOBCODE;
quit;

 /*=========================*/
 /* LIBNAME Sample 6       */
 /*=========================*/

title 'Libname Sample 6: Flights to London and Frankfurt';

proc sql;
  select DATES, DEST from mydblib.SAMDAT2
  where (DEST eq "FRA") or
    (DEST eq "LON")
  order by DEST;
quit;

 /*=========================*/
 /* LIBNAME Sample 7       */
 /*=========================*/

proc sql;
   title  'Libname Sample 7: International Flights by Flight Number';
   title2 'with Over 200 Passengers';
   select FLIGHT   label="Flight Number",
          DATES    label="Departure Date",
          DEST     label="Destination",
          BOARDED  label="Number Boarded"
     from mydblib.SAMDAT3
    where BOARDED > 200
    order by FLIGHT;
quit;

 /*=========================*/
 /* LIBNAME Sample 8        */
 /*=========================*/

title 'Libname Sample 8: Employees with salary greater than $40,000';

proc sql;
  select a.LNAME, a.FNAME, b.SALARY
    format=dollar10.2
  from mydblib.SAMDAT7 a, mydblib.SAMDAT5 b
  where (a.IDNUM eq b.IDNUM) and
    (b.SALARY gt 40000);
quit;

 /*==========================*/
 /* LIBNAME Sample 9         */
 /*==========================*/

/* SQL Implicit Passthru ON */
libname mydblib &dbms &CONNOPT direct_sql=yes;
options debug=dbms_select;
title 'Libname Sample 9a: Delayed International Flights in March';

proc sql;
  select distinct samdat1.FLIGHT,
      samdat1.DATES,
      DELAY format=2.0
    from mydblib.SAMDAT1, mydblib.SAMDAT2, mydblib.SAMDAT3
  where samdat1.FLIGHT=samdat2.FLIGHT and
        samdat1.DATES=samdat2.DATES and
        samdat1.FLIGHT=samdat3.FLIGHT and
        DELAY>0
  order by DELAY descending;
quit;

 /*==========================*/
 /* LIBNAME Sample 9b        */
 /*==========================*/

/* SQL Implicit Passthru OFF */
libname mydblib &dbms &CONNOPT direct_sql=no;

title 'Libname Sample 9b: Delayed International Flights in March';

proc sql;
  select distinct samdat1.FLIGHT,
      samdat1.DATES,
      DELAY format=2.0
    from mydblib.SAMDAT1, mydblib.SAMDAT2, mydblib.SAMDAT3
  where samdat1.FLIGHT=samdat2.FLIGHT and
        samdat1.DATES=samdat2.DATES and
        samdat1.FLIGHT=samdat3.FLIGHT and
        DELAY>0
  order by DELAY descending;
quit;

 /*==========================*/
 /* LIBNAME Sample 9c        */
 /*==========================*/

libname mydblib &dbms &CONNOPT direct_sql=nomultoutjoins;

title 'Libname Sample 9c: Delayed International Flights in March';

proc sql;
  select distinct samdat1.FLIGHT,
      samdat1.DATES,
      DELAY format=2.0
    from mydblib.SAMDAT1
    full join mydblib.SAMDAT2 on
      samdat1.FLIGHT = samdat2.FLIGHT
    full join mydblib.SAMDAT3 on
      samdat1.FLIGHT = samdat3.FLIGHT
  order by DELAY descending;
quit;

 /*==========================*/
 /* LIBNAME Sample 9d        */
 /*==========================*/

libname mydblib &dbms &CONNOPT direct_sql=nowhere;

title 'Libname Sample 9d: Delayed International Flights in March';

proc sql;
  select distinct samdat1.FLIGHT,
      samdat1.DATES,
      DELAY format=2.0
    from mydblib.SAMDAT1, mydblib.SAMDAT2, mydblib.SAMDAT3
  where samdat1.FLIGHT=samdat2.FLIGHT and
        samdat1.DATES=samdat2.DATES and
        samdat1.FLIGHT=samdat3.FLIGHT and
        DELAY>0
  order by DELAY descending;
quit;


 /* turn off debug option */
options debug=off;

 /*==========================*/
 /* LIBNAME Sample 10        */
 /*==========================*/

title 'Libname Sample 10: Payrolls 1 & 2';

proc sql;
  select IDNUM, SEX, JOBCODE, SALARY,
         BIRTH,
         HIRED
     from mydblib.SAMDAT5
  outer union corr
  select *
     from mydblib.SAMDAT6
   order by IDNUM, JOBCODE, SALARY;
quit;

 /*==========================*/
 /* LIBNAME Sample 11        */
 /*==========================*/

%if (&enginename EQ ASTER) %then %do;
	proc sql undo_policy=none;
	insert into mydblib.SAMDAT8
		values(1588,'NY','FA');
	quit;

	proc print data=mydblib.SAMDAT8;
		title 'Libname Sample 11: New Row in AIRLINE.SAMDAT8';
	run;
%end;
%else %do;
	proc sql undo_policy=none;
	insert into mydblib.SAMDAT8
		values('1588','NY','FA');
	quit;

	proc print data=mydblib.SAMDAT8;
		title 'Libname Sample 11: New Row in AIRLINE.SAMDAT8';
	run;
%end;

 /*==========================*/
 /* LIBNAME Sample 12        */
 /*==========================*/

 /******************************************************************/
 /* SAS/ACCESS interface to Impala and HAWQ users:                 */
 /* Delete not supported, thus Test #12 is omitted for			   */
 /* those databases												   */
 /*																   */
 /* SAS/ACCESS interface to Hadoop users:					       */
 /* Support for delete added post 9.4M3                            */
 /* Hive .14 or higher is needed for this feature                  */
 /*                                                                */
 /******************************************************************/

%if (&enginename NE HAWQ and &enginename NE IMPALA) %then %do; 
 
	proc sql;
	  delete from mydblib.SAMDAT7
		where STATE='CT';
	quit;


	proc print data=mydblib.SAMDAT7;
	title 'Libname Sample 12: AIRLINE.SAMDAT7 After Deleting Connecticut Employees';

	run;

%end;

 /*==========================*/
 /* LIBNAME Sample 13        */
 /*==========================*/

proc sql;

  create table work.gtforty as
  select LNAME as lastname,
         FNAME as firstname,
         SALARY as Salary
  from mydblib.SAMDAT7 a, mydblib.SAMDAT5 b
  where (a.IDNUM eq b.IDNUM) and (SALARY gt 40000);

quit;

proc print data=work.gtforty noobs;
  title 'Libname Sample 13: Employees with salaries over $40,000';
  format SALARY dollar10.2;

run;

 /*==========================*/
 /* LIBNAME Sample 14        */
 /*==========================*/

title 'Libname Sample 14: Number of Passengers per Flight by Date';


proc print data=mydblib.SAMDAT1 noobs;
  var DATES BOARDED;
  by FLIGHT DEST;
  sumby FLIGHT;
  sum BOARDED;
run;

title 'Libname Sample 14: Maximum Number of Passengers per Flight';


proc means data=mydblib.SAMDAT1 fw=5 maxdec=1 max;
  var BOARDED;
  class FLIGHT;
run;

 /*==========================*/
 /* LIBNAME Sample 15        */
 /*==========================*/
title 'Libname Sample 15: Table Listing';

options pageno=1;

proc datasets lib=mydblib;
  contents data=_all_ nods;
run;

 /*==========================*/
 /* LIBNAME Sample 16       */
 /*==========================*/

title 'Libname Sample 16: Contents of the SAMDAT2 Table';

proc contents data=mydblib.SAMDAT2;
run;

 /*==========================*/
 /* LIBNAME Sample 17        */
 /*==========================*/

title 'Libname Sample 17: Ranking of Delayed Flights';

options pageno=1;

proc rank data=mydblib.SAMDAT2 descending
    ties=low out=work.ranked;
  var DELAY;
  ranks RANKING;
run;

proc print data=work.ranked;
  format DELAY 2.0;
run;

 /*==========================*/
 /* LIBNAME Sample 17a        */
 /*==========================*/
 
data mydblib.SAMTEMP;
 set mydblib.SAMDAT2;
run; 
proc delete data=mydblib.SAMTEMP; run;

 /*==========================*/
 /* LIBNAME Sample 18        */
 /*==========================*/

title 'Libname Sample 18: Number of Employees by Jobcode';

proc tabulate data=mydblib.SAMDAT5 format=3.0;
   class JOBCODE;
   table JOBCODE*n;
   keylabel n="#";
run;

 /*==========================*/
 /* LIBNAME Sample 19        */
 /*==========================*/

title 'Libname Sample 19: SAMAT5 After Appending SAMDAT6';

proc append base=mydblib.SAMDAT5
            data=mydblib.SAMDAT6;
run;

proc print data=mydblib.SAMDAT5;
run;


 /*==========================*/
 /* LIBNAME Sample 20        */
 /*==========================*/

title 'Libname Sample 20: Invoice Frequency by Country';

proc freq data=mydblib.SAMDAT9 (keep=INVNUM COUNTRY);
  tables COUNTRY;
run;

 /*==========================*/
 /* LIBNAME Sample 21        */
 /*==========================*/

title 'Libname Sample 21: High Bills--Not Paid';

proc sql;
  create view work.allinv as
  select PAIDON, BILLEDON, INVNUM, AMTINUS, BILLEDTO
    from mydblib.SAMDAT9 (obs=5);
quit;

data work.notpaid(keep=INVNUM BILLEDTO AMTINUS BILLEDON);

  set work.allinv;
  where PAIDON is missing and AMTINUS>=300000.00;
run;

proc print data=work.notpaid label;
  format AMTINUS dollar20.2;
  label  AMTINUS=amountinus
         BILLEDON=billedon
         INVNUM=invoicenum
         BILLEDTO=billedto;
run;

 /*==========================*/
 /* LIBNAME Sample 22        */
 /*==========================*/

title 'Libname Sample 22: Interns Who Are Family Members of Employees';


proc sql;
  create view emp_csr as
  select * from mydblib.SAMDAT10
    where dept in ('CSR010', 'CSR011', 'CSR004');

  select samdat13.LASTNAME, samdat13.FIRSTNAM, samdat13.EMPID,
         samdat13.FAMILYID, samdat13.GENDER,
         samdat13.DEPT, samdat13.HIREDATE
    from emp_csr, samples.samdat13
    where emp_csr.EMPID=samdat13.FAMILYID;

quit;

/*==========================*/
 /* LIBNAME Sample 23       */
 /*==========================*/

title 'Libname Sample 23: FedSql Dictionary Tables';

 
proc fedsql;
select * from dictionary.tables where table_name='SAMDAT1';
create table work.flight as
           select st.flight,st.dates,st.orig, st.dest from mydblib.SAMDAT1 as st
           where dest='WAS';
quit;


 /*==========================*/
 /* LIBNAME Sample 24       */
 /*==========================*/
 
 
title 'Libname Sample 24: Passthru With Connect Using'; 

proc sql noerrorstop;
connect using mydblib;
execute ( create table SAMTEMP( col1 int,TAB1_C1 char(3),
col2 int,col3 int
 ) ) by mydblib;
execute ( insert into SAMTEMP values (101,'pup',103,104)
        ) by mydblib;
quit;

proc sql noerrorstop;
connect using mydblib;
select * from connection to mydblib
 ( select * from SAMTEMP );
quit;

proc sql noerrorstop;
connect using mydblib;
execute ( drop table SAMTEMP ) by mydblib;		
quit;
run;

