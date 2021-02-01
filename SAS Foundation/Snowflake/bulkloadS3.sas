/*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: bulkloadS3.sas                                           */
 /*   TITLE: Sample Programs                                          */
 /* PRODUCT: SAS/ACCESS to Snowflake                                  */
 /*  SYSTEM: UNIX, WINDOWS                                            */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname,          */
 /*          and then submit this program.                            */
 /* PRE-REQUISITE: AWS S3_Bucket, Access_key, Secret_key, Region and  */
 /*                Security_Token                                     */
 /*    NOTE: Some interfaces require that you add the SAS data set    */
 /*          option, SASDATEFMT=, to the name of the DBMS view        */
 /*          or table to have the output format correctly.            */
 /*    NOTE: Some interfaces are case sensitive. You may need to      */
 /*          change the case of table or column names to comply       */
 /*          with the requirements of your database.                  */
 /*                                                                   */
 /*********************************************************************/

/* CREATE GLOBAL MACROS FOR BULKLOAD */

%GLOBAL m_bucket;		    /* specifies amazon s3 bucket  */
%GLOBAL m_key;		        /* specifies an AWS key that you use to access the AWS environment */
%GLOBAL m_secret;		    /* specifies the secret access key to access a data source. */
%GLOBAL m_region;		    /* specifies the AWS region from which S3 data is being loaded     */
%GLOBAL m_security_token;	/* specifies a temporary token associated with the temporary credentials provided with BL_KEY= and BL_SECRET= options. */

/* ASSIGN GLOBAL MACRO VALUES FOR  BULKLOAD */

%let m_bucket ="bucket-name";
%let m_key =key-value;
%let m_secret =secret-access-key;
%let m_region ="region";
%let m_security_token =temporary-token;


 /*=========================*/
 /* BULKLOAD Sample 1       */
 /*=========================*/

 /******************************************/
 /* Clean up the table, if already exists  */
 /******************************************/

proc delete data=mydblib.SNBLKTAB; run;

 /***********************/
 /*  CREATE DATASET     */
 /***********************/

data work.SNBLKDAT;
   input name $ age sex $ bdate mmddyy.;
   cards;
amy 3 f 030185
bill 12 m 121277
charlie 35 m 010253
david 19 m 101469
elinor 42 f 080845
pearl 78 f 051222
vera 96 f 101200
frank 24 m 092663
georgia 1 f 040687
henry 46 m 053042
joann 27 f 020461
buddy 66 m 101432
;
run;

 /************************************/
 /*  CREATE DBMS TABLE WITH OPTIONS  */
 /************************************/

/* Load via a Snowflake external stage (AWS S3 bucket) */
 proc sql;
create table mydblib.SNBLKTAB
    (BULKLOAD=YES bl_bucket=&m_bucket
     bl_key="&m_key" bl_secret="&m_secret"
     bl_region=&m_region bl_security_token="&m_security_token") as
   select * from work.SNBLKDAT;
quit;

 /****************************/
 /* READ TABLE               */
 /****************************/

proc print data=mydblib.SNBLKTAB (BULKUNLOAD=YES bl_bucket=&m_bucket
     bl_key="&m_key" bl_secret="&m_secret"
     bl_region=&m_region bl_security_token="&m_security_token");
 format bdate date7.;
title 'proc print of table';
run;
