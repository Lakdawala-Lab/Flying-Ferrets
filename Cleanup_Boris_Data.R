# Import libraries
library(dplyr)

# Open the .csv file (Betsur)
data = read.csv("Betsur.Exposure1.Take2.csv")

# Remove the title rows (first 20 rows)
data = data[-c(1:20), ]

# Set the first row of data to be the header/column names of the dataframe
column.names = data[1,]
names(data) = column.names
data = data[-1, ]  # Remove the first row which contains the column names 

# For computation of duration, convert the datatype of `Time` from chr to numeric 
data <- data %>% mutate(Time = as.numeric(Time)) 

##################
# Clean the data #
##################

# Clean the data  
data.cleaned <- data %>%
  # Organize the data by columns that can uniquely identify a ferret's behavior 
  arrange(Subject, Behavior, `Behavioral category`, `Modifier 1`) %>% 
  # Add row numbers (to assist following computation)
  mutate(row_id=row_number()) %>% 
  # Group by every 2 rows (START, STOP)
  group_by(grp = as.integer(gl(n(), 2 , n()))) %>%
  # Take the difference in Time of every two rows to compute duration
  mutate(Duration = diff(Time)) %>% 
  # This also takes the difference in Time but drops columns 
  # summarize(Duration = diff(Time)) %>% 
  # Only keep the rows with Status = START (remove redundant rows)
  filter(Status == "START")


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



