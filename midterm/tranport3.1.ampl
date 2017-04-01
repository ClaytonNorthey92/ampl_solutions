reset;

model;

set ORIG;
set DEST;
param cost {ORIG, DEST} >=0;
param supply {ORIG};
param demand {DEST};
var Ship {ORIG, DEST} >=0;
var M >=0;
param total_cost;

data;
set ORIG := Seattle SanDiego;
set DEST := NewYork Chicago Topeka;
param cost: NewYork Chicago Topeka :=
	Seattle 2250   1530   1620
	SanDiego 2250  1620   1260 ;
param supply := Seattle 600 SanDiego 350;
param demand := NewYork 325 Chicago 350 Topeka 275;

minimize Max_Cost: M;

subject to M_def {o in ORIG}:
	M >= sum {d in DEST} Ship[o,d] * cost[o,d];

subject to Demand {d in DEST}:
	sum {o in ORIG} Ship[o,d] = demand[d];

subject to Supply {o in ORIG}:
	sum {d in DEST} Ship[o,d] = supply[o];


solve;
let total_cost := sum {o in ORIG, d in DEST} cost[o,d]*Ship[o,d];
display Ship, total_cost, cost;