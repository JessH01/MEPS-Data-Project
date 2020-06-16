proc reg data=MIS500.allyears;
	model ALLCOSTS=YEAR_INT;
run;
