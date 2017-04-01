reset;

model mcdietwt.mod;
param max_iterations;
param iteration;

data mcdietwt2.dat;
let max_iterations := 3;
let iteration := 1;

let wt := 0;
solve;
display Total_Cost, Total_Cals;

let wt := 1;
solve;
display Total_Cost, Total_Cals;

# Part C
# generate 3 random numbers between 0 and 1 and use them for wt
repeat while iteration <= max_iterations {
	let wt := Uniform(0.25, 0.75);
	solve;
	display wt, Total_Cost, Total_Cals;
	let iteration := iteration + 1;
}
