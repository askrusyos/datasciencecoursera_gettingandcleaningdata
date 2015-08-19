---
title: "Getting and cleaning data - Course project"
output: html_document
---

### Contents in the repo
The repository contains:

* run_analysis.R: the script that runs the analysis on the original data and outputs the tidy dataset
* dataset_tidy.txt: the tidy dataset in .txt format
* CodeBook.md: the code book describing the variables contained in the tidy dataset and the process used to obtain them
* README.md: this ReadMe file

### How to run the script
To run the run_analysis.R script you should have downloaded the data at the link provided with the assignment and placed the unzipped folder "UCI HAR Dataset" in your current working directory. The script should be placed in the working directory.     
In other words your working directory should contain:

* the unzipped "UCI HAR Dataset" folder
* the "run_analysis.R" script

Then, to run the script, simply use the source() command in RStudio or in the R console. The tidy dataset output, in .txt format, will be placed in the working directory as well with the name "dataset_tidy.txt".
To read this file into R, in your working directory use the command

```{r}
read.table(file = "dataset_tidy.txt", header=TRUE)
```