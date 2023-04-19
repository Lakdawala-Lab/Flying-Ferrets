# Flying-Ferrets
This script is writted in R.
The purpose of this script is to: 1. clean up the csv file 2. Generate more meaningful variables so that a model can be built on these new-created feature.
The intuition of this script is to design a auto-script such that user would only need to input the data source and run the script

# Assumption
1. The input file formatting should be the same format as what the files in the csv.file look like (The col names/ data type of each variables under each col)
2. The data should be accurated record, otherwise the script can not provide any meanfulingful insight
3. The input file has to be a csv file

# Run the Script

1. Download the Function.Rmd file on your local computer, it is the best the file is put in the same file as where the data source is stored
2. Open the file, and load the data source (simply put the path name of the file that need to be runned)
3. Run all the function in the script until the end, the file would produce bunch of objects, variables, and files, please take a look at summary_df1, summary_df2, and summary_df3
4. There should also be three new produced csv file under the same directory as where the script is located
5. Take a look at the output, and decide how to use it

# Functions:

