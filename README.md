# getting-and-cleaning-data-project
Project assignment for Coursera course Getting and Cleaning Data. Heli Pykälä 14.4.2016

## Files in Repository

Filename | Description
-------- | -----------
.gitignore | Git ignore file
CodeBook.md | Code book containing information about the dataset
getting-and-cleaning-data-project.Rproj | Project file to load the code to R Studio
run_analysis.R | R script containing the analysis
README.md | This file
tidydata.txt | The resulting data set


## run_analysis.R

The R script run_analysis.R does the following:

1. Downloads and unzips the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip if it doesn't already exist in the working dir
2. Loads the datafiles and merges them into a one data table
3. Renames the columns and activity types
4. Calculates the means by subject and activity types
5. Writes the result to the disk. The resulting filename is tidydata.txt, but it can be changed by changing the variable result_name in the script.
