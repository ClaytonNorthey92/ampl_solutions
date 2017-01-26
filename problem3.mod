# model

# set of media for the advertising campaign
# we use two different forms of television because they are priced differently
set MEDIA;

# attributes of each media
param min_needed {MEDIA} >= 0;
param max_wanted {MEDIA};
param cost {MEDIA} >= 0;
param female_customers {MEDIA} >=0;
param potential_customers {MEDIA} >=0;
param is_tv {MEDIA};

param budget;
param min_women_exposed;
param tv_budget;

# DECISION VARIABLES: advertising units, setting up upper and lower bounds
var Units_Purchased {m in MEDIA} >= min_needed[m], <= max_wanted[m];

# CONSTRAINT #1: cannot spend more than 800000 on advertising
subject to Spending: sum {m in MEDIA} cost[m] * Units_Purchased[m] <= budget;

# CONSTRAINT #2: 2000000 exposures take place among women
subject to Women_Exposed: sum {m in MEDIA} female_customers[m] * Units_Purchased[m] >= min_women_exposed;

# CONSTRAINT #3: total TV advertising cost cannot be greater than $500000
subject to TV_Cost: sum {m in MEDIA} cost[m] * Units_Purchased[m] * is_tv[m] <= tv_budget;

# OBJECTIVE: maximize potential customers reached
maximize Potential_Customers_Reached: sum {m in MEDIA} Units_Purchased[m] * potential_customers[m];
