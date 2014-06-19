Getting and Cleaning Data Project
==========================================


Download the source and unzip its datasets to the default 'UCI HAR Dataset' sub-directory.
( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

Download 'run_analysis.R' to the same directory you downloaded the Zip file.

Set the working directory to the run_analysis.R file's directory:
from the menu: Session -> Set working directory -> To source file location

or from the command line setwd(&#060;>)

and then run the command: source("run_analysis.R")

The above command will read the datasets and write these files to the data sub-directory:

tidy_data.txt -- 8.35 Mb, a 10299x68 data frame

tidy_averages.txt -- 0.225 Mb, a 180x68 data frame

The script runs for ~30 seconds, but could take longer depending on your computer.

tidy_averages <- read.table("./data/tidy_averages.txt") reads the resulting resulting averages into r. It is 180x68 representing 30 subjects and 6 activities and their 68 associated averages.
