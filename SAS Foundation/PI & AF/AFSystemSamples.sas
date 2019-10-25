/********************************************************************/
/*          S A S   S A M P L E   L I B R A R Y                     */
/*                                                                  */
/*    NAME: AFSystemSamples.sas                                     */
/*   TITLE: Source for Examples in Documentation                    */
/* PRODUCT: SAS/ACCESS Interface to the PI System Asset Framework   */
/*  SYSTEM: Windows ONLY                                            */
/*    MISC: To run these examples, you must install:                */
/*          - SAS/ACCESS Interface to the PI System Asset Framework */
/*          - PI System client software library                     */
/*          - Ensure you have the OSIsoft samples installed         */
/*                                                                  */
/********************************************************************/


TITLE1 '*** SAS/ACCESS Interface to the PI Asset Framework System Samples ***';

options linesize=150;

/*******************************************/
TITLE1 'LIBNAME assign using default server';
libname db pisysaf;


/*******************************************/
TITLE1 'List ELEMENTS & ATTRIBUTES';

TITLE1 'List all elements';
proc datasets lib=db; quit;

TITLE1 'List contents for element attributes';
proc contents data=db.Atlanta_Data_Center varnum; run;

TITLE1 'List attributes data for element "Atlanta_Data_Center"';
proc print data=db.Atlanta_Data_Center; run;

TITLE1 'List attributes data for element';
TITLE1 '   "Atlanta Data Center\Server Rack1\ION 6200 Power Meter1"';
proc print data=db.ION_6200_Power_Meter1; run;

TITLE1 'PROC SQL, selecting only specific columns';
proc sql;
   select AttributeName, Timestamp, Value, Path from db.ION_6200_Power_Meter1;
quit;


/*******************************************/
TITLE1 'ELEMENTS';

TITLE1 'List contents for element';
proc contents
  data=db.element
    (id="0355db1d-aee7-435e-87b9-869c079d3827" searchby=id)
  varnum;
run;

TITLE1 'List elements for given elementid';
proc print
  data=db.element
    (searchby=id id="0355db1d-aee7-435e-87b9-869c079d3827");
run;

TITLE1 'List element(s) for given element name';
proc print
  data=db.element (searchby=name name="ION 6200 Power Meter1");
run;

TITLE1 'List elements and children for given path name';
proc print
  data=db.element
    (searchby=path path="\\D78014\Joe\Atlanta Data Center\Server Rack1"
      child=all);
run;

TITLE1 'List element(s) for given template name';
proc print data=db.element(searchby=template template="Chemical Pump"); run;


/*******************************************/
TITLE1 'ATTRIBUTES';

TITLE1 'List all attributes for element with given elementid';
proc print
  data=db.element_attribute
    (searchby=id id="0355db1d-aee7-435e-87b9-869c079d3827");
run;

TITLE1 'List all attributes for all elements named "ION 6200 Power Meter1"';
proc print
  data=db.element_attribute(searchby=name name="ION 6200 Power Meter1");
run;


/*******************************************/
TITLE1 'TIME-SERIES-DATA ATTRIBUTES';

TITLE1 'Support datamodel= recorded, count, plot and sampled';
proc print data=db.tsdata_attribute
  (searchby=name name="ION 6200 Power Meter1" start='*-1m' end='*'
    datamodel=archive);
run;

TITLE1 'Find the attributes with bad status';
proc print data=db.tsdata_attribute
  (searchby=name name="ION 6200 Power Meter1" start='*-1m' end='*'
    datamodel=archive hideoptvars=yes);
  where Status = 'Bad';
run;


/*******************************************/
TITLE1 'TIME-SERIES-DATA';

TITLE1 'Time-Series data with INTERVAL option';
proc print data=db.tsdata_pipoint(searchby=name name="ION 6200 Power Meter1"
  attribute="VIn A"
  start='y' end='t' datamodel=sampled interval="8:00");
run;

/****************************************************************/
/*                         END OF FILE                          */
/****************************************************************/
