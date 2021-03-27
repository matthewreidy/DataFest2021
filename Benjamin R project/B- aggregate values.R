# create a table compatabile with the Mathew's Code and then apply  said code

#initialise Variables
library(readr)
uk <- read_csv("C:/Users/Benjamin/OneDrive/ASA Datafest/ASA DataFest 2021 Data/uk.csv")
weighted_responses <- readRDS("boolean_adjusted_weighted_respponses.RDS")


all_UK = weighted_responses
all_UK[c(21, 22)] = uk[c(133, 8)] 
#adds the demographics of ages and location added back 
all_UK = all_UK[, c(22, 21, 1:20)]


# set out the occurences of each nationality type and  sort the table
all_UK[order(all_UK$DEM_LOCATION),] # sort the table 
nationaity_delim = as.data.frame(table(all_UK[1]))


#separate Values
scot_respos = all_UK[1:nationaity_delim[1,2], 2:22]
restUK_respos = all_UK[nationaity_delim[1,2]+1:nrow(all_UK), 2:22]

 
scot_by_age <- with(scot_respos, 
                    aggregate(list(scot_respos[,1:20]), 
                              list(scot_respos = tolower(scot_respos$DEM_AGE10)), 
                              sum))

restUK_by_age <- with(restUK_respos, 
                     aggregate(list(restUK_respos[,1:20]), 
                               list(restUK_respos = tolower(restUK_respos$DEM_AGE10)), 
                               sum))

View(scot_by_age)
View(restUK_by_age)
