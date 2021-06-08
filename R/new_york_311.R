#Setting up the environment

install.packages("tidyverse")
install.packages("lubridate")
install.packages("plyr")
install.packages("data.table")

library(tidyverse)
library(lubridate)
library(plyr)
library(dplyr)
library(data.table)

#New York 311 df

new_york_311_df <- new_york_311_full
new_dates <- data.frame(do.call("rbind", strsplit(as.character(new_york_311_df$created_date), " ", fixed = TRUE))) #split datetime column
new_dates <- subset(new_dates, select = -c(X3)) #clear extra column
new_dates <- plyr::rename(new_dates, c("X1"="date", "X2"="time")) # rename columns 
new_york_311_df$date = new_dates$date# add new date and time columns back to dataframe
new_york_311_df$time = new_dates$time
new_york_311_trimmed = subset(new_york_311_df, select = -c(created_date,unique_key)) #remove extra columns

#get hourly mode for complaint type

ny_311_hourly_modes <- new_york_311_trimmed
setDT(ny_311_hourly_modes) [, hour := paste(date, sub(':.+','', time))]
ny_311_hourly_modes[, n := seq(.N), by = .(hour, complaint_type)]
ny_311_hourly_modes[, mode := complaint_type[which.max(n)], by=hour]

#remove duplicates

ny_311_hourly_modes_cleaned <- ny_311_hourly_modes[!duplicated(ny_311_hourly_modes$hour), ]
ny_311_hourly_modes_cleaned <- as.data.frame(ny_311_hourly_modes_cleaned)
View(ny_311_hourly_modes_cleaned)

#get daily mode for complaint type

ny_311_daily_modes <- ny_311_hourly_modes_cleaned
setDT(ny_311_daily_modes) [, day := paste(date)]
ny_311_daily_modes[, n := seq(.N), by = .(day, mode)]
ny_311_daily_modes[, mode := mode[which.max(n)], by=day]
View(ny_311_daily_modes)

#remove duplicates for daily mode

ny_311_daily_modes_cleaned <- ny_311_daily_modes[!duplicated(ny_311_daily_modes$day), ]
ny_311_daily_modes_cleaned <- as.data.frame(ny_311_daily_modes_cleaned)
ny_311_daily_modes_sorted <- ny_311_daily_modes_cleaned[order(date),] #sort by date
View(ny_311_daily_modes_sorted)

#select year subset for further cleaning in Google Sheets
ny_311_daily_mode <- data.frame(ny_311_daily_modes_cleaned) #clone df
as.Date(ny_311_daily_mode$date, format = "%Y-%m-%d") #format date col
ny_311_daily_mode <- dplyr::arrange(ny_311_daily_mode, date) #order by date column
ny_311_daily_mode_year <- ny_311_daily_mode[ which(ny_311_daily_mode$date > "2020-05-01"), ] 



