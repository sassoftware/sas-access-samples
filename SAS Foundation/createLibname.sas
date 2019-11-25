 /**********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                       */
 /*                                                                    */
 /*    NAME: createLibname.sas                                         */
 /*   TITLE: Autoexec used in creating and running samples.            */
 /* PRODUCT: SAS/ACCESS Software for Relational Databases              */
 /*  SYSTEM: z/OS, UNIX, WINDOWS, LINUX                                */
 /*    DBMS: All Relational DBMS supported with ACCESS Products        */
 /*     REF: SAS/ACCESS Software For Relational Databases:             */
 /*          Reference, Version 9                                      */
 /*    NOTE: Edit this file to replace the ???????? with your site's   */
 /*          DBMS-specific connection information. This autoexec       */
 /*          should be called to run the createSampleData and test     */
 /*          programs which create sample data and execute samples.    */
 /**********************************************************************/

     /* included for Year-2000 compliance */
options yearcutoff=1925 ls=120 nodate;

 /* dbms(engine) name assignment */

%let dbms=????????;  /* for example, Postgres */

 /* Assign connection options                                         */
 /*                                                                   */
 /* For example, the POSTGRES connection string                       */
 /* may look something like the following:                            */
 /*                                                                   */
 /* %let CONNOPT=%str(user=????????                                   */
 /*                   password=????????                               */
 /*                   server=????????                                 */
 /*                   port=????????                                   */
 /*                   database=?????                                  */
 /*                  );                                               */
 /*                                                                   */
 /* Refer to the documentation for parameters specific to your        */
 /* database                                                          */
 /*                                                                   */
 /* Aster, Oracle, Teradata, DB2 z/OS you can remove the              */
 /* connections options user= password= and path/database= completely */
 /* allowing the default Authid and Database to be used, or use the   */
 /* following to specify the authid and database:                     */
 /* authid=???????? and in='database ???????'                         */
 /*                                                                   */
 /* *** For Asterdata you will need to specify dimension=yes as shown */
 /*     below.  You would remove this for other database references   */
 /*                                                                   */
 /* *** For Greenplum you will need to specify delete_mult_rows=yes   */
 /*     as shown below.  You would remove this for other database     */
 /*															          */
 /* *** For Salesforce, you will need to append a security token to   */
 /*     your password. For further details and examples, see the      */
 /*     sample file Salesforce/auth.sas                               */

%let CONNOPT=%str(?????????);

 /* edit the following statement to include the path     */
 /* to a local directory on the host where you will be   */
 /* executing SAS; this will be used as a SAS library to */
 /* store SAS data sets and PROC SQL Views               */

libname samples base '????????';

 /* ISSUE LIBNAME STATEMENT WITH A COMBINATION OF THE ABOVE OPTIONS */

libname mydblib &dbms &CONNOPT;

 /* The following allows for reference of the database type   */
 /* (e.g. Postgres, MySQL, Hadoop, etc.) to allow for certain */
 /*	tests to be run conditionally against certain databases,  */
 /* but not others.											  */
 
proc sql noprint;         
	select distinct engine into :enginename from dictionary.members
	where upcase(libname) = 'MYDBLIB';
quit;
