# Introduction

The script `run_analysis.r`performs the 5 steps described in the course project's definition.

* Firstly the similar data is merged using the `rbind()` function. By similar, we understand the files with the same dimensions and similar names' structure.
* Secondly columns with the mean and standard deviation measures are selected from the whole dataset. After extracting these columns, they are named according to the `features.txt` file.
* As 3rd step, activity names are extracted from `activity_labels.txt` and assigned to the dataset.
* As 4th step, descriptive variables names are used in order to label the dataset.
* Finally, a new dataset with all the average measures for each subject and activity type is generated. The output file is called `Tidy.Averages.txt`, and uploaded to this repository.

# Variables

* `Train.X_train`, `Train.y_train`, `Test.X_test`, `Test.y_test`, `Train.subject_train` and `Test.subject_test` contain the data from the downloaded files.
* `All.X`, `All.y` and `All.subject` keep the merged data for the later analysis.
* `Main.Features` keeps the right names for the `All.X` dataset, which are applied to the column names stored in `iColNum`, a numeric vector used to select desired data.
* A similar approach is taken with activity names through the `Main.Activities` variable.
* `All.Data` combines `All.X`, `All.y` and `All.subject` in a big dataset.
* Finally, the relevant averages are calculated with `ddply()` from `plyr` package and stored in `Tidy.Averages` data frame, later exported to text file under similar name. 
