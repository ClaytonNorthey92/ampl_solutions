reset;

model dist1.mod;

var leftover {f in FACT};

data dist1.dat;
solve;
display Ship, supply;

for {f in FACT} {
	let leftover[f] := supply[f] - sum {c in CUST} Ship[f,c];
}

display leftover;
display sum {f in FACT, c in CUST} cost[f,c];
