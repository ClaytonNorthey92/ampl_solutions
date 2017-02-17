reset;
model holes.mod;
data holes.dat;

option display_eps .000001;
option omit_zero_rows 1;

solve;
display X;