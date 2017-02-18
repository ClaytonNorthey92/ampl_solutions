reset;
model holes2.mod;
data holes2.dat;

option display_eps .000001;
option omit_zero_rows 1;

solve;
display X;