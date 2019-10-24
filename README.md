# SAS/ACCESS Sample Repository (sas-access-samples)

## Overview

This repository contains sample SAS programs that use SAS/ACCESS engines to connect to your data source. The samples are divided into two main directories: SAS Foundation and SAS Viya.

* Programs at the top-level platform directory are generic and can be used for any of their corresponding SAS/ACCESS engines.
* Programs that run for a specific SAS/ACCESS interface are found in the folder for that interface.
* Some engines have their own version of the generic programs, and those should be run instead.

## Prerequisites

Before you can connect to your data source using these programs, you must know the following items:

* User ID and password or authentication domain
* Server host name and port number, if the port is different than the default value.

## Installation

To load the programs into the editor in SAS Studio:

1. Click the download button on the right-hand side of the samples repository page on GitHub.
2. Save the project on your computer.
3. In the Explorer tab of the left-hand navigation pane, navigate to where you saved the sample files and open them. 

To load the programs into the program editor in SAS windowing environment:

1. Click the download button on the right-hand side of the samples repository page on GitHub.
2. Save the project on your computer
3. Click File > Open Program
4. Navigate to where you saved the sample files and open them.

To load the sample files using the Git Integration feature in SAS Studio, refer [here](https://go.documentation.sas.com/?docsetId=webeditorug&docsetTarget=n1db24v7wrl64gn19kjothg6mxpj.htm&docsetVersion=3.8&locale=en)

## Getting Started

To use the sample programs on your machine:

1. The sample files should be executed in the following order:
    * createLibname
    * createSampleData
    * All sample files in your data-base specific directory
    * The remaining sample files in the top-level platform directory

2. Replace the comments in the createLibname sample file with the appropriate values for your system.
    * For the dbms macro, enter your engine name. For example, if your engine is postgres, type Postgres
    * For the CONNOPT macro, enter your database connection information. See CONNOPT.md for engine-specific parameters

## License

This project is licensed under the [Apache 2.0 License](https://gitlab.sas.com/techoffice/new-project/blob/master/LICENSE).

## Additional Resources

For more information about usage and options that are available for your interface, see this information:

* [SAS/ACCESS for Relational Databases](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=9.4_3.4&docsetId=acreldb&docsetTarget=titlepage.htm)
* Blog posts
* SAS Communities
