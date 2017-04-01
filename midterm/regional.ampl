reset;

model;
set KIB;
set CROPS;

param max_acres {KIB} >= 0;
param max_crops {CROPS} >= 0;
param profit {CROPS} >= 0;
param water_consumption {CROPS} >= 0;
param water_supply {KIB} >= 0;
param equity {KIB};
var Planted {k in KIB, c in CROPS} >= 0;

data;
set KIB := 1 2 3 ;
set CROPS := SB C S ;

param max_acres := 1 400
				   2 600
				   3 300;

param max_crops := SB 600
				   C  500
				   S  325;

param profit := SB 1000
				C  750
				S  250;

param equity := 1 2 2 3 3 1;

param water_consumption := SB 3 C 2 S 1;
param water_supply := 1 600 2 800 3 375;

maximize Total_Profit:
	sum {c in CROPS} profit[c] * sum {k in KIB} Planted[k,c];

subject to Water_Supply {k in KIB}:
	sum {c in CROPS} Planted[k,c] * water_consumption[c] <= water_supply[k];

subject to Equity {k in KIB}:
	sum {c in CROPS} Planted[k,c]/max_acres[k] = sum {c in CROPS} Planted[equity[k], c]/max_acres[k];

solve;
display Total_Profit, Planted;