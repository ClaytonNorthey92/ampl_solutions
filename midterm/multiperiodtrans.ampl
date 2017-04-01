reset;

# ============================

model;

set ORIG;
set DEST;
set TIME;
param T >= 0;
param cost {ORIG, DEST} >=0;
param supply {ORIG};
param demand {DEST};
var Ship {ORIG, DEST} >= 0;
var Inv {ORIG} >= 0;
# ============================

data;
set ORIG := Seattle SanDiego;
set DEST := NewYork Chicago Topeka;
param T = 10;
set TIME := 1..T;
param cost: NewYork Chicago Topeka :=
	Seattle 2250   1530   1620
	SanDiego 2250  1620   1260 ;
param supply := Seattle 600 SanDiego 350;
param demand := NewYork 325 Chicago 300 Topeka 275;

# ===========================

minimize Total_Cost:
	sum {o in ORIG, d in DEST} Ship[o,d] * cost[o,d];

subject to Demand {d in DEST}:
	sum {o in ORIG} Ship[o,d] >= demand[d];

subject to Supply {o in ORIG}:
	sum {d in DEST} Ship[o,d] = supply[o];

# ===========================

solve;
display Total_Cost, Ship;