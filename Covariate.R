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
table_donor_hehave_object <- data_sub_donor_object %>%
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


# Second, we start with Keys
data_first_keys <- data_behave[15:nrow(data_behave), ]

data_keys_only <- data_first_keys

# Then, we can make a table about how each ferret touches keys after donor touches the keys

table_modi_keys <- subset(data_keys_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Keys')

# Table about the frequency of interaction the keys after donor interacts with it.
table_keys <- table_modi_keys %>%
  count(Subject, Behavior)


# Third, we start with Ball 
data_first_ball <- data_behave[17:nrow(data_behave), ]

data_ball_only <- data_first_ball

# Then, we can make a table about how each ferret touches ball after donor touches the ball

table_modi_ball <- subset(data_ball_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Ball')

# Table about the frequency of interaction the ball after donor interacts with it.
table_ball<- table_modi_ball %>%
  count(Subject, Behavior)

# Fourth, we start with Plush 
data_first_plush <- data_behave[21:nrow(data_behave), ]

data_plush_only <- data_first_plush

# Then, we can make a table about how each ferret touches plush after donor touches the plush

table_modi_plush <- subset(data_plush_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Plush')

# Table about the frequency of interaction the plush after donor interacts with it.
table_plush<- table_modi_plush %>%
  count(Subject, Behavior)

# Fifth, we start with Pen Walls
data_first_penwalls <- data_behave[47:nrow(data_behave), ]

data_penwalls_only <- data_first_penwalls

# Then, we can make a table about how each ferret touches penwalls after donor touches the penwalls

table_modi_penwalls <- subset(data_penwalls_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Pen Walls')

# Table about the frequency of interaction the Pen Walls after donor interacts with it.
table_penwalls<- table_modi_penwalls %>%
  count(Subject, Behavior)

# Sixth, we start with Cups
data_first_cups <- data_behave[86:nrow(data_behave), ]

data_cups_only <- data_first_cups

# Then, we can make a table about how each ferret touches cups after donor touches the cups

table_modi_cups <- subset(data_cups_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Cups')

# Table about the frequency of interaction the cups after donor interacts with it.
table_cups<- table_modi_cups %>%
  count(Subject, Behavior)

# Seventh, we start with Cat Tower Toy
data_first_cattowertoy <- data_behave[227:nrow(data_behave), ]

data_cattowertoy_only <- data_first_cattowertoy 

# Then, we can make a table about how each ferret touches cat tower toy  after donor touches the cat tower toy 

table_modi_cattowertoy<- subset(data_cattowertoy_only, Subject %in% c('R1', 'R2', 'R3', 'R4') & Modifier.1 == 'Cat Tower Toy')

# Table about the frequency of interaction the cat tower toy after donor interacts with it.
table_cattowertoy<- table_modi_cattowertoy %>%
  count(Subject, Behavior)

################################################################################################
#### Make a table about how long each ferret touches a modifier after donor first touches it ###
################################################################################################

# Make a list of modifiers in the order based on `t.first`
list.Modifiers = c("robot", "keys", "ball", "plush", "penwalls", "cups", "cattowertoy")

for (i in 1:7){
  # First, we get the name of the table whose name has the format: table_modi_Modifier (e.g. table_modi_robot)
  table = paste0('table_modi_',list.Modifiers[i])
  # Get the Subject column of the table 
  subject = get(table)$Subject
  
  # Next, we make a table about when each ferret, excluded the donor, first touches a modifier after donor touches it
  
  #Create the name for the new table
  new_table = paste0("table_modi_", list.Modifiers[i], "_first")  
  #Make the new table 
  assign(new_table, 
         get(table)[match(unique(subject), subject),])   
  #Add a column to the table which contains the time between 
  TimeBtw <- get(new_table)[, 3] - t.first$Start_Time[i]
  assign(new_table, cbind(get(new_table), TimeBtw))
}

# The for-loop above is essentially doing this for each modifier (tabke keys as example):
# Make a table about when each ferret, excluded the donor, first touches keys after donor touches the keys
# table_modi_keys_first <- table_modi_keys[match(unique(table_modi_keys$Subject), table_modi_keys$Subject),]

# Add a column to the table which contains the time between 
# table_modi_keys_first$TimeBtw <- table_modi_keys_first$End_Time - t.first$Start_Time[2]

###########################################################################################

# Besides, the object modifier, we can also do this for other ferrets

f.first <- data_sub_donor[match(unique(data_sub_donor$Modifier.1), data_sub_donor$Modifier.1),]


# First, we take R1
data_first_R1 <- data_behave[114:nrow(data_behave), ]

data_R1_only <- data_first_R1 

# Then, we can make a table about how each ferret touches R1  after donor touches the R1

table_modi_R1<- subset(data_R1_only, Subject %in% c('R2', 'R3', 'R4') & Modifier.1 == 'R1')

# Table about the frequency of interaction the cat tower toy after donor interacts with it.
table_R1 <- table_modi_R1 %>%
  count(Subject, Behavior)


# Second, we take R2
data_first_R2 <- data_behave[192:nrow(data_behave), ]

data_R2_only <- data_first_R2 

# Then, we can make a table about how each ferret touches R2 after donor touches the R1

table_modi_R2 <- subset(data_R2_only, Subject %in% c('R1', 'R3', 'R4') & Modifier.1 == 'R2')

# Table about the frequency of interaction the cat tower toy after donor interacts with it.
table_R2 <- table_modi_R2 %>%
  count(Subject, Behavior)

# Third, we take R3
data_first_R3 <- data_behave[247:nrow(data_behave), ]

data_R3_only <- data_first_R3

# Then, we can make a table about how each ferret touches R3 after donor touches the R3

table_modi_R3 <- subset(data_R3_only, Subject %in% c('R1', 'R2', 'R4') & Modifier.1 == 'R3')

# Table about the frequency of interaction the cat tower toy after donor interacts with it.
table_R3 <- table_modi_R3 %>%
  count(Subject, Behavior)


# Forth, we take R4
data_first_R4 <- data_behave[51:nrow(data_behave), ]

data_R4_only <- data_first_R4

# Then, we can make a table about how each ferret touches R4 after donor touches the R4

table_modi_R4 <- subset(data_R4_only, Subject %in% c('R1', 'R2', 'R3') & Modifier.1 == 'R4')

# Table about the frequency of interaction the cat tower toy after donor interacts with it.
table_R4 <- table_modi_R4 %>%
  count(Subject, Behavior)


# Since, we already know that R1 is the only ferret who gets infected
# We can start to build a table that only involves 


# Get the index of that first time interact other objects
# b.first <- data_sub_donor_object[match(unique(data_sub_donor_object$Behavior), data_sub_donor_object$Behavior),]


