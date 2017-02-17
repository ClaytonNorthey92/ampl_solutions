
set NUTR;   # nutrients
set FOOD;   # foods

param amt {NUTR,FOOD} >= 0;   # amount of nutrient in each food
param nutrLow {NUTR} >= 0;    # lower bound on nutrients in diet
param cost {FOOD} >= 0;       # cost of foods

var Buy {FOOD} >= 0 integer;  # amounts of foods to be purchased

param wt >= 0, <= 1;

var Total_Cost = sum {j in FOOD} cost[j] * Buy[j];
var Total_Cals = sum {j in FOOD} amt["Cals",j] * Buy[j];

minimize Tradeoff: 1000*wt * Total_Cost + (1-wt) * Total_Cals;

subject to Need {i in NUTR}:
   sum {j in FOOD} amt[i,j] * Buy[j] >= nutrLow[i];
