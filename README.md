# CleanDataProject

This code will take the UCI Samsung data set and covert it into a tidy data set.

The first section of code loads the data from the raw data set. In the next section the variable names are altered to be more descriptive. The "training" and "test" data are joined into a larger data set. Only variables that contain the strings "mean" and "std" are selected to be in the future tidy data set. Activity name data are adjsuted to be more descriptive rather than #s 1-6 (ie WALKING). In the last section a tidydata set is created this is grouped by subject and activity in which the means of all the remaining variables are reported. 
