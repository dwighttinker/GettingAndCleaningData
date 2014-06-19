Getting and Cleaning Data Project
==========================================


Download the source and unzip its datasets to the default 'UCI HAR Dataset' sub-directory.
( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

The directory structure will be:
                                                        <dir>
                                                                run_analysis.R
                                                                <UCI HAR Dataset>
                                                                        ...
                                                                <data>
                                                                        tidy_averages.txt
                                                                        tidy_data.txt
                                                           

Download 'run_analysis.R' to the source ZIP's directory.

in RStudio open the 'run_analysis.R' file: 

Set the working directory to the run_analysis.R file's directory:
from the menu: Session -> Set working directory -> To source file location
or from the command line setwd(<dir>)

and then run the command: source("run_analysis.R")

The above command will read the datasets and write these files to the data sub-directory:

tidy_data.txt -- 8.35 Mb, a 10299x68 data frame

tidy_averages.txt -- 0.225 Mb, a 180x68 data frame

The script runs for ~30 seconds, but could take longer depending on your computer.

tidy_averages <- read.table("./data/tidy_averages.txt") reads the resulting resulting averages into r. It is 180x68 representing 30 subjects and 6 activities and their 68 associated averages.
