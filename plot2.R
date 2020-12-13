#set wd
directory<-getwd()

#unzip dataset
unzip("exdata_data_household_power_consumption.zip", exdir = directory)

#read dataset
household_dataset<-read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = TRUE)

#format date 
household_dataset$Date<-as.Date(household_dataset$Date, format="%d/%m/%Y")

#subset data
library(dplyr)
household_dataset_subset<-dplyr::filter(household_dataset, Date=="2007-02-01" | Date=="2007-02-02")

#format date 
household_dataset_subset$datetime<-paste(household_dataset_subset$Date, household_dataset_subset$Time)
household_dataset_subset$datetime<-strptime(household_dataset_subset$datetime, "%Y-%m-%d %H:%M:%S")


#plot2
png("plot2.png", width = 480, height = 480)
plot(household_dataset_subset$datetime, household_dataset_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()
