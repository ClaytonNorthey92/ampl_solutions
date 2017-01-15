# part a

printf "PART A\n";

reset;
model steel4.mod; data steel4.dat;
solve;


# while our profit per ton of coil is not above 500,
# increase profit per ton of coil by a full dollar

repeat while Make["coils"] <= 500{
	let profit["coils"] := profit["coils"] + 1;
	solve;
}

display Make, profit["coils"];


# part b

printf "PART B \n";

reset;
model steel4.mod; data steel4.dat;
set coil_profits = 1 .. 10 by 1;

repeat while profit["coils"] <= 40 {
	solve;
	display Total_Profit, profit["coils"];
	let profit["coils"] := profit["coils"] + 1;
}