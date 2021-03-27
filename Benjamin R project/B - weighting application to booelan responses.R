#AIM:apply weightings to boolean

#initialise variables
library(readr)
uk <- read_csv("C:/Users/Benjamin/OneDrive/ASA Datafest/ASA DataFest 2021 Data/uk.csv")
data_weights = uk[134]
boolean_responses <- readRDS("boolean_adjusted_respnses.RDS")
weighted_responses =boolean_responses

for (i in 1:nrow(data_weights)){
  weighted_responses[i,] = boolean_responses[i,] * as.numeric(data_weights[i,1])
  cat(round((i*100 / 10006),1), "%\n", 1)
}