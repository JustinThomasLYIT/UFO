# class test 1
# Justin Thomas

# Q1 Read the UFO csv into dataset called ufo_data
ufo_data <- read.csv('ufo.csv')


#Q2 
# Show the structure of the dataframe
str(ufo_data)

# show the first 15 lines
head(ufo_data, 15)

# count to confirm if 89071 rows in it
nrow(ufo_data)

#Q3
# convert the datetime field from char to date variable
converted_date <- ufo_data$datetime
converted_date <- as.Date(converted_date, "%m/%d/%y")
converted_date


#Q4
# update the dataframe with the new date structure
# confirm structure has updated
ufo_data$datetime <- converted_date
str(ufo_data)

#q5 
# display names of data frame
# modify 3 chosen variable names
# prove they have changed
names(ufo_data)
names(ufo_data)[6] <- "DurationSeconds"
names(ufo_data)[7] <- "DurationHrsMins" 
names(ufo_data)[9] <- "DatePosted"
names(ufo_data)

#Q6 
#change latitude variable from chr to numerical
#show new structure
new_latitude <- as.numeric(ufo_data$latitude)
new_latitude
ufo_data$latitude <- new_latitude
str(ufo_data)

#Q7 
#Using mice library, display number of missing variables in dataframe
#indicate how many records have no missing data
#indicate how many variable have all data variables missing
# save missing variable plot into working directory

library(mice)
md.pattern(ufo_data)
# 88676 have no missing data as shown in all blue top line
# none have all missing data as would be all purple line

#Q8
#order dataframe by shape and then city
#extract datetime, city, country and shape and store in dataframe called 
#sorted_ufo_data
#Display first 15 rows of this new data frame
attach(ufo_data)
sorted_data <- ufo_data[order(shape, city), ]

include_list <- names(sorted_data) %in% c("datetime", "city", "country", "shape")
include_list
sorted_ufo_data <- sorted_data[(include_list)]
sorted_ufo_data
str(sorted_ufo_data)
head(sorted_ufo_data, 15)

# Q9
# using subset find all entries in the ufo dataframe where country = 'gb'
# andshape = 'disk'
# store in dataframe called ufo_gb_disk

attach(ufo_data)
ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk",)
ufo_gb_disk
# 111 rows

# Q10
# write newly modified ufo dataframe to modified_ufo.csv
# wite ufo_gb_disk to ufo_gb.csv
# write sorted_ufo_data to sorted_ufo.csv
# save to local working directory.
# sync these 3 files, and script file and png image to Github repo

write.csv(ufo_data, file = "modified_ufo.csv") 
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv") 
