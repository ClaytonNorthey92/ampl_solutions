set FACT;
set CUST;
set PROD;

param supply {FACT, PROD} >= 0;
param demand {CUST, PROD} >= 0;
param limit {FACT, CUST} >= 0;
param cost {FACT, CUST, PROD} >= 0;

check {p in PROD}:
  	sum {f in FACT} supply[f,p] >= sum {c in CUST} demand[c,p];

var Ship {FACT, CUST, PROD} >= 0;

minimize Total_Cost:
	sum {f in FACT, c in CUST, p in PROD} Ship[f,c,p] * cost[f,c,p];

subject to Supply {f in FACT, p in PROD}:
	supply[f,p] >= sum {c in CUST} Ship[f,c,p];

subject to Demand {c in CUST, p in PROD}:
	demand[c,p] = sum {f in FACT} Ship[f,c,p];

subject to Capacity {f in FACT, c in CUST}:
	sum {p in PROD} Ship[f,c,p] <= limit[f,c];
