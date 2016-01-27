# Code Book
This code book summarizes the data found in `tinydata.txt`.

##Background
The data used to create this data files were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database come from the accelerometer and Gyroscopescope 3-axial raw signals TimeAccelerometer-XYZ and TimeGyroscope-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerometer-XYZ and TimeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerometerJerk-XYZ and TimeBodyGyroscopeJerk-XYZ). Also the Magnitudenitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerometerMagnitude, TimeGravityAccelerometerMagnitude, TimeBodyAccelerometerJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FreqBodyAccelerometer-XYZ, FreqBodyAccelerometerJerk-XYZ, FreqBodyGyroscope-XYZ, FreqBodyAccelerometerJerkMagnitude, FreqBodyGyroscopeMagnitude, FreqBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' are used to denote 3-axial signals in the X, Y and Z directions.

###Measurement Variables
* `TimeBodyAccelerometer-XYZ`
* `TimeGravityAccelerometer-XYZ`
* `TimeBodyAccelerometerJerk-XYZ`
* `TimeBodyGyroscope-XYZ`
* `TimeBodyGyroscopeJerk-XYZ`
* `TimeBodyAccelerometerMagnitude`
* `TimeGravityAccelerometerMagnitude`
* `TimeBodyAccelerometerJerkMagnitude`
* `TimeBodyGyroscopeMagnitude`
* `TimeBodyGyroscopeJerkMagnitude`
* `FreqBodyAccelerometer-XYZ`
* `FreqBodyAccelerometerJerk-XYZ`
* `FreqBodyGyroscope-XYZ`
* `FreqBodyAccelerometerMagnitude`
* `FreqBodyAccelerometerJerkMagnitude`
* `FreqBodyGyroscopeMagnitude`
* `FreqBodyGyroscopeJerkMagnitude`

The set of variables that were estimated from these signals are:
* `Mean`: Mean value
* `StDev`: Standard deviation

###Identification Variables
* `subjectID` - The unique number identifying the test subject for each reading.
* `ActivityDesc` - The type of activity that was being performed when the measurement was produced.

##Transformations
The data were originally divided into both train and test data.  These data were combined into one set of data.  A mean statistic for each measurement variable was calculated by subject then activity.  Variable names were cleaned up relative to the original data to make the names more descriptive.
