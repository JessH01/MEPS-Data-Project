/*Load the pertinent data from the original files*/
data MIS500.ALLYEARS;
   set MIS500.RX2006 (KEEP= DUPERSID RXNAME TC1 RXXP06X) MIS500.RX2007 (KEEP= DUPERSID RXNAME TC1 RXXP07X)
       MIS500.RX2008 (KEEP= DUPERSID RXNAME TC1 RXXP08X) MIS500.RX2009 (KEEP= DUPERSID RXNAME TC1 RXXP09X)
       MIS500.RX2010 (KEEP= DUPERSID RXNAME TC1 RXXP10X) MIS500.RX2011 (KEEP= DUPERSID RXNAME TC1 RXXP11X)
       MIS500.RX2012 (KEEP= DUPERSID RXNAME TC1 RXXP12X) MIS500.RX2013 (KEEP= DUPERSID RXNAME TC1 RXXP13X)
       MIS500.RX2014 (KEEP= DUPERSID RXNAME TC1 RXXP14X) MIS500.RX2015 (KEEP= DUPERSID RXNAME TC1 RXXP15X)
       MIS500.RX2016 (KEEP= DUPERSID RXNAME TC1 RXXP16X);
/*Each year's costs are named something different, which means they will each have missing data for all other
year's columns.  This will change ALL missing observations to zero*/
    array change _numeric_;
        do over change;
            if change=. then change=0;
        end;
/*Create a new column containing all cost data.*/
    ALLCOSTS = RXXP06X+RXXP07X+RXXP08X+RXXP09X+RXXP10X+RXXP11X+RXXP12X+RXXP13X+RXXP14X+RXXP15X+RXXP16X; 
    COUNTER = 1;
/*This series of if statements will create a new column YEAR with the year the data was taken from.*/
    if RXXP06X>0 then YEAR='2006';
    else if RXXP07X>0 then YEAR='2007';
    else if RXXP08X>0 then YEAR='2008';
    else if RXXP09X>0 then YEAR='2009';
    else if RXXP10X>0 then YEAR='2010';
    else if RXXP11X>0 then YEAR='2011';
    else if RXXP12X>0 then YEAR='2012';
    else if RXXP13X>0 then YEAR='2013';
    else if RXXP14X>0 then YEAR='2014';
    else if RXXP15X>0 then YEAR='2015';
    else if RXXP16X>0 then YEAR='2016';
/*This series of statements will create a new column DRUGCLASS which gives details to the TC coding supplied.*/
	if TC1=1 then DRUGCLASS="Antiinfectives";
	else if TC1=20 then DRUGCLASS="Antineoplastics";
	else if TC1=28 then DRUGCLASS="Biological";
	else if TC1=40 then DRUGCLASS="Cardiovascular";
	else if TC1=57 then DRUGCLASS="Central Nervous System";
	else if TC1=60 then DRUGCLASS="Narcotic Analgesics";
	else if TC1=81 then DRUGCLASS="Coagulation Modifiers";
	else if TC1=87 then DRUGCLASS="Gastrointestinal";
	else if TC1=97 then DRUGCLASS="Hormones";
	else if TC1=105 then DRUGCLASS="Miscellaneous";
	else if TC1=113 then DRUGCLASS="Genitourinary Tract";
	else if TC1=115 then DRUGCLASS="Nutritional Products";
	else if TC1=122 then DRUGCLASS="Respiratory";
	else if TC1=133 then DRUGCLASS="Topical Agents";
	else if TC1=153 then DRUGCLASS="Plasma Expanders";
	else if TC1=218 then DRUGCLASS="Alternative Medications";
	else if TC1=242 then DRUGCLASS="Psychotherapeutic";
	else if TC1=254 then DRUGCLASS="Immunologic";
	else if TC1=331 then DRUGCLASS="Radiologic";
	else if TC1=358 then DRUGCLASS="Metabolic";
	else if TC1=365 then DRUGCLASS="Medical Gas";
	else if TC1=899 then DRUGCLASS="Pharmaceutical Aids";
	else if TC1<0 then DRUGCLASS="Not Ascertained";
	else DRUGCLASS="Not CLASSIFIED";
	
	YEAR_INT = input(YEAR, 4.);
run;


