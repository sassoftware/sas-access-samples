/******************************************************************/
/*          S A S   S A M P L E   L I B R A R Y                   */
/*                                                                */
/*    NAME: PISystemSamples.sas                                   */
/*   TITLE: Source for Examples in Documentation                  */
/* PRODUCT: SAS/ACCESS Interface to the PI System                 */
/*  SYSTEM: Windows ONLY                                          */
/*    MISC: To run these examples, you must install:              */
/*          - SAS/ACCESS Interface to the PI System               */
/*          - PI System client software library                   */
/*          - Ensure you have the SINUSOID sample tag             */
/*                                                                */
/******************************************************************/

TITLE1 '*** SAS/ACCESS Interface to the PI System Samples ***';

options linesize=150;

/*******************************************/
TITLE1 'LIBNAME assign using default server';
libname db pisystem;

/* Specify the server explicitly          */
/*----------------------------------------*/
/* libname db pisystem "mypiserver";      */
/* libname db pisystem server=mypiserver; */


/*******************************************/
TITLE1 'PROC CONTENT';
proc contents data=db.pipoint varnum; run;
proc contents data=db.sinusoid varnum; run;
proc contents data=db.sinusoid(showflags=no) varnum; run;


/*******************************************/
TITLE1 'PROC PRINT';
proc print data=db.sinusoid; run;
proc print data=db.sinusoid (start="*-2d" end="*" interval="1:00:00"); run;
proc print data=db.sinusoid (start="*-2d" end="*" count=10); run;
proc print data=db.sinusoid (select=snapshot); run;


/*******************************************/
TITLE1 'More selective PROC PRINT';
proc print data=db.sinusoid (start="*-2d" end="*" select=ok); run;
proc print data=db.sinusoid (start="*-2d" end="*" select=bad); run;
proc print data=db.sinusoid (start="*-2d" end="*" select=ok min=10); run;
proc print data=db.sinusoid (start="*-2d" end="*" select=ok max=10); run;
proc print data=db.sinusoid (start="*-2d" end="*" select=ok min=10 max=50); run;
proc print data=db.sinusoid (start="*-2d" end="*" filter="'.' > 50"); run;


/*******************************************/
TITLE1 'Digital state read';
libname db pisystem;
data list; Tag="AMI.State.1"; output;run;
proc print data=db.picomp (taglist=list start="*-2d" end="*" obs=20); run;


/*******************************************/
TITLE1 'Create tag data from scratch';
proc delete data=db.temptag; run;
data db.temptag (desc="Values are double"); format Timestamp DATETIME22.3;
  Timestamp='01jan2013:10:11:12.123'dt; Value=10.1; output;
  Timestamp='02feb2013:11:12:13'dt;     Value=20.2; output;
  Timestamp='03mar2013:12:13:14'dt;     Value=30.3; output;
run;
proc print data=db.temptag (delay=1);run;
proc delete data=db.temptag; run;


/*******************************************/
TITLE1 'PROC SQL';
libname db pisystem;
proc sql noerrorstop;
  select * from db.sinusoid where (Value > 99);  /* WHERE processed by SAS */
quit;

proc sql noerrorstop;
  select * from db.sinusoid (min = 99);  /* Filter pushed down to db */
quit;


/*******************************************/
TITLE1 'Multi-tag read';
libname db pisystem showflags=no;
data list; set db.pipoint (tagfilter="sinus*"); run;
proc print data=db.picomp (taglist=list select=snap); run;
proc print data=db.picomp (taglist=list min=99.99); run;

libname db pisystem;
data list; set db.pipoint (keep=tag zero where=(zero=100)); run;
proc print data=list; run;
proc print data=db.picomp (taglist=list select=snap drop=substituted annotated);
run;


/****************************************************************/
/*                         END OF FILE                          */
/****************************************************************/
