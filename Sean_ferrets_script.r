

# must specify rows to skip

rows_to_skip = 21

ferrets = read.csv("omkar/omkar.csv", header = T, skip = rows_to_skip)

head(ferrets,1)

#ferrets2 = tail(ferrets, nrow(ferrets) - 20)

#head(ferrets2,1)

ferrets$subject.behavior.modifier = paste(ferrets$Subject, 
                                          ferrets$Behavior, 
                                          ferrets$Modifier.1,
                                          sep = "_")


#ferrets$subject.behavior.modifier

#columns = c("Subject", "Behavior", "Behavioral category", 
#            "Modifier", "Comment", "Start_Time", 
#            "End_Time", "Duration")

#output = data.frame(matrix(nrow = 0, ncol = length(columns)))

#colnames(output) = columns

output <- data.frame(Subject = character(),
                     Behavior = character(),
                     Behavioral_category = character(),
                     Modifier = character(),
                     Comment = character(),
                     Start_Time = numeric(),
                     End_Time = numeric(),
                     Duration = numeric())

output

library(tidyverse)


for(i in unique(ferrets$subject.behavior.modifier)) {
  
  tmp <- ferrets[ferrets$subject.behavior.modifier == i,]
  
  for(i in seq(0, nrow(tmp), by = 2)) {
    #print(ferrets[i,])
    print(tmp[i+1,])
    output <- output %>% 
      add_row(Subject = tmp[i, "Subject"],
              Behavior = tmp[i, "Behavior"],
              Behavioral_category = tmp[i, "Behavioral.category"],
              Modifier = tmp[i, "Modifier.1"],
              Comment = paste(tmp[i, "Comment"], 
                              tmp[i + 1, "Comment"],
                              sep = " "),
              Start_Time = tmp[i, "Time"],
              End_Time = tmp[i + 1, "Time"],
              Duration = tmp[i + 1, "Time"] - tmp[i, "Time"]
              )
  }
}


nrow(output)
