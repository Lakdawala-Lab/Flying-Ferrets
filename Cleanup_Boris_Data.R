# Import libraries
library(dplyr)

# Accepting user input

#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

#print(args)

# Open the .csv file (Betsur)
# must specify the # of rows to skip in the data file

data.file = args[1]#"../omkar/omkar.csv"

print(data.file)

rows_to_skip = args[2]

print(rows_to_skip)

data.file = "../omkar/omkar.csv"

rows_to_skip = 21

data = read.csv(data.file, header = T, skip = rows_to_skip)

# For computation of duration, convert the datatype of `Time` from chr to numeric 
data <- data %>% mutate(Time = as.numeric(Time)) 

# Find and store rows with missing values for `Modifier 1`
data.problems <- data %>% filter(`Modifier 1` == "")

##################
# Clean the data #
##################

# Clean the data  
data.cleaned <- data %>%
  # Organize the data by columns that can uniquely identify a ferret's behavior 
  arrange(Subject, Behavior, Behavioral.category, Modifier.1) %>% 
  # Add row numbers (to assist following computation)
  mutate(row_id=row_number()) %>% 
  # Group by every 2 rows (START, STOP)
  group_by(grp = as.integer(gl(n(), 2 , n()))) %>%
  # Take the difference in Time of every two rows to compute duration
  mutate(Duration = round(diff(Time), 3),
         Comment = paste(Comment)) %>% 
  # This also takes the difference in Time but drops columns 
  # summarize(Duration = diff(Time)) %>% 
  # Only keep the rows with Status = START (remove redundant rows)
  filter(Status == "START") %>%
  # Add Start Time and End Times
  mutate(Start_Time = Time,
         End_Time = Time + Duration) %>%
  # Remove Column that tracks Groups
  subset(select = -c(grp)) %>%
  # Select only relevant remaining columns
  subset(select = c("Start_Time", "End_Time", "Duration", "Subject", "Behavior", "Behavioral.category", "Modifier.1", "Comment")) %>%
  # Order by Start_Time so that rows are ordered by the start of the event
  arrange(Start_Time)


##########################################
# Test the code on Subject = Donors only #
##########################################
# 1. Filter out Subjects
data.donor <- data %>% filter(Subject == "Donor")

# 2. Clean the data  
data.donor.cleaned <- data.donor %>%
  # Organize the data by columns that can identify a unique behavior 
  arrange(Behavior, `Behavioral category`, `Modifier 1`) %>% 
  # Add a row numbers
  mutate(row_id=row_number()) %>% 
  # Group by every 2 rows (START, STOP)
  group_by(grp = as.integer(gl(n(), 2 , n()))) %>%
  # Take the difference in Time of every two rows to compute duration
  mutate(Duration = diff(Time)) %>%
  # Only keep the rows with Status = START (remove redundant rows)
  filter(Status == "START")



