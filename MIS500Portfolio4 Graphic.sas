/*Create Line Chart with data on # of Rx by year*/

ods graphics / reset width=6.4in height=4.8in MAXOBS=3600000 imagemap;

proc sgplot data=MIS500.ALLYEARS;
	title height=14pt "Prescriptions Issued by Year";
	vline YEAR / lineattrs=(thickness=2 color=CX003899);
	xaxis display=(nolabel);
	yaxis min=250000 grid label="Count of Rx Issued";
run;

ods graphics / reset;
title;