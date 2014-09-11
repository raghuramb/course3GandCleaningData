#Code book for Cleaning Data and creating the Tidy dataset 

1. Read the features.txt file. 
2. Move the appropriate column names for the features dataframe 
3. Identify the features supposed to have the mean values. Use grep searching for "mean()" 
4. Identify the features supposed to have the std values  Use grep searching for "std()"
5. Combine both the mean and std features into a dataframe with FeatureID and FeatureName.  We need this relfeats data.frame later.
6. Read the Activity file and identify the activity id and labels. 
7. Read the test-data test_x file 
8. Read the test-data test_y file 
9. Read the subject_test file 
10. Combine all the three files read before using cbind
11. Repeat the steps from 7 to 10 for Train data
12. Combine the Dataframes created in steps 10 and 11 using rbind into a dataframe into alldf. 
13. Define column names for alldf.  Except the first two columns, the rest of the column names has to be from Features file.
14. Now, merge the resulting dataframe with activity dataframe to have a column with appropriate activity label instead of activity name. 
15. Now, we need to have only those features which are either mean or std.  For this, using subset, and in the select 
    clause give the column names to be selected.  The output of step5 in relfeats has a column with the column names we need. 
    Also, ensure that the columns subject and activity_name are also in the select clause.   
17. Aggregate resulting dataframe on the columns Subject and activity_name running the mean function.  
18. Write the output to the final tidy dataset. 
