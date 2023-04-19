# Flying-Ferrets
This script is writted in R.
The purpose of this script is to: 1. clean up the csv file 2. Generate more meaningful variables so that a model can be built on these new-created feature.
The intuition of this script is to design a auto-script such that user would only need to input the data source and run the script

# Assumption
1. The input file formatting should be the same format as what the files in the csv.file look like (The col names/ data type of each variables under each col)
2. The data should be accurated record, otherwise the script can not provide any meanfulingful insight
3. The input file has to be a csv file
4. Ferret 1 behaves to Ferret 2 is the same as Ferret 2 behaves to Ferret 1

# Run the Script

1. Download the Function.Rmd file on your local computer, it is the best the file is put in the same file as where the data source is stored
2. Open the file, and load the data source (simply put the path name of the file that need to be runned)
3. Run all the function in the script until the end, the file would produce bunch of objects, variables, and files, please take a look at summary_df1, summary_df2, and summary_df3
4. There should also be three new produced csv file under the same directory as where the script is located
5. Take a look at the output, and decide how to use it

# Functions:

split_joint_modifiers: split the multiple modifier situation, split into multiple rows, make sure the data can be successfully access by later fucntions
filter_function: Filter out all the situation that when donor behave_1 to some modifier and the first time after the donor interaction that one of the other ferrets behave_2 to the same modifier.
duration_function: Calculate the duration that how long it is between the end_time of donor interaction and next start_time of other ferret interaction, if it is overlapping, record it as 0
organize_result: Create b, d, and e variable in the dataframe
compute_score: Apply the weighted functiuon to b, d, and e and sum them up to get a score
auto_process: Combine all the functions above so that the final dataframe would have every combination all the modifier, behavior, and other ferret

'There should be three auto-process' function, one of them score is the sum of all the score, and one of them is the max score, and one of them is the frequency of each behavior'


# Modifier the script

Modifier the script is not highly encouraged since it is a auto-script, but if user want to change weighted function, please change it in compute_score function since right now we have a naive function
