reset;

model dist2.mod;
var leftover {FACT, PROD};
data dist2.dat;
solve;

display Ship;

for {f in FACT, p in PROD} {
	let leftover[f,p] := supply[f,p] - sum {c in CUST} Ship[f,c,p];
}

display leftover;
display sum {f in FACT, c in CUST, p in PROD} cost[f,c,p];