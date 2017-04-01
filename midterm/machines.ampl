reset;

model;
set MACHINES;
set PARTS;
param required {PARTS} >= 0;
param capacity {MACHINES} >= 0;
param cost {MACHINES, PARTS} >= 0;
var Make {MACHINES, PARTS} >= 0;

data;
set MACHINES := 1 2 3;
set PARTS := 1 2 3 4 5 6;
param required := 1 10
				  2 40
				  3 60
				  4 20
				  5 20
				  6 30 ;

param capacity := 1 80
				  2 50
				  3 160 ;
param cost: 1 2 3 4 5 6 :=
1 			3 3 2 5 2 1
2			4 1 1 2 2 1
3			2 2 5 1 1 2 ;

minimize Total_Cost:
	sum {m in MACHINES, p in PARTS} cost[m,p] * Make[m,p];

subject to Supply {m in MACHINES}:
	sum {p in PARTS} Make[m,p] = capacity[m];

subject to Demand {p in PARTS}:
	sum {m in MACHINES} Make[m,p] >= required[p];

solve;
display Make;
