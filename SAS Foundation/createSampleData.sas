 /*********************************************************************/
 /*          S A S   S A M P L E   L I B R A R Y                      */
 /*                                                                   */
 /*    NAME: createSampleData.sas                                     */
 /*   TITLE: Creating SAS Data Sets and DBMS Tables                   */
 /* PRODUCT: SAS/ACCESS Software for Relational Databases             */
 /*  SYSTEM: z/OS, UNIX, WINDOWS                                      */
 /*    KEYS: DATABASE LIBNAME                                         */
 /*     REF: SAS/ACCESS 9 for Relational Databases: Reference         */
 /*   USAGE: Invoke SAS, submit the autoexec, createLibname,          */
 /*          then submit this program.                                */
 /*    NOTE: This file creates the SAS data sets and DBMS tables      */
 /*          that are used in the samples.                            */
 /*    NOTE: When you create DBMS tables from the SAS data sets       */
 /*          below, the data in some of your DBMS columns might       */
 /*          not load in the correct format.  Therefore, you might    */
 /*          need to use a LIBNAME option, such as DBTYPE=, on        */
 /*          your LIBNAME statement to format the data correctly.     */
 /*          See your SAS/ACCESS documentation for details.           */
 /*********************************************************************/

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT1 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat1;
   input FLIGHT $3. +5 DATES date7. +3 DEPART time5. +2 ORIG $3.
         +3 DEST $3.  +7 MILES +6 BOARDED +6 CAPACITY;
   format DATES date9. DEPART time5.;
   informat DATES date7. DEPART time5.;
   datalines;
114     01MAR98    7:10  LGA   LAX       2475       172       210
202     01MAR98   10:43  LGA   ORD        740       151       210
219     01MAR98    9:31  LGA   LON       3442       198       250
622     01MAR98   12:19  LGA   FRA       3857       207       250
132     01MAR98   15:35  LGA   YYZ        366       115       178
271     01MAR98   13:17  LGA   PAR       3635       138       250
302     01MAR98   20:22  LGA   WAS        229       105       180
114     02MAR98    7:10  LGA   LAX       2475       119       210
202     02MAR98   10:43  LGA   ORD        740       120       210
219     02MAR98    9:31  LGA   LON       3442       147       250
622     02MAR98   12:19  LGA   FRA       3857       176       250
132     02MAR98   15:35  LGA   YYZ        366       106       178
302     02MAR98   20:22  LGA   WAS        229        78       180
271     02MAR98   13:17  LGA   PAR       3635       104       250
114     03MAR98    7:10  LGA   LAX       2475       197       210
202     03MAR98   10:43  LGA   ORD        740       118       210
219     03MAR98    9:31  LGA   LON       3442       197       250
622     03MAR98   12:19  LGA   FRA       3857       180       250
132     03MAR98   15:35  LGA   YYZ        366        75       178
271     03MAR98   13:17  LGA   PAR       3635       147       250
302     03MAR98   20:22  LGA   WAS        229       123       180
114     04MAR98    7:10  LGA   LAX       2475       178       210
202     04MAR98   10:43  LGA   ORD        740       148       210
219     04MAR98    9:31  LGA   LON       3442       232       250
622     04MAR98   12:19  LGA   FRA       3857       137       250
132     04MAR98   15:35  LGA   YYZ        366       117       178
271     04MAR98   13:17  LGA   PAR       3635       146       250
302     04MAR98   20:22  LGA   WAS        229       115       180
114     05MAR98    7:10  LGA   LAX       2475       117       210
202     05MAR98   10:43  LGA   ORD        740       104       210
219     05MAR98    9:31  LGA   LON       3442       160       250
622     05MAR98   12:19  LGA   FRA       3857       185       250
132     05MAR98   15:35  LGA   YYZ        366       157       178
271     05MAR98   13:17  LGA   PAR       3635       177       250
114     06MAR98    7:10  LGA   LAX       2475       128       210
202     06MAR98   10:43  LGA   ORD        740       115       210
219     06MAR98    9:31  LGA   LON       3442       163       250
132     06MAR98   15:35  LGA   YYZ        366       150       178
302     06MAR98   20:22  LGA   WAS        229        66       180
114     07MAR98    7:10  LGA   LAX       2475       160       210
202     07MAR98   10:43  LGA   ORD        740       175       210
219     07MAR98    9:31  LGA   LON       3442       241       250
622     07MAR98   12:19  LGA   FRA       3857       210       250
132     07MAR98   15:35  LGA   YYZ        366       164       178
271     07MAR98   13:17  LGA   PAR       3635       155       250
302     07MAR98   20:22  LGA   WAS        229       135       180
;

proc sql outobs=15;
   title "SAMDAT1 Data (Partial)";
   select * from samples.samdat1;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT2 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat2;
   input FLIGHT $3. +5 DATES date7. +2 ORIG $3. +3 DEST $3. +3
         DELAYCAT $15. +2 DESTYPE $15. +8 DELAY;
   informat DATES date7.;
   format DATES date9.;
   datalines;
114     01MAR98  LGA   LAX   1-10 Minutes     Domestic                8
202     01MAR98  LGA   ORD   No Delay         Domestic               -5
219     01MAR98  LGA   LON   11+ Minutes      International          18
622     01MAR98  LGA   FRA   No Delay         International          -5
132     01MAR98  LGA   YYZ   11+ Minutes      International          14
271     01MAR98  LGA   PAR   1-10 Minutes     International           5
302     01MAR98  LGA   WAS   No Delay         Domestic               -2
114     02MAR98  LGA   LAX   No Delay         Domestic                0
202     02MAR98  LGA   ORD   1-10 Minutes     Domestic                5
219     02MAR98  LGA   LON   11+ Minutes      International          18
622     02MAR98  LGA   FRA   No Delay         International           0
132     02MAR98  LGA   YYZ   1-10 Minutes     International           5
271     02MAR98  LGA   PAR   1-10 Minutes     International           4
302     02MAR98  LGA   WAS   No Delay         Domestic                0
114     03MAR98  LGA   LAX   No Delay         Domestic               -1
202     03MAR98  LGA   ORD   No Delay         Domestic               -1
219     03MAR98  LGA   LON   1-10 Minutes     International           4
622     03MAR98  LGA   FRA   No Delay         International          -2
132     03MAR98  LGA   YYZ   1-10 Minutes     International           6
271     03MAR98  LGA   PAR   1-10 Minutes     International           2
302     03MAR98  LGA   WAS   1-10 Minutes     Domestic                5
114     04MAR98  LGA   LAX   11+ Minutes      Domestic               15
202     04MAR98  LGA   ORD   No Delay         Domestic               -5
219     04MAR98  LGA   LON   1-10 Minutes     International           3
622     04MAR98  LGA   FRA   11+ Minutes      International          30
132     04MAR98  LGA   YYZ   No Delay         International          -5
271     04MAR98  LGA   PAR   1-10 Minutes     International           5
302     04MAR98  LGA   WAS   1-10 Minutes     Domestic                7
114     05MAR98  LGA   LAX   No Delay         Domestic               -2
202     05MAR98  LGA   ORD   1-10 Minutes     Domestic                2
219     05MAR98  LGA   LON   1-10 Minutes     International           3
622     05MAR98  LGA   FRA   No Delay         International          -6
132     05MAR98  LGA   YYZ   1-10 Minutes     International           3
271     05MAR98  LGA   PAR   1-10 Minutes     International           5
114     06MAR98  LGA   LAX   No Delay         Domestic               -1
202     06MAR98  LGA   ORD   No Delay         Domestic               -3
219     06MAR98  LGA   LON   11+ Minutes      International          27
132     06MAR98  LGA   YYZ   1-10 Minutes     International           7
302     06MAR98  LGA   WAS   1-10 Minutes     Domestic                1
114     07MAR98  LGA   LAX   No Delay         Domestic               -1
202     07MAR98  LGA   ORD   No Delay         Domestic               -2
219     07MAR98  LGA   LON   11+ Minutes      International          15
622     07MAR98  LGA   FRA   11+ Minutes      International          21
132     07MAR98  LGA   YYZ   No Delay         International          -2
271     07MAR98  LGA   PAR   1-10 Minutes     International           4
302     07MAR98  LGA   WAS   No Delay         Domestic                0
;

proc sql outobs=15;
   title "SAMDAT2 Data (Partial)";
   select * from samples.samdat2;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT3 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat3;
   input FLIGHT $3.  +5 DATES date7. +2 DEST $3. +8 BOARDED;
   informat DATES date7.;
   format DATES date9.;
   datalines;
219     01MAR98  LON        198
622     01MAR98  FRA        207
132     01MAR98  YYZ        115
271     01MAR98  PAR        138
219     02MAR98  LON        147
622     02MAR98  FRA        176
132     02MAR98  YYZ        106
271     02MAR98  PAR        172
219     03MAR98  LON        197
622     03MAR98  FRA        180
132     03MAR98  YYZ         75
271     03MAR98  PAR        147
219     04MAR98  LON        232
622     04MAR98  FRA        137
132     04MAR98  YYZ        117
271     04MAR98  PAR        146
219     05MAR98  LON        160
622     05MAR98  FRA        185
132     05MAR98  YYZ        157
271     05MAR98  PAR        177
219     06MAR98  LON        163
132     06MAR98  YYZ        150
219     07MAR98  LON        241
622     07MAR98  FRA        210
132     07MAR98  YYZ        164
271     07MAR98  PAR        155
;

proc sql outobs=15;
   title "SAMDAT3 Data (Partial)";
   select * from samples.samdat3;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT4 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat4;
   input FLIGHT $3. +5 DATES date7. +2 DEST $3. +3 IDNUM $4.;
   format DATES date9.;
   informat DATES date7.;
   datalines;
132     01MAR98  YYZ   1739
132     01MAR98  YYZ   1478
132     01MAR98  YYZ   1130
132     01MAR98  YYZ   1390
132     01MAR98  YYZ   1983
132     01MAR98  YYZ   1111
219     01MAR98  LON   1407
219     01MAR98  LON   1777
219     01MAR98  LON   1103
219     01MAR98  LON   1125
219     01MAR98  LON   1350
219     01MAR98  LON   1332
271     01MAR98  PAR   1439
271     01MAR98  PAR   1442
271     01MAR98  PAR   1132
271     01MAR98  PAR   1411
271     01MAR98  PAR   1988
271     01MAR98  PAR   1443
622     01MAR98  FRA   1545
622     01MAR98  FRA   1890
622     01MAR98  FRA   1116
622     01MAR98  FRA   1221
622     01MAR98  FRA   1433
622     01MAR98  FRA   1352
132     02MAR98  YYZ   1556
132     02MAR98  YYZ   1478
132     02MAR98  YYZ   1113
132     02MAR98  YYZ   1411
132     02MAR98  YYZ   1574
132     02MAR98  YYZ   1111
219     02MAR98  LON   1407
219     02MAR98  LON   1118
219     02MAR98  LON   1132
219     02MAR98  LON   1135
219     02MAR98  LON   1441
219     02MAR98  LON   1332
271     02MAR98  PAR   1739
271     02MAR98  PAR   1442
271     02MAR98  PAR   1103
271     02MAR98  PAR   1413
271     02MAR98  PAR   1115
271     02MAR98  PAR   1443
622     02MAR98  FRA   1439
622     02MAR98  FRA   1890
622     02MAR98  FRA   1124
622     02MAR98  FRA   1368
622     02MAR98  FRA   1477
622     02MAR98  FRA   1352
132     03MAR98  YYZ   1739
132     03MAR98  YYZ   1928
132     03MAR98  YYZ   1425
132     03MAR98  YYZ   1135
132     03MAR98  YYZ   1437
132     03MAR98  YYZ   1111
219     03MAR98  LON   1428
219     03MAR98  LON   1442
219     03MAR98  LON   1130
219     03MAR98  LON   1411
219     03MAR98  LON   1115
219     03MAR98  LON   1332
271     03MAR98  PAR   1905
271     03MAR98  PAR   1118
271     03MAR98  PAR   1970
271     03MAR98  PAR   1125
271     03MAR98  PAR   1983
271     03MAR98  PAR   1443
622     03MAR98  FRA   1545
622     03MAR98  FRA   1830
622     03MAR98  FRA   1414
622     03MAR98  FRA   1368
622     03MAR98  FRA   1431
622     03MAR98  FRA   1352
132     04MAR98  YYZ   1428
132     04MAR98  YYZ   1118
132     04MAR98  YYZ   1103
132     04MAR98  YYZ   1390
132     04MAR98  YYZ   1350
132     04MAR98  YYZ   1111
219     04MAR98  LON   1739
219     04MAR98  LON   1478
219     04MAR98  LON   1130
219     04MAR98  LON   1125
219     04MAR98  LON   1983
219     04MAR98  LON   1332
271     04MAR98  PAR   1407
271     04MAR98  PAR   1410
271     04MAR98  PAR   1094
271     04MAR98  PAR   1411
271     04MAR98  PAR   1115
271     04MAR98  PAR   1443
622     04MAR98  FRA   1545
622     04MAR98  FRA   1890
622     04MAR98  FRA   1116
622     04MAR98  FRA   1221
622     04MAR98  FRA   1433
622     04MAR98  FRA   1352
132     05MAR98  YYZ   1556
132     05MAR98  YYZ   1890
132     05MAR98  YYZ   1113
132     05MAR98  YYZ   1475
132     05MAR98  YYZ   1431
132     05MAR98  YYZ   1111
219     05MAR98  LON   1428
219     05MAR98  LON   1442
219     05MAR98  LON   1422
219     05MAR98  LON   1413
219     05MAR98  LON   1574
219     05MAR98  LON   1332
271     05MAR98  PAR   1739
271     05MAR98  PAR   1928
271     05MAR98  PAR   1103
271     05MAR98  PAR   1477
271     05MAR98  PAR   1433
271     05MAR98  PAR   1443
622     05MAR98  FRA   1545
622     05MAR98  FRA   1830
622     05MAR98  FRA   1970
622     05MAR98  FRA   1441
622     05MAR98  FRA   1350
622     05MAR98  FRA   1352
132     06MAR98  YYZ   1333
132     06MAR98  YYZ   1890
132     06MAR98  YYZ   1414
132     06MAR98  YYZ   1475
132     06MAR98  YYZ   1437
132     06MAR98  YYZ   1111
219     06MAR98  LON   1106
219     06MAR98  LON   1118
219     06MAR98  LON   1425
219     06MAR98  LON   1434
219     06MAR98  LON   1555
219     06MAR98  LON   1332
132     07MAR98  YYZ   1407
132     07MAR98  YYZ   1118
132     07MAR98  YYZ   1094
132     07MAR98  YYZ   1555
132     07MAR98  YYZ   1350
132     07MAR98  YYZ   1111
219     07MAR98  LON   1905
219     07MAR98  LON   1478
219     07MAR98  LON   1124
219     07MAR98  LON   1434
219     07MAR98  LON   1983
219     07MAR98  LON   1332
271     07MAR98  PAR   1410
271     07MAR98  PAR   1777
271     07MAR98  PAR   1103
271     07MAR98  PAR   1574
271     07MAR98  PAR   1115
271     07MAR98  PAR   1443
622     07MAR98  FRA   1107
622     07MAR98  FRA   1890
622     07MAR98  FRA   1425
622     07MAR98  FRA   1475
622     07MAR98  FRA   1433
622     07MAR98  FRA   1352
;

proc sql outobs=15;
   title "SAMDAT4 Data (Partial)";
   select * from samples.samdat4;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT5 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat5;
   input IDNUM $4. +3 SEX $1. +4 JOBCODE $3. +8 SALARY 6.
         +2 BIRTH date7. +2 HIRED date7.;
   informat BIRTH date7. HIRED date7.;
   format BIRTH date9. HIRED date9.;
   datalines;
1919   M    TA2         34376  12SEP60  04JUN87
1653   F    ME2         35108  15OCT64  09AUG90
1400   M    ME1         29769  05NOV67  16OCT90
1350   F    FA3         32886  31AUG65  29JUL90
1401   M    TA3         38822  13DEC50  17NOV85
1499   M    ME3         43025  26APR54  07JUN80
1101   M    SCP         18723  06JUN62  01OCT90
1333   M    PT2         88606  30MAR61  10FEB81
1402   M    TA2         32615  17JAN63  02DEC90
1479   F    TA3         38785  22DEC68  05OCT89
1403   M    ME1         28072  28JAN69  21DEC91
1739   M    PT1         66517  25DEC64  27JAN91
1658   M    SCP         17943  08APR67  29FEB92
1428   F    PT1         68767  04APR60  16NOV91
1782   M    ME2         35345  04DEC70  22FEB92
1244   M    ME2         36925  31AUG63  17JAN88
1383   M    BCK         25823  25JAN68  20OCT92
1574   M    FA2         28572  27APR60  20DEC92
1789   M    SCP         18326  25JAN57  11APR78
1404   M    PT2         91376  24FEB53  01JAN80
1437   F    FA3         33104  20SEP60  31AUG84
1639   F    TA3         40260  26JUN57  28JAN84
1269   M    NA1         41690  03MAY72  28NOV92
1065   M    ME2         35090  26JAN44  07JAN87
1876   M    TA3         39675  20MAY58  27APR85
1037   F    TA1         28558  10APR64  13SEP92
1129   F    ME2         34929  08DEC61  17AUG91
1988   M    FA3         32217  30NOV59  18SEP84
1405   M    SCP         18056  05MAR66  26JAN92
1430   F    TA2         32925  28FEB62  27APR87
1983   F    FA3         33419  28FEB62  27APR87
1134   F    TA2         33462  05MAR69  21DEC88
1118   M    PT3        111379  16JAN44  18DEC80
1438   F    TA3         39223  15MAR65  18NOV87
1125   F    FA2         28888  08NOV68  11DEC87
1475   F    FA2         27787  15DEC61  13JUL90
1117   M    TA3         39771  05JUN63  13AUG92
1935   F    NA2         51081  28MAR54  16OCT81
1124   F    FA1         23177  10JUL58  01OCT90
1422   F    FA1         22454  04JUN64  06APR91
1616   F    TA2         34137  01MAR70  04JUN93
1406   M    ME2         35185  08MAR61  17FEB87
1120   M    ME1         28619  11SEP72  07OCT93
1094   M    FA1         22268  02APR70  17APR91
1389   M    BCK         25028  15JUL59  18AUG90
1905   M    PT1         65111  16APR72  29MAY92
1407   M    PT1         68096  23MAR69  18MAR90
1114   F    TA2         32928  18SEP69  27JUN87
1410   M    PT2         84685  03MAY67  07NOV86
1439   F    PT1         70736  06MAR64  10SEP90
1409   M    ME3         41551  19APR50  22OCT81
1408   M    TA2         34138  29MAR60  14OCT87
1121   M    ME1         29112  26SEP71  07DEC91
1991   F    TA1         27645  07MAY72  12DEC92
1102   M    TA2         34542  01OCT59  15APR91
1356   M    ME2         36869  26SEP57  22FEB83
1545   M    PT1         66130  12AUG59  29MAY90
1292   F    ME2         36691  28OCT64  02JUL89
1440   F    ME2         35757  27SEP62  09APR91
1368   M    FA2         27808  11JUN61  03NOV84
1369   M    TA2         33705  28DEC61  13MAR87
1411   M    FA2         27265  27MAY61  01DEC89
1113   F    FA1         22367  15JAN68  17OCT91
1704   M    BCK         25465  30AUG66  28JUN87
1900   M    ME2         35105  25MAY62  27OCT87
1126   F    TA3         40899  28MAY63  21NOV80
1677   M    BCK         26007  05NOV63  27MAR89
1441   F    FA2         27158  19NOV69  23MAR91
1421   M    TA2         33155  08JAN59  28FEB90
1119   M    TA1         26924  20JUN62  06SEP88
1834   M    BCK         26896  08FEB72  02JUL92
1777   M    PT3        109630  23SEP51  21JUN81
1663   M    BCK         26452  11JAN67  11AUG91
1106   M    PT2         89632  06NOV57  16AUG84
1103   F    FA1         23738  16FEB68  23JUL92
1477   M    FA2         28566  21MAR64  07MAR88
1476   F    TA2         34803  30MAY66  17MAR87
1379   M    ME3         42264  08AUG61  10JUN84
1104   M    SCP         17946  25APR63  10JUN91
1009   M    TA1         28880  02MAR59  26MAR92
1412   M    ME1         27799  18JUN56  05DEC91
1115   F    FA3         32699  22AUG60  29FEB80
1128   F    TA2         32777  23MAY65  20OCT90
1442   F    PT2         84536  05SEP66  12APR88
1417   M    NA2         52270  27JUN64  07MAR89
1478   M    PT2         84203  09AUG59  24OCT90
1673   M    BCK         25477  27FEB70  15JUL91
1839   F    NA1         43433  29NOV70  03JUL93
1347   M    TA3         40079  21SEP67  06SEP84
1423   F    ME2         35773  14MAY68  19AUG90
1200   F    ME1         27816  10JAN71  14AUG92
1970   F    FA1         22615  25SEP64  12MAR91
1521   M    ME3         41526  12APR63  13JUL88
1354   F    SCP         18335  29MAY71  16JUN92
1424   F    FA2         28978  04AUG69  11DEC89
1132   F    FA1         22413  30MAY72  22OCT93
1845   M    BCK         25996  20NOV59  22MAR80
1556   M    PT1         71349  22JUN64  11DEC91
1413   M    FA2         27435  16SEP65  02JAN90
1123   F    TA1         28407  31OCT72  05DEC92
1907   M    TA2         33329  15NOV60  06JUL87
1436   F    TA2         34475  11JUN64  12MAR87
1385   M    ME3         43900  16JAN62  01APR86
1432   F    ME2         35327  03NOV61  10FEB85
1111   M    NA1         40586  14JUL73  31OCT92
1116   F    FA1         22862  28SEP69  21MAR91
1352   M    NA2         53798  02DEC60  16OCT86
1555   F    FA2         27499  16MAR68  04JUL92
1038   F    TA1         26533  09NOV69  23NOV91
1420   M    ME3         43071  19FEB65  22JUL87
1561   M    TA2         34514  30NOV63  07OCT87
1434   F    FA2         28622  11JUL62  28OCT90
1414   M    FA1         23644  24MAR72  12APR92
1112   M    TA1         26905  29NOV64  07DEC92
1390   M    FA2         27761  19FEB65  23JUN91
1332   M    NA1         42178  17SEP70  04JUN91
1890   M    PT2         91908  20JUL51  25NOV79
1429   F    TA1         27939  28FEB60  07AUG92
1107   M    PT2         89977  09JUN54  10FEB79
1908   F    TA2         32995  10DEC69  23APR90
1830   F    PT2         84471  27MAY57  29JAN83
1882   M    ME3         41538  10JUL57  21NOV78
1050   M    ME2         35167  14JUL63  24AUG86
1425   F    FA1         23979  28DEC71  28FEB93
1928   M    PT2         89858  16SEP54  13JUL90
1480   F    TA3         39583  03SEP57  25MAR81
1100   M    BCK         25004  01DEC60  07MAY88
1995   F    ME1         28810  24AUG73  19SEP93
1135   F    FA2         27321  20SEP60  31MAR90
1415   M    FA2         28278  09MAR58  12FEB88
1076   M    PT1         66558  14OCT55  03OCT91
1426   F    TA2         32991  05DEC66  25JUN90
1564   F    SCP         18833  12APR62  01JUL92
1221   F    FA2         27896  22SEP67  04OCT91
1133   M    TA1         27701  13JUL66  12FEB92
1435   F    TA3         38808  12MAY59  08FEB80
1418   M    ME1         28005  29MAR57  06JAN92
1017   M    TA3         40858  28DEC57  16OCT81
1443   F    NA1         42274  17NOV68  29AUG91
1131   F    TA2         32575  26DEC71  19APR91
1427   F    TA2         34046  31OCT70  30JAN90
1036   F    TA3         39392  19MAY65  23OCT84
1130   F    FA1         23916  16MAY71  05JUN92
1127   F    TA2         33011  09NOV64  07DEC86
1433   F    FA3         32982  08JUL66  17JAN87
1431   F    FA3         33230  09JUN64  05APR88
1122   F    FA2         27956  01MAY63  27NOV88
1105   M    ME2         34805  01MAR62  13AUG90
;

proc sql outobs=15;
   title "SAMDAT5 Data (Partial)";
   select * from samples.samdat5;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT6 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat6;
   input IDNUM $4. +3 SEX $1. +4 JOBCODE $3. +9 SALARY 5.
         +2 BIRTH date7. +2 HIRED date7.;
   informat BIRTH date7. HIRED date7.;
   format BIRTH date9. HIRED date9.;
   datalines;
1639   F    TA3         42260  26JUN57  28JAN84
1065   M    ME3         38090  26JAN44  07JAN87
1561   M    TA3         36514  30NOV63  07OCT87
1221   F    FA3         29896  22SEP67  04OCT91
1447   F    FA1         22123  07AUG72  29OCT92
1998   M    SCP         23100  10SEP70  02NOV92
1036   F    TA3         42465  19MAY65  23OCT84
1106   M    PT3         94039  06NOV57  16AUG84
1129   F    ME3         36758  08DEC61  17AUG91
1350   F    FA3         36098  31AUG65  29JUL90
1369   M    TA3         36598  28DEC61  13MAR87
1076   M    PT1         69742  14OCT55  03OCT91
;

proc sql;
   title "SAMDAT6 Data";
   select * from samples.samdat6;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT7 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat7;
   input IDNUM $4. +3 LNAME $15. +2 FNAME $15. +2 CITY $15. +2
         STATE $2. +5 HPHONE $12.;
   datalines;
1919   ADAMS            GERALD           STAMFORD         CT     203/781-1255
1653   ALIBRANDI        MARIA            BRIDGEPORT       CT     203/675-7715
1400   ALHERTANI        ABDULLAH         NEW YORK         NY     212/586-0808
1350   ALVAREZ          MERCEDES         NEW YORK         NY     718/383-1549
1401   ALVAREZ          CARLOS           PATERSON         NJ     201/732-8787
1499   BAREFOOT         JOSEPH           PRINCETON        NJ     201/812-5665
1101   BAUCOM           WALTER           NEW YORK         NY     212/586-8060
1333   BANADYGA         JUSTIN           STAMFORD         CT     203/781-1777
1402   BLALOCK          RALPH            NEW YORK         NY     718/384-2849
1479   BALLETTI         MARIE            NEW YORK         NY     718/384-8816
1403   BOWDEN           EARL             BRIDGEPORT       CT     203/675-3434
1739   BRANCACCIO       JOSEPH           NEW YORK         NY     212/587-1247
1658   BREUHAUS         JEREMY           NEW YORK         NY     212/587-3622
1428   BRADY            CHRISTINE        STAMFORD         CT     203/781-1212
1782   BREWCZAK         JAKOB            STAMFORD         CT     203/781-0019
1244   BUCCI            ANTHONY          NEW YORK         NY     718/383-3334
1383   BURNETTE         THOMAS           NEW YORK         NY     718/384-3569
1574   CAHILL           MARSHALL         NEW YORK         NY     718/383-2338
1789   CARAWAY          DAVIS            NEW YORK         NY     212/587-9000
1404   COHEN            LEE              NEW YORK         NY     718/384-2946
1437   CARTER           DOROTHY          BRIDGEPORT       CT     203/675-4117
1639   CARTER-COHEN     KAREN            STAMFORD         CT     203/781-8839
1269   CASTON           FRANKLIN         STAMFORD         CT     203/781-3335
1065   COPAS            FREDERICO        NEW YORK         NY     718/384-5618
1876   CHIN             JACK             NEW YORK         NY     212/588-5634
1037   CHOW             JANE             STAMFORD         CT     203/781-8868
1129   COUNIHAN         BRENDA           NEW YORK         NY     718/383-2313
1988   COOPER           ANTHONY          NEW YORK         NY     212/587-1228
1405   DACKO            JASON            PATERSON         NJ     201/732-2323
1430   DABROWSKI        SANDRA           BRIDGEPORT       CT     203/675-1647
1983   DEAN             SHARON           NEW YORK         NY     718/384-1647
1134   DELGADO          MARIA            STAMFORD         CT     203/781-1528
1118   DENNIS           ROGER            NEW YORK         NY     718/383-1122
1438   DABBOUSSI        KAMILLA          STAMFORD         CT     203/781-2229
1125   DUNLAP           DONNA            NEW YORK         NY     718/383-2094
1475   ELGES            MARGARETE        NEW YORK         NY     718/383-2828
1117   EDGERTON         JOSHUA           NEW YORK         NY     212/588-1239
1935   FERNANDEZ        KATRINA          BRIDGEPORT       CT     203/675-2962
1124   FIELDS           DIANA            WHITE PLAINS     NY     914/455-2998
1422   FUJIHARA         KYOKO            PRINCETON        NJ     201/812-0902
1616   FUENTAS          CARLA            NEW YORK         NY     718/384-3329
1406   FOSTER           GERALD           BRIDGEPORT       CT     203/675-6363
1120   GARCIA           JACK             NEW YORK         NY     718/384-4930
1094   GOMEZ            ALAN             BRIDGEPORT       CT     203/675-7181
1389   GOLDSTEIN        LEVI             NEW YORK         NY     718/384-9326
1905   GRAHAM           ALVIN            NEW YORK         NY     212/586-8815
1407   GREGORSKI        DANIEL           MT. VERNON       NY     914/468-1616
1114   GREENWALD        JANICE           NEW YORK         NY     212/588-1092
1410   HARRIS           CHARLES          STAMFORD         CT     203/781-0937
1439   HASENHAUER       CHRISTINA        BRIDGEPORT       CT     203/675-4987
1409   HAVELKA          RAYMOND          STAMFORD         CT     203/781-9697
1408   HENDERSON        WILLIAM          PRINCETON        NJ     201/812-4789
1121   HERNANDEZ        ROBERTO          NEW YORK         NY     718/384-3313
1991   HOWARD           GRETCHEN         BRIDGEPORT       CT     203/675-0007
1102   HERMANN          JOACHIM          WHITE PLAINS     NY     914/455-0976
1356   HOWARD           MICHAEL          NEW YORK         NY     212/586-8411
1545   HERRERO          CLYDE            STAMFORD         CT     203/781-1119
1292   HUNTER           HELEN            BRIDGEPORT       CT     203/675-4830
1440   JACKSON          LAURA            STAMFORD         CT     203/781-0088
1368   JEPSEN           RONALD           STAMFORD         CT     203/781-8413
1369   JONSON           ANTHONY          NEW YORK         NY     212/587-5385
1411   JOHNSON          JACKSON          PATERSON         NJ     201/732-3678
1113   JONES            LESLIE           NEW YORK         NY     718/383-3003
1704   JONES            NATHAN           NEW YORK         NY     718/384-0049
1900   KING             WILLIAM          NEW YORK         NY     718/383-3698
1126   KIMANI           ANNE             NEW YORK         NY     212/586-1229
1677   KRAMER           JACKSON          BRIDGEPORT       CT     203/675-7432
1441   LAWRENCE         KATHY            PRINCETON        NJ     201/812-3337
1421   LEE              RUSSELL          MT. VERNON       NY     914/468-9143
1119   LI               JEFF             NEW YORK         NY     212/586-2344
1834   LEBLANC          RUSSELL          NEW YORK         NY     718/384-0040
1777   LUFKIN           ROY              NEW YORK         NY     718/383-4413
1663   MARKS            JOHN             NEW YORK         NY     212/587-7742
1106   MARSHBURN        JASPER           STAMFORD         CT     203/781-1457
1103   MCDANIEL         RONDA            NEW YORK         NY     212/586-0013
1477   MEYERS           PRESTON          BRIDGEPORT       CT     203/675-8125
1476   MONROE           JOYCE            STAMFORD         CT     203/781-2837
1379   MORGAN           ALFRED           STAMFORD         CT     203/781-2216
1104   MORGAN           CHRISTOPHER      NEW YORK         NY     718/383-9740
1009   MORGAN           GEORGE           NEW YORK         NY     212/586-7753
1412   MURPHEY          JOHN             PRINCETON        NJ     201/812-4414
1115   MURPHY           ALICE            NEW YORK         NY     718/384-1982
1128   NELSON           FELICIA          BRIDGEPORT       CT     203/675-1166
1442   NEWKIRK          SANDRA           PRINCETON        NJ     201/812-3331
1417   NEWKIRK          WILLIAM          PATERSON         NJ     201/732-6611
1478   NEWTON           JAMES            NEW YORK         NY     212/587-5549
1673   NICHOLLS         HENRY            STAMFORD         CT     203/781-7770
1839   NORRIS           DIANE            NEW YORK         NY     718/384-1767
1347   O'NEAL           BRYAN            NEW YORK         NY     718/384-0230
1423   OSWALD           LESLIE           MT. VERNON       NY     914/468-9171
1200   OVERMAN          MICHELLE         STAMFORD         CT     203/781-1835
1970   PARKER           ANNE             NEW YORK         NY     718/383-3895
1521   PARKER           JAY              NEW YORK         NY     212/587-7603
1354   PARKER           MARY             WHITE PLAINS     NY     914/455-2337
1424   PATTERSON        RENEE            NEW YORK         NY     212/587-8991
1132   PEARCE           CAROL            NEW YORK         NY     718/384-1986
1845   PEARSON          JAMES            NEW YORK         NY     718/384-2311
1556   PENNINGTON       MICHAEL          NEW YORK         NY     718/383-5681
1413   PETERS           RANDALL          PRINCETON        NJ     201/812-2478
1123   PETERSON         SUZANNE          NEW YORK         NY     718/383-0077
1907   PHELPS           WILLIAM          STAMFORD         CT     203/781-1118
1436   PORTER           SUSAN            NEW YORK         NY     718/383-5777
1385   RAYNOR           MILTON           BRIDGEPORT       CT     203/675-2846
1432   REED             MARILYN          MT. VERNON       NY     914/468-5454
1111   RHODES           JEREMY           PRINCETON        NJ     201/812-1837
1116   RICHARDS         CASEY            NEW YORK         NY     212/587-1224
1352   RIVERS           SIMON            NEW YORK         NY     718/383-3345
1555   RODRIGUEZ        JULIA            BRIDGEPORT       CT     203/675-2401
1038   RODRIGUEZ        MARIA            BRIDGEPORT       CT     203/675-2048
1420   ROUSE            JEREMY           PATERSON         NJ     201/732-9834
1561   SANDERS          RAYMOND          NEW YORK         NY     212/588-6615
1434   SANDERSON        EDITH            STAMFORD         CT     203/781-1333
1414   SANDERSON        NATHAN           BRIDGEPORT       CT     203/675-1715
1112   SAYERS           RANDY            NEW YORK         NY     718/384-4895
1390   SMART            JONATHAN         NEW YORK         NY     718/383-1141
1332   STEPHENSON       ADAM             BRIDGEPORT       CT     203/675-1497
1890   STEPHENSON       ROBERT           NEW YORK         NY     718/384-9874
1429   THOMPSON         ALICE            STAMFORD         CT     203/781-3857
1107   THOMPSON         WAYNE            NEW YORK         NY     718/384-3785
1908   TRENTON          MELISSA          NEW YORK         NY     212/586-6262
1830   TRIPP            KATHY            BRIDGEPORT       CT     203/675-2479
1882   TUCKER           ALAN             NEW YORK         NY     718/384-0216
1050   TUTTLE           THOMAS           WHITE PLAINS     NY     914/455-2119
1425   UNDERWOOD        JENNY            STAMFORD         CT     203/781-0978
1928   UPCHURCH         LARRY            WHITE PLAINS     NY     914/455-5009
1480   UPDIKE           THERESA          NEW YORK         NY     212/587-8729
1100   VANDEUSEN        RICHARD          NEW YORK         NY     212/586-2531
1995   VARNER           ELIZABETH        NEW YORK         NY     718/384-7113
1135   VEGA             ANNA             NEW YORK         NY     718/384-5913
1415   VEGA             FRANKLIN         NEW YORK         NY     718/384-2823
1076   VENTER           RANDALL          NEW YORK         NY     718/383-2321
1426   VICK             THERESA          PRINCETON        NJ     201/812-2424
1564   WALTERS          ANNE             NEW YORK         NY     212/587-3257
1221   WALTERS          DIANE            NEW YORK         NY     718/384-1918
1133   WANG             CHIN             NEW YORK         NY     212/587-1956
1435   WARD             ELAINE           NEW YORK         NY     718/383-4987
1418   WATSON           BERNARD          NEW YORK         NY     718/383-1298
1017   WELCH            DARIUS           NEW YORK         NY     212/586-5535
1443   WELLS            AGNES            STAMFORD         CT     203/781-5546
1131   WELLS            NADINE           NEW YORK         NY     718/383-1045
1427   WHALEY           CAROLYN          MT. VERNON       NY     914/468-4528
1036   WONG             LESLIE           NEW YORK         NY     212/587-2570
1130   WOOD             DEBORAH          NEW YORK         NY     212/587-0013
1127   WOOD             SANDRA           NEW YORK         NY     212/587-2881
1433   YANCEY           ROBIN            PRINCETON        NJ     201/812-1874
1431   YOUNG            DEBORAH          STAMFORD         CT     203/781-2987
1122   YOUNG            JOANN            NEW YORK         NY     718/384-2021
1105   YOUNG            LAWRENCE         NEW YORK         NY     718/384-0008
;

proc sql outobs=15;
   title "SAMDAT7 Data (Partial)";
   select * from samples.samdat7;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT8 TABLE           */
  /*--------------------------------------------------------*/

data samples.samdat8;
   input SUPID $4. +8 STATE $2. +5  JOBCAT  $2.;
   label SUPID='Supervisor Id' JOBCAT='Job Category';
   datalines;
1677        CT     BC
1834        NY     BC
1431        CT     FA
1433        NJ     FA
1983        NY     FA
1385        CT     ME
1420        NJ     ME
1882        NY     ME
1935        CT     NA
1417        NJ     NA
1352        NY     NA
1106        CT     PT
1442        NJ     PT
1118        NY     PT
1405        NJ     SC
1564        NY     SC
1639        CT     TA
1401        NJ     TA
1126        NY     TA
;

proc sql  outobs=15;
   title "SAMDAT8 Data (Partial)";
   select * from samples.samdat8;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT9 TABLE          */
  /*--------------------------------------------------------*/

DATA samples.SAMDAT9;
    INPUT  @1  INVNUM   5.          /* INVOICE NUMBER - THIS IS */
                                    /* THE PRIMARY KEY          */

           @7  BILLEDTO $8.         /* COMPANY THAT PLACED THE  */
                                    /* THE ORDER - THIS IS A    */
                                    /* FOREIGN KEY THAT RELATES */
                                    /* TO THE CUSTOMER COLUMN IN*/
                                    /* SAMDAT11                */

           @15 AMTBILL  15.2        /* AMOUNT OF BILL IN LOCAL  */
                                    /* CURRENCY                 */
           @30 COUNTRY  $20.
           @50 AMTINUS  11.2 /      /* AMOUNT OF BILL IN U.S.   */
                                    /* DOLLARS                  */

           @1  BILLEDBY 6.          /* EMPLOYEE THAT WROTE THE  */
                                    /* BILL - THIS IS A FOREIGN */
                                    /* KEY THAT RELATES TO THE  */
                                    /* EMPID COLUMN IN THE      */
                                    /* SAMDAT10 TABLE          */

           @10 BILLEDON DATE7.      /* DATE THAT BILL WAS SENT  */

           @20 PAIDON   DATE7. ;    /* DATE THAT BILL WAS PAID  */
    FORMAT BILLEDON DATE9.  PAIDON DATE9.;
    DATALINES;
11270 39045213  8738600640.00Brazil               2256870.00
239185   05OCT98   18OCT98
11271 18543489    11063836.00USA                 11063836.00
457232   05OCT98
11273 19783482      252148.50USA                   252148.50
239185   06OCT98   11NOV98
11276 14324742     1934460.00USA                  1934460.00
135673   06OCT98   20OCT98
11278 14898029     1400825.00USA                  1400825.00
239185   06OCT98   19OCT98
11280 39045213  8738600640.00Brazil               2256870.00
423286   07OCT98   20OCT98
11282 19783482      252148.50USA                   252148.50
457232   07OCT98   25OCT98
11285 38763919     2234301.30Argentina            2256870.00
239185   10OCT98   30NOV98
11286 43459747    14836604.08Australia           11063836.00
423286   10OCT98         .
11287 15432147      252148.50USA                   252148.50
457232   11OCT98   04NOV98
12051 39045213  8738600640.00Brazil               2256870.00
457232   02NOV98         .
12102 18543489    11063836.00USA                 11063836.00
239185   17NOV98         .
12263 19783482      252148.50USA                   252148.50
423286   05DEC98         .
12468 14898029     1400825.00USA                  1400825.00
135673   24DEC98   02JAN99
12471 39045213  8738600640.00Brazil               2256870.00
457232   27DEC98         .
12476 38763919     2234301.30Argentina            2256870.00
135673   24DEC98         .
12478 15432147      252148.50USA                   252148.50
423286   24DEC98   02JAN99
   ;

proc sql outobs=15;
   title "SAMDAT9 Data (Partial)";
   select * from samples.samdat9;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT10 TABLE          */
  /*--------------------------------------------------------*/

DATA samples.SAMDAT10;
    INPUT @1  EMPID     6.          /* EMPLOYEE ID NUMBER - THIS */
                                    /* IS THE PRIMARY KEY        */
          @10 HIREDATE  DATE7.
          @20 SALARY    8.2
          @30 DEPT      $6.
          @40 JOBCODE   5.
          @47 GENDER    $1.


          @50 BIRTHDTE  DATE7. /
          @1  LASTNAME  $18.
          @20 FRSTNAME  $15.
          @40 MIDNAME   $15.
          @60 PHONE     $4. ;
    FORMAT HIREDATE DATE9.  BIRTHDTE DATE9.;
    DATALINES;
119012   01JUL73   42340.58  CSR010      602  F  05JAN51
WOLF-PROVENZA      G.                  ANDREA              3467
120591   05DEC85   31000.55  SHP002      602  F  12FEB451
HAMMERSTEIN        S.                  RACHAEL             3287
123456   04APR94        .    ACC043     1204           .
VARGAS             CHRIS               J.
127845   16JAN73   75320.34  ACC024      204  M  25DEC48
MEDER              VLADIMIR            JORAN               6231
129540   01AUG87   56123.34  SHP002      204  F  31JUL65
CHOULAI            CLARA               JANE                3921
135673   15JUL89   46322.58  ACC013      602  F  21MAR66
HEMESLY            STEPHANIE           J.                  6329
212916   15FEB58   52345.58  CSR010      602  F  29MAY35
WACHBERGER         MARIE-LOUISE        TERESA              8562
216382   15JUN90   34004.65  SHP013      602  F  24JUL68
PURINTON           PRUDENCE            VALENTINE           3852
234967   19DEC93   17000.00  CSR004      602  M  21DEC72
SMITH              GILBERT             IRVINE              7274
237642   01NOV81   43200.34  SHP013      602  M  13MAR59
BATTERSBY          R.                  STEPHEN             8342
239185   07MAY86   57920.66  ACC024      602  M  28AUG64
DOS REMEDIOS       LEONARD             WESLEY              4892
254896   04APR90   35000.74  CSR011      204  M  06APR54
TAYLOR-HUNYADI     ITO                 MISHIMA             0231
321783   10SEP73   48931.58  CSR011      602  M  03JUN40
GONZALES           GUILLERMO           RICARDO             3642
328140   10JAN80   75000.34  ACC043     1204  F  02JUN56
MEDINA-SIDONIA     MARGARET            ROSE                5901
346917   02MAR92   46000.33  SHP013     1204  F  15MAR55
SHIEKELESLAM       SHALA               Y.                  8745
356134   14JUN90   62450.75  ACC013      204  F  25OCT65
DUNNETT            CHRISTINE           MARIE               4213
423286   19DEC93   32870.66  ACC024      602  M  31OCT69
MIFUNE             YUKIO               TOSHIRO             3278
456910   14JUN83   45000.58  CSR010      602  M  24SEP58
ARDIS              RICHARD             BINGHAM             4351
456921   19AUG92   33210.04  SHP002      602  M  12MAY67
KRAUSE             KARL-HEINZ          G.                  7452
457232   15JUL90   55000.66  ACC013      602  M  15OCT68
LOVELL             WILLIAM             SINCLAIR            6321
459287   02NOV69   50000.00  SHP024      204  M  05JAN39
RODRIGUES          JUAN                M.                  5879
677890   12DEC93   37610.00  CSR010      204  F  24APR70
NISHIMATSU-LYNCH   CAROL               ANNE                6245
  ;

proc sql  outobs=15;
   title "SAMDAT10 Data (Partial)";
   select * from samples.samdat10;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT11 TABLE          */
  /*--------------------------------------------------------*/

DATA samples.SAMDAT11;
     INPUT @1   CUSTOMER    $8.       /* CUSTOMER NUMBER - THIS */
                                      /* IS THE PRIMARY KEY     */
           @10  STATE       $2.
           @13  ZIPCODE     $5.       /* ZIPCODE IF COMPANY IS  */
                                      /* IN THE U.S., OTHERWISE */
                                      /* IT IS THE MAIL CODE    */
                                      /* APPROPRIATE FOR THE    */
                                      /* COUNTRY WHERE THE      */
                                      /* COMPANY IS LOCATED     */
           @20  COUNTRY     $20.
           @42  PHONE       $12.  /
           @1   NAME        $60.  /   /* CUSTOMER'S COMPANY NAME*/
           @1   CONTACT     $30.      /* CONTACT AT CUSTOMER'S  */
                                      /* COMPANY                */
           @31  ADDRESS     $40.  /
           @1   CITY        $25.
           @30  FIRSTORD    DATE7.;   /* DATE OF FIRST ORDER    */
     FORMAT FIRSTORD DATE9.;
     DATALINES;
12345678 NC     .                        919/489-5682


                             28AUG93
14324742 CA 95123  USA                   408/629-0589
SANTA CLARA VALLEY TECHNOLOGY SPECIALISTS
A. BAUM                       5089 CALERO AVENUE
SAN JOSE                     05FEB65
14569877 NC 27514  USA                   919/489-6792
PRECISION PRODUCTS
CHARLES BARON                 198 FAYETTEVILLE ROAD
MEMPHIS                      15AUG83
14898029 MD 20850  USA                   301/760-2541
UNIVERSITY BIOMEDICAL MATERIALS
S. TURNER                     1598 PICCARD DRIVE
ROCKVILLE                    12NOV76
15432147 MI 49001  USA                   616/582-3906
GREAT LAKES LABORATORY EQUIPMENT MANUFACTURERS
D.W. KADARAUCH                103 HARRIET STREET
KALAMAZOO                    28APR86
18543489 TX 78701  USA                   512/478-0788
LONE STAR STATE RESEARCH SUPPLIERS
A. SILVERIA                   5609 RIO GRANDE
AUSTIN                       10SEP79
19783482 VA 22090  USA                   703/714-2900
TWENTY-FIRST CENTURY MATERIALS
M.R. HEFFERNAN                4613 MICHAEL FARADAY DRIVE
RESTON                       18JUL68
19876078 CA 93274  USA                   209/686-3953
SAN JOAQUIN SCIENTIFIC AND INDUSTRIAL SUPPLY, INC.
J.A. WHITTEN                  1095 HIGHWAY 99 SOUTH
TULARE                       11MAY79
26422096    75014  France                  4268-54-72
SOCIETE DE RECHERCHES POUR LA CHIRURGIE ORTHOPEDIQUE
Y. CHAVANON                   40 RUE PERIGNON
LA ROCHELLE                  14JUN83
26984578     5110  Austria                   43-57-04
INSTITUT FUER TEXTIL-FORSCHUNG
GUNTER SPIELMANN              MECHITARISTENGASSE 5
VIENNA                       25MAY87
27654351     5010  Belgium               02/215-37-32
INSTITUT DE RECHERCHE SCIENTIFIQUE MEDICALE
I. CLEMENS                    103 RUE D'EGMONT
BRUSSELS                     14OCT86
28710427 HV  3607  Netherlands            (021)570517
ANTONIE VAN LEEUWENHOEK VERENIGING VOOR MICROBIOLOGIE
M.C. BORGSTEEDE               BIRMOERSTRAAT 34
THE HAGUE                    10OCT85
29834248        .  Britain               (0552)715311
BRITISH MEDICAL RESEARCH AND SURGICAL SUPPLY
A.D.M. BRYCESON               44 PRINCESS GATE, HYDE PARK
LONDON, SW7 1PU              29JAN86
31548901 BC     .  Canada                406/422-3413
NATIONAL COUNCIL FOR MATERIALS RESEARCH
W.E. MACDONALD                5063 RICHMOND MALL
VANCOUVER, V5T 1L2           19MAR84
38763919     1405  Argentina                 244-6324
INSTITUTO DE BIOLOGIA Y MEDICINA NUCLEAR
JORGE RUNNAZZO                SALGUERO 2345
BUENOS AIRES                 10DEC84
39045213 SP  1051  Brazil                012/302-1021
LABORATORIO DE PESQUISAS VETERINARIAS DESIDERIO FINAMOR
ELISABETE REGIS GUILLAUMON    RUA DONA ANTONIA DE QUEIROS 381
SAO PAULO                    18AUG82
43290587        .  Japan                 (02)933-3212
HASSEI SAIBO GAKKAI
Y. FUKUDA                     3-2-7 ETCHUJMA, KOTO-KU
TOKYO 101                    08FEB74
43459747     3181  Australia              03/734-5111
RESEARCH OUTFITTERS
R.G. HUGHES                   191 LOWER PLENTY ROAD
PRAHRAN, VICTORIA            28JUL72
46543295        .  Japan                 (03)022-2332
WESTERN TECHNOLOGICAL SUPPLY
                              4-3-8 ETCHUJMA, KOTO-KU
TOKYO 102                    19APR84
46783280     2374  Singapore                  3762855
NGEE TECHNOLOGICAL INSTITUTE
LING TAO SOON                 356 CLEMENTI ROAD
SINGAPORE                    27SEP79
48345514        .  United Arab Emirates        213445
GULF SCIENTIFIC SUPPLIES
J.Q. RIFAII                   POB 8032
RAS AL KHAIMAH               10SEP86
;

proc sql  outobs=15;
   title "SAMDAT11 Data (Partial)";
   select * from samples.samdat11;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA FILE FOR THE SAMDAT12 TABLE          */
  /*--------------------------------------------------------*/
DATA samples.SAMDAT12;
    INPUT @1  ORDERNUM 5.       /* ORDER NUMBER - THIS IS THE   */
                                /* PRIMARY KEY                  */

          @6  STOCKNUM 4.       /* STOCK NUMBER - THIS IS A     */
                                /* FOREIGN KEY THAT RELATES TO  */
                                /* PRODUCTID COLUMN IN THE      */
                                /* SPECPROD TABLE               */

          @10 LENGTH   4.       /* LENGTH OF MATERIAL ORDERED   */

          @15 FABCHARG 11.2     /* FABRIC CHARGES               */

          @27 SHIPTO   $8.      /* CUSTOMER THAT ORDER IS TO BE */
                                /* SHIPPED TO- THIS IS A FOREIGN*/
                                /* KEY THAT RELATES TO THE      */
                                /* CUSTOMER COLUMN IN THE       */
                                /* CUST TABLE              */

          @35 DATEORD  DATE7.   /* DATE OF ORDER                */
          @45 SHIPPED  DATE7.   /* DATE THAT ORDER WAS SHIPPED  */

          @55 TAKENBY  6.       /* EMPLOYEE THAT TOOK THE ORDER */
                                /* THIS IS A FOREIGN KEY THAT   */
                                /* RELATES TO THE EMPID COLUMN  */
                                /* IN EMP                       */

          @62 PROCSBY  6.       /* EMPLOYEE THAT PROCESSED THE  */
                                /* THE ORDER - THIS IS A FOREIGN*/
                                /* KEY THAT RELATES TO THE EMPID*/
                                /* IN EMP                       */

          @69 SPECFLAG $1. ;    /* SIGNALS WHETHER THERE ARE   */
                                /* SPECIAL INSTRUCTIONS        */
     FORMAT DATEORD DATE9. SHIPPED DATE9.;
     DATALINES;
112699870 690         .   1987607803OCT98         .   212916      .
1127012791750  2256870.00 3904521303OCT98   19OCT98   321783 237642 X
112718934 110 11063836.00 1854348903OCT98   13OCT98   456910 456921
1127234781000         .   2983424803OCT98         .   234967      .
112732567 450   252148.50 1978348204OCT98   14NOV98   119012 216382
1127447891000         .   1543214704OCT98         .   212916      .
1127534781000         .   2983424804OCT98         .   234967      .
1127612791500  1934460.00 1432474204OCT98   21OCT98   321783 120591 X
112778934 100 10058033.00 3154890105OCT98         .   456910      .
1127825672500  1400825.00 1489802905OCT98   20OCT98   119012 456921
112799870 650         .   4834551405OCT98         .   212916      .
1128012791750  2256870.00 3904521306OCT98   21OCT98   321783 237642 X
112818934 110 11063836.00 1854348906OCT98   27OCT98   456910 216382
112822567 450   252148.50 1978348206OCT98   26OCT98   119012 456921
112839870 690         .   1854348907OCT98         .   212916      .
1128512791750  2256870.00 3876391907OCT98   02DEC98   321783 120591 X
112868934 110 11063836.00 4345974707OCT98   03NOV98   456910 237642
112872567 450   252148.50 1543214707OCT98   07NOV98   119012 216382
112909870 690         .   1432474210OCT98         .   212916      . Y
119699870 690         .   1987607825OCT98         .   212916      .
1205112791750  2256870.00 3904521331OCT98         .   321783      . X
121028934 110 11063836.00 1854348915NOV98         .   456910      .
1216034781000         .   2983424819NOV98         .   234967      . Z
122632567 450   252148.50 1978348201DEC98         .   119012      .
1246447891000         .   1543214723DEC98         .   212916      .
1246534781000         .   2983424823DEC98         .   234967      .
1246612791500  1934460.00 1432474223DEC98         .   321783      . X
124678934 100 10058033.00 3154890123DEC98         .   456910      .
1246825672500  1400825.00 1489802923DEC98   03JAN99   119012 120591
124709870 650         .   4834551423DEC98         .   212916      .
1247112791750  2256870.00 3904521323DEC98         .   321783      . X
124728934 110 11063836.00 1854348923DEC98   03JAN99   456910 237642
124732567 450   252148.50 1978348223DEC98         .   119012      .
124749870 690         .   1854348923DEC98         .   212916      .
1247612791750  2256870.00 3876391923DEC98   03JAN99   321783 456921 X
124778934 110 11063836.00 4345974723DEC98         .   456910      .
124782567 450   252148.50 1543214723DEC98   03JAN99   119012 216382
124799870 690         .   1432474223DEC98         .   212916      .
   ;

proc sql  outobs=15;
   title "SAMDAT12 Data (Partial)";
   select * from samples.samdat12;

  /*----------------------------------------------------------*/
  /*   The following code uses the data sets created above to */
  /*   create DBMS tables.                                    */
  /*----------------------------------------------------------*/

proc sql;

drop table MYDBLIB.SAMDAT1;
drop table MYDBLIB.SAMDAT2;
drop table MYDBLIB.SAMDAT3;
drop table MYDBLIB.SAMDAT4;
drop table MYDBLIB.SAMDAT5;
drop table MYDBLIB.SAMDAT6;
drop table MYDBLIB.SAMDAT7;
drop table MYDBLIB.SAMDAT8;
drop table MYDBLIB.SAMDAT9;
drop table MYDBLIB.SAMDAT10;
drop table MYDBLIB.SAMDAT11;
drop table MYDBLIB.SAMDAT12;
drop table MYDBLIB.SAMTEMP;

quit;

proc sql;

create table MYDBLIB.SAMDAT1 as
select * from samples.samdat1;

create table MYDBLIB.SAMDAT2 as
select * from samples.samdat2;

create table MYDBLIB.SAMDAT3 as
select * from samples.samdat3;

%if (&enginename EQ ASTER) %then %do; 
	create table MYDBLIB.SAMDAT4 (dbtype=idnum="int")
	as select * from samples.samdat4;
%end;
%else %do;
	create table MYDBLIB.SAMDAT4 as
	select * from samples.samdat4;
%end;

%if (&enginename EQ ASTER) %then %do;
	create table MYDBLIB.SAMDAT5 (dbtype=idnum="int")
	as select * from samples.samdat5;
%end;
%else %do;
	create table MYDBLIB.SAMDAT5 as
	select * from samples.samdat5;
%end

%if (&enginename EQ ASTER) %then %do; 
    create table MYDBLIB.SAMDAT6 (dbtype=idnum="int")
    as select * from samples.samdat6;
%end;
%else %do;
	create table MYDBLIB.SAMDAT6 as
	select * from samples.samdat6;
%end

%macro fillData7;
  %if (&enginename EQ MYSQL) %then %do;
	create table MYDBLIB.SAMDAT7 (dbtype=idnum="varchar(4) primary key")
	as select * from samples.samdat7;
  %end;
  %else %if (&enginename EQ ASTER) %then %do;
    create table MYDBLIB.SAMDAT7 (dbtype=idnum="int primary key")
	as select * from samples.samdat7;
  %end;
  %else %if (&enginename EQ VERTICA) %then %do;
    create table MYDBLIB.SAMDAT7(dbtype=(IDNUM="char(4),primary key(IDNUM)"))
	as select * from samples.samdat7;
  %end;
  %else %do;
    create table MYDBLIB.SAMDAT7 as
	select * from samples.samdat7;
  %end;
%mend;
%fillData7;

%if (&enginename EQ ASTER) %then %do; 
	create table MYDBLIB.SAMDAT8 (dbtype=supid="int")
	as select * from samples.samdat8;
%end;
%else %do;
    create table MYDBLIB.SAMDAT8 as
	select * from samples.samdat8;
%end;

%if (&enginename EQ HADOOP or &enginename EQ IMPALA) %then %do; 
	create table MYDBLIB.SAMDAT9 as
	select * from samples.samdat9;
%end;
%else %do;
    create table MYDBLIB.SAMDAT9(dbnull=(paidon=yes)) as
	select * from samples.samdat9;
%end;

%if (&enginename EQ HADOOP or &enginename EQ IMPALA) %then %do; 
	create table MYDBLIB.SAMDAT10 as
	select * from samples.samdat10;
%end;
%else %do;
    create table MYDBLIB.SAMDAT10(dbnull=(salary=yes gender=yes birthdte=yes)) as
	select * from samples.samdat10;
%end;

create table MYDBLIB.SAMDAT11 as
select * from samples.samdat11;

%if (&enginename EQ HADOOP or &enginename EQ IMPALA) %then %do; 
	create table MYDBLIB.SAMDAT12 as
	select * from samples.samdat12;
%end;
%else %do;
    create table MYDBLIB.SAMDAT12(dbnull=(fabcharg=yes shipped=yes procsby=yes
	specflag=yes)) as select * from samples.samdat12;
%end;

quit;

  /*--------------------------------------------------------*/
  /*   CREATE THE DATA SET SAMDAT13                         */
  /*--------------------------------------------------------*/

proc sql;

create table samples.samdat13 (label='Student interns',
    EMPID num, HIREDATE date format=date9., DEPT char(6), GENDER char(1),
    LASTNAME char(18), FIRSTNAM char(15), MIDDLENA char(15),
    FAMILYID num) ;

insert into samples.samdat13
   values(765111,'04MAY98'd,'CSR011','M','NISHIMATSU-LYNCH','RICHARD',
          'ITO',677890)
   values(765112,'04MAY98'd,'CSR010','M','SMITH','ROBERT','MICHAEL',234967)
   values(219776,'15APR98'd,'ACC024','F','PASTORELLI','ZORA',null,.)
   values(245233,'10APR98'd,'ACC013',' ','ALI','SADIQ','H.',.)
   values(245234,'10APR98'd,'ACC024','F','MEHAILESCU','NADIA','P.',.)
   values(326721,'01MAY98'd,'SHP002','M','CALHOUN','WILLIS','BEAUREGARD',.);

quit;
