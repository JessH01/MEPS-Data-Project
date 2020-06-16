/*Original files loaded into permanent data sets*/                                                                         
LIBNAME MIS500 '/folders/myfolders/MIS500';                                                             
     FILENAME RX2010 '/folders/myfolders/MIS500/RX2010.ssp';
     FILENAME RX2011 '/folders/myfolders/MIS500/RX2011.ssp';
     FILENAME RX2012 '/folders/myfolders/MIS500/RX2012.ssp';
     FILENAME RX2013 '/folders/myfolders/MIS500/RX2013.ssp';
     FILENAME RX2014 '/folders/myfolders/MIS500/RX2014.ssp';
     FILENAME RX2015 '/folders/myfolders/MIS500/RX2015.ssp';
     FILENAME RX2016 '/folders/myfolders/MIS500/RX2016.ssp';
                                                                                                    
     PROC XCOPY IN=RX2010 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2011 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2012 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2013 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2014 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2015 OUT=MIS500 IMPORT;
     PROC XCOPY IN=RX2016 OUT=MIS500 IMPORT;
     RUN;                                                                                           
