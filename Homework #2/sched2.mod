set DAYS ordered;
set PLANS ordered;

param need {DAYS} > 0;

param sched {DAYS,PLANS} binary;

var Work {PLANS} integer >= 0;

minimize Employees: sum {p in PLANS} Work[p];

subj to MeetNeed {d in DAYS}:
   sum {p in PLANS} sched[d,p] * Work[p] >= need[d]; 
