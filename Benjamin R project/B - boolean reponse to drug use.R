library(readr)
uk <- read_csv("C:/Users/Benjamin/OneDrive/ASA Datafest/ASA DataFest 2021 Data/uk.csv")
unweighted_data = uk[60:79]
weighted_data = unweighted_data
data_weights = uk[134]

# adjust Responses to boolean
for (i in 1:length(unweighted_data)){ #for each of the relevant columns
  for (j in 1:nrow(unweighted_data[i])){ # and for each value in that column
    if(unweighted_data[j, i] == 1){weighted_data[j, i]=0}
    else{weighted_data[j, i] = 1}
    
    cat(round((i*10006 + j)/(20*10006)*100, 2), "%\n")
    }
  }

print("done")