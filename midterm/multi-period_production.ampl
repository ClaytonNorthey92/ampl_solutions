reset;

model;
set MONTHS;
param storage_cost >= 0, <= Infinity;
param production_cost {MONTHS} >= 0;
param max_production {MONTHS} >= 0;
param needed {MONTHS} >= 0;
var Produce {MONTHS, MONTHS} >= 0;

data;
set MONTHS := 1 2 3 4;
param storage_cost default 0.015;
param production_cost := 1 1.08
						 2 1.11
						 3 1.10
						 4 1.13;
param max_production := 1 25
					  2 35
					  3 30
					  4 10;
param needed := 1 10
			  2 15
			  3 25
			  4 20;

minimize Total_Cost:
	sum {m in MONTHS, n in MONTHS} if (m>=n) then (Produce[m,n] * production_cost[m] + storage_cost * (m-n));

subject to Needed {m in MONTHS}:
	sum {n in MONTHS} Produce[n,m] >= needed[m];

subject to Max_Prod {m in MONTHS}:
	sum {n in MONTHS} Produce[m,n] <= max_production[m];

solve;
display Produce;