DATA score1;
	INFILE "/folders/myshortcuts/SAS/score1.txt";
	INPUT gender $ kor eng math sci;
DATA score2;
	INFILE "/folders/myshortcuts/SAS/score2.txt";
	INPUT gender $ kor eng math sci;
	
DATA score;
	SET score1 score2;
	total = 2*kor+2*eng+math+2*sci;
	IF total >= 400 THEN note = "GREAT";
	IF 400 > total >= 300 THEN note = "GOOD";
	IF 300 > total >= 200 THEN note = "BAD";
	IF total < 200 THEN note = "FAIL";
	DROP kor eng math sci;
	
DATA pass;
	INFILE "/folders/myshortcuts/SAS/pass.txt";
	INPUT gender $ pass $ ;
	IF pass = "합격" THEN pass = "T";
	ELSE pass = "F";
DATA SCORE;
	MERGE score pass;
PROC PRINT DATA=score;
	RUN;
