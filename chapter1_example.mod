# the following line is for my personal system only, this is the directory to include
# my solver, please COMMENT OUT OR REMOVE if running on different system
option solver "/Users/claytonnorthey/Downloads/amplide.macosx64/minos";


var XB;
var XC;
maximize Profit: 25 * XB + 30 * XC;
subject to Time: (1/200) * XB + (1/140) * XC <= 40;
subject to B_limit: 0 <= XB <= 6000;
subject to C_limit: 0 <= XC <= 4000;