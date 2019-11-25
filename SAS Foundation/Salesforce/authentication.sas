 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: authentication.sas                                       */
 /*   TITLE: Authenticate to Salesforce                               */
 /* PRODUCT: SAS/ACCESS to Salesforce                                 */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, modify the below program to match your       */
 /*          login scenario, and submit the relevant statement        */
 /*                                                                   */
 /*********************************************************************/

 /*=========================================*/
 /* Connect to production Salesforce org    */
 /*=========================================*/
 /*===========================================================================*/
 /* Salesforce requires a security token when connecting to its API           */
 /* If you do not know your security token, the following link provides       */
 /* information on how to reset it. When forming a libname, the security      */
 /* token should be directly appended to the end of your password.            */
 /*                                                                           */
 /* https://help.salesforce.com/articleView?id=user_security_token.htm        */
 /*===========================================================================*/
%let username="John.Doe@example.com";
%let password=%str(SamplePassword123);
%let token=%str(ABC1234567890XYZ);
%let passandtoken=&password&token;

libname x sasioslf user=&username pass=&passandtoken;

 /*=========================================*/
 /* Connect to a Salesforce sandbox         */
 /*=========================================*/
 /*============================================================================*/
 /* When creating a Salesforce sandbox, Salesforce asks for a name. This value */
 /* is appended to your email when logging in to the sandbox. For instance, if */
 /* your login is "John.Doe@example.com" and your sandbox name is "qa", your   */
 /* login username when connecting to the sandbox is "John.Doe@example.com.qa" */
 /* In addition, you must alter your authendpoint as specified below. For more */
 /* information, view the following Salesforce support document.  			   */
 /* 																		   */
 /* https://help.salesforce.com/articleView?id=data_sandbox_create.htm         */
 /*============================================================================*/

libname x sasioslf user=&username pass=&passandtoken authendpoint="test.salesforce.com";

 /*===========================================================*/
 /* Connect to Salesforce using mutual authentication         */
 /*===========================================================*/
 libname x sasioslf user=&username pass=&passandtoken mutual_auth=yes 
 	cert_path="/path/to/certificate" cert_pass="certificate_password";
