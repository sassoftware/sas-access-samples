 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: qualifiers.sas                                           */
 /*   TITLE: Sample programs showing Salesforce suffix qualifiers     */
 /* PRODUCT: SAS/ACCESS to Salesforce                                 */
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
%let username="John.Doe@example.com";
%let password=%str(SamplePassword123);
%let token=%str(ABC1234567890XYZ);
%let passandtoken=&password&token;

 /*==================================================================*/
 /* Accessing a standard Salesforce object with default SAS behavior */
 /*==================================================================*/
libname mydblib sasioslf user=&username pass=&passandtoken;

proc sql;
	SELECT FirstName, LastName FROM mydblib.Account;
quit;

 /*==================================================================*/
 /* Accessing a custom Salesforce object with default SAS behavior   */
 /*==================================================================*/
proc sql;
	SELECT lname, fname FROM mydblib.SAMDAT7;
quit;

 /*==================================================================*/
 /* Accessing a standard Salesforce object with use_native_names=yes */
 /*==================================================================*/
libname mydblib sasioslf user=&username pass=&passandtoken use_native_names=yes;

proc sql;
	SELECT FirstName, LastName FROM mydblib.Account;
quit;

 /*==================================================================*/
 /* Accessing a custom Salesforce object with use_native_names=yes   */
 /*==================================================================*/
proc sql;
	SELECT lname__c, fname__c FROM mydblib.SAMDAT7__c;
quit;
