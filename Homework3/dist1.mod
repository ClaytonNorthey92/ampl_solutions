set FACT;
set CUST;

param supply {FACT} >= 0;
param demand {CUST} >= 0;
param limit {FACT, CUST} >= 0;
check: sum {f in FACT} supply[f] >= sum {c in CUST} demand[c];
param cost {FACT, CUST} >= 0;
var Ship {FACT, CUST} >= 0;

minimize TotalCost:
	sum {f in FACT, c in CUST} cost[f,c] * Ship[f,c];

subject to Supply {f in FACT}:
	sum {c in CUST} Ship[f,c] <= supply[f];

subject to Demand {c in CUST}:
	sum {f in FACT} Ship[f,c] = demand[c];

subject to Capacity {c in CUST, f in FACT}: 
	Ship[f,c] <= limit[f,c];
