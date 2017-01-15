# set of media for the advertising campaign
# we use two different forms of television because they are priced differently
set MEDIA;

# attributes of each media
param min_needed {MEDIA} >= 0;
param max_wanted {MEDIA};
param cost {MEDIA} >= 0;
param female_customers {MEDIA} >=0;
param potential_customers {MEDIA} >=0;

# DECISION VARIABLES: advertising units, setting up upper and lower bounds
var Units_Purchased {m in MEDIA} >= min_needed[m], <= max_wanted[m];

# CONSTRAINT #1: cannot spend more than 800000 on advertising
subject to Spending: sum {m in MEDIA} cost[m] * Units_Purchased[m] <= 800000;

# CONSTRAINT #2: 2000000 exposures take place among women
subject to Women_Exposed: sum {m in MEDIA} female_customers[m] * Units_Purchased[m] >= 2000000;

# CONSTRAINT #3: Advertising on prime time television and day television combined
# cannot cost more than $500000
subject to TV_Cost: cost["day_television"] * Units_Purchased["day_television"] +
 	cost["prime_television"] * Units_Purchased["day_television"] <= 500000;


# OBJECTIVE: maximize potential customers reached
maximize Potential_Customers_Reached: sum {m in MEDIA} Units_Purchased[m] * potential_customers[m];