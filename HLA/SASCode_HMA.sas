%macro AddWMA(WMA_N=4, INPUT=close, OUT=&INPUT._WMA_&WMA_N., OUTLABEL=&INPUT. WMA(&WMA_N.));
  retain _sumx_&INPUT._WMA_&WMA_N.;
  _sumx_&INPUT._WMA_&WMA_N.=sum (_sumx_&INPUT._WMA_&WMA_N., &INPUT., -lag&WMA_N.( &INPUT. )) ;
 
  retain _sum_&INPUT._WMA_&WMA_N.;
  _sum_&INPUT._WMA_&WMA_N.=sum (_sum_&INPUT._WMA_&WMA_N., &WMA_N * &INPUT., -lag( _sumx_&INPUT._WMA_&WMA_N.  )) ;
 
  retain _sumw_&INPUT._WMA_&WMA_N.;
  if _N_ <= &WMA_N then _sumw_&INPUT._WMA_&WMA_N. = sum (_sumw_&INPUT._WMA_&WMA_N., &WMA_N, -_N_, 1);
 
  &OUT=_sum_&INPUT._WMA_&WMA_N. / _sumw_&INPUT._WMA_&WMA_N.;
 
  drop _sumx_&INPUT._WMA_&WMA_N. _sumw_&INPUT._WMA_&WMA_N. _sum_&INPUT._WMA_&WMA_N.;
  label &OUT="&OUTLABEL"; 
%mend;
%macro AddHMA(HMA_N=5, INPUT=close, OUT=&INPUT._HMA_&HMA_N., outlabel=&INPUT. HMA(&HMA_N.));
  %AddWMA(WMA_N=&HMA_N, INPUT=&INPUT.);
 
  %AddWMA(WMA_N=%sysfunc(round(&HMA_N./2)), INPUT=&INPUT.);
 
  &INPUT._HMA_&HMA_N._DELTA=2 * &INPUT._WMA_%sysfunc(round(&HMA_N./2))  - &INPUT._WMA_&HMA_N;
  %AddWMA(WMA_N=%sysfunc(round(%sysfunc(sqrt(&HMA_N)))), INPUT=&INPUT._HMA_&HMA_N._DELTA);
 
  rename &INPUT._HMA_&HMA_N._DELTA_WMA_%sysfunc(round(%sysfunc(sqrt(&HMA_N.))))=&OUT;
  label &INPUT._HMA_&HMA_N._DELTA_WMA_%sysfunc(round(%sysfunc(sqrt(&HMA_N.))))="&outlabel"; 
 
  drop &INPUT._WMA_&HMA_N &INPUT._WMA_%sysfunc(round(&HMA_N./2)) &INPUT._HMA_&HMA_N._DELTA;
%mend;
data Stocks_HMA;
  set sashelp.Stocks(where=(stock='IBM'));
  %AddHMA( HMA_N=5, out=HMA, outlabel=%str(HMA))
  %AddMA(MA_N=5, out=SMA, outlabel=%str(SMA));
run; 
ods graphics / width=800px height=300px;
title "Comparison of Simple and Hull Moving Average";
proc sgplot data=Stocks_HMA noautolegend;
   highlow x=Date high=High low=Low / lineattrs=(color=LightGray);
   scatter x=Date y=Close / markerattrs=(color=LightGray);
   series x=Date y=SMA / curvelabel curvelabelattrs=(color=DarkGreen) lineattrs=(color=DarkGreen);
   series x=Date y=HMA / curvelabel curvelabelattrs=(color=DarkOrange) lineattrs=(color=DarkOrange);
   refline '01JUN1992'd / axis=x label='June 1992' labelloc=inside;
   xaxis grid display=(nolabel); 
   yaxis grid max=200 label="IBM Closing Price";
run;

