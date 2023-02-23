# Purpose of this script is to generate different covariate for EDA plot

library(dplyr)

# Read the data
data = read.csv("Brown_cleaned.csv")

# Make a subdataset that only contains sub dataset of behaviors
data_behave <- subset(data, Behavior %in% c('Bite/Chew', 'Chase', 'Dig', 'Lick/Groom', 'Snuggle', 'Touching') )
data_behave <- data_behave %>% dplyr::filter(!(Subject==""))
data_behave <- data_behave %>% dplyr::filter(!(Modifier.1==""))
data_behave <- data_behave %>% dplyr::filter(!(Behavior==""))


# First, we can make a table of frequency of different subjects in different behaviors
table_1_behave <- data_behave %>%
  count(Subject ,Behavior)


# Second, we can do this process in the opposite direction to count the behaviors to each modifiers
table_2_behave <- data_behave %>%
  count(Modifier.1, Behavior)

# Since we want to make EDA plots, we need to make sub-data into behavior and quadrant


data_qua <- subset(data, Behavior %in% c('Q0', 'Q1', 'Q2', 'Q3') )

data_qua <- data_qua %>% dplyr::filter(!(Subject==""))
data_qua <- data_qua %>% dplyr::filter(!(Behavior==""))

# First, we can make a table of frequency of different subjects in different quadrant
table_1_qua <- data_qua %>%
  count(Subject, Behavior)

# Then, we can specify to the behaviors of each ferret
# First, let's start with Donor
#Modifier is other ferret
data_sub_donor <- subset(data_behave, Subject == 'Donor' & Modifier.1 %in% c('R1', 'R2', 'R3', 'R4'))

# How many times that donor has behaviors to other ferret
table_donor_behave <- data_sub_donor %>%
  count(Behavior,Modifier.1)


# Then, we can make a table that donor has been touched by other ferret

data_modi_donor <- subset(data_behave, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Donor')
# How many times that donor has been given behaviors by other ferret
table_donor_hehave_modi <- data_modi_donor %>%
  count(Subject, Behavior)


# Then, we can specify to the behaviors of each ferret
# First, let's start with Donor
#Modifier is objects in the experiment field
data_sub_donor_object <- subset(data_behave, Subject == 'Donor' & 
                                Modifier.1 %in% c('Ball', 'Cat Tower Toy', 'Cups', 'Keys', 'Pen Walls', 'Plush', 'Robot'))

# How many times that donor has interaction with other objects
table_donor_hehave_object <- data_sub_donor_object %>%ß
  count(Behavior, Modifier.1)


# We can also make a data set that after donor touched the object, how many times other ferret touches other objects

# Get the index of that first time touches other objects
t.first <- data_sub_donor_object[match(unique(data_sub_donor_object$Modifier.1), data_sub_donor_object$Modifier.1),]

# Then, we can make different sub-datasets regards to the modifier
# First, we start with Robot
data_first_robot <- data_behave[12:nrow(data_behave), ]

data_robot_only <- data_first_robot

# Then, we can make a table about how each ferret touches robot after donor touches the robot

table_modi_robot <- subset(data_robot_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Robot')

# Table about the frequency of interaction the robot after donor interacts with it.
table_robot <- table_modi_robot %>%
  count(Subject, Behavior)



# Get the index of that first time interact other objects
b.first <- data_sub_donor_object[match(unique(data_sub_donor_object$Behavior), data_sub_donor_object$Behavior),]
