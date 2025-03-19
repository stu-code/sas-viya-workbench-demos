libname PHASUG "/mnt/viya-share/data/pharmasug_search/data";

data WORK.PHASUG_ABSTRACTS (drop=abstract_dump re title) ;
   length title abstract authors varchar(*) paper_number $6. paper_title_extracted $186.;
set phasug.pharmasug_abstract_dump (where = (index(abstract_dump,"0A0A0A"x) > 0));
if _N_=1 then do;
   retain re;
   re=prxparse('/^[A-Z]{2}-\d{3}/');
end;
if prxmatch(re,abstract_dump);
title = scan(abstract_dump,1,"0A"x, "MO");
abstract = transtrn(substr(abstract_dump,index(abstract_dump,"0A0A0A"x), length(abstract_dump)-index(abstract_dump,"0A0A0A"x)+1),"0A0A0A"x,'');
authors = trim(substr(abstract_dump,index(abstract_dump,"0A"x),index(abstract_dump,"0A0A0A"x)-index(abstract_dump,"0A"x)+1));
paper_number = scan(title,1,":","MO");
paper_title_extracted = scan(title,2,":","MO");
run;


proc sort data=PHASUG.pharmasug_papers;
by paper_number;
run;
proc sort data=WORK.PHASUG_ABSTRACTS;
by paper_number;
run;

data PHASUG.PHARMASUG_PAPER_ABSTRACTS (drop=prefix);
length Section $100.;
merge PHASUG.PHARMASUG_PAPERS (in=a) WORK.PHASUG_ABSTRACTS (in=b);
by paper_number;
if a and b;
prefix = scan(paper_number,1,"-","MO");
if prefix = "AP" then Section = "Advanced Programming"; 
else if prefix = "AI" then Section = "Artificial Intelligence and Machine Learning"; 
else if prefix = "DS" then Section = "Data Standards"; 
else if prefix = "DV" then Section = "Data Visualization and Reporting"; 
else if prefix = "HT" then Section = "Hands-on Training"; 
else if prefix = "LS" then Section = "Leadership Skills"; 
else if prefix = "MM" then Section = "Metadata Management"; 
else if prefix = "OS" then Section = "R, Python, and Open Source Technologies"; 
else if prefix = "RW" then Section = "Real World Evidence and Big Data"; 
else if prefix = "SD" then Section = "Solution Development"; 
else if prefix = "ST" then Section = "Statistics and Analytics"; 
else if prefix = "SI" then Section = "Strategic Implementation & Innovation"; 
else if prefix = "SS" then Section = "Submission Standards"; 
else if prefix = "PO" then Section = "ePosters"; 
else Section = "New Section"; 

run;