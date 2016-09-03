Run_analysis.R is a script that performs the 5 steps described in the Week 4 assignment instructions for Coursera's Getting and Cleaning Data.

All data associated with "x," "y," and "subject" are merged into three separate tables using rbind().
xmerge, ymerge, and submerge

Next, we want to extract mean and sd data, and assign easy-to-read column and activity names. 
The columns associated with mean and standard deviation are extracted from the feature list and from the xmerge datasets.  
The resultant extrax dataset has the relevant sd and mean data extracted from xmerge and labeled according to feature names.
Next we replace the activity integers with activity names and IDs in the dataset.

Combine the x, y, and subject data into a single dataset (extrax, ymerge, and submerge)
Write.table a tidy table to create a second dataset that has all of the summary data you extracted and shaped.

The data for these operations include:
X_train, y_train, X_test, y_test, subject_train and subject_test: these are the downloaded files with the data.
xmerge, ymerge, and submerge:  these are the merged datasets for x, y, and subject data, respectively
features: contains the correct names for the xmerge dataset.  These names are applied to the column names stored in fstat
fstat: a numeric vector used to extract the mean and sd data.
actlabels:  contains the activity names applied to ymerge
extrax: a table with the mean and sd data and correct column names
all:  a merged dataset from extrax, ymerge, and submerge
tidy:  the final, indepedent dataset, the result of the previous operations.
