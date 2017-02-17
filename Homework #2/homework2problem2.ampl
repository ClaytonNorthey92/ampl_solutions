reset;

model sched1.mod;
data sched1.dat;

solve;
display Work;
display need, MeetNeed.body;

display ceil(sum {d in DAYS} need[d] / 5);
display sum {p in PLANS} Work[p];