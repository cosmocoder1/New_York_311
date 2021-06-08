# New_York_311
Data Analytics case study

   The purpose of this study was initially to explore large, public datasets and find any intriguing or useful trends.  The New York 311 Call dataset (available on GCP BigQuery) catalogs the dates and complaint types of 311 calls in New York from 2010 to current.
   
# Questions   

   Are there seasonal trends in 311 call types in New York?
   What problems could trend identification solve in a large population with regard to city services?
   What timeline is needed in order to establish reliable predictability?
   Can city service budgets be further optimized on a seasonal cycle to prevent waste and increase efficiency?
   
# Processing   
   
   Fortunately, this is a remarkably clean dataset.  While still in its largest form, I used SQL for deletions of null values across all columns (0 were found) and checked the data type for each column for consistency.  After this, I moved it into RStudio for the more challenging parts.  
   Thanks to some fantastic help from others on Stack Overflow, I was able to piece together a method that calculates the mode (most frequently occurring value) of the complaint types across each hour.  Considering the challenges of making intuitive visualizations of this much data (and data of this type), I repeated this process to collect a daily complaint type mode (of hourly modes) to determine the predominate complaint type.  
   The data was then further processed in R into a year subset (May 2020 - Apr 2021), and then monthly.

# Visualization

   The monthly subsets were then brought into Google Sheets and used for charting.  The intuitive choice seemed to be pie charts, and while interesting to look at, they didn't relay that kind of data as well as I had hoped.  So then I tried a stacked bar chart it seems to work fairly well at giving a clear and easy-to-read representation of what the data is saying.  
   I tried multiple shifts in the color scheme to accommodate all viewers, make it comfortable to look at and still contrast the various call types.   
   
# Limitations / Analysis   
   
   The central limitation of this analysis is the brevity of the timeframe.  Only being a yearlong interval and taking place during what might be considered the peak of the COVID pandemic - this timeframe may altogether be an outlier.   
   
   The data for this year appears to show a seasonal variation - most visibly between residential noise complaints and heat/hot water calls.  As expected, the heat and hot water calls increase through winter months while residential noise complaints seem to swell and peak in fall months.  The peak in illegal parking during spring is also interesting.  
   
# Next steps

   The next step for this project would be a repetition of this process for all years available, giving over eleven years total from which to establish trends and make predictions.  Also, it could lend useful insights into behavioral / societal changes in a large, diverse population throughout a pandemic.  
   After completing an extended study, exciting improvements to budgetary precision for city services might be possible.  
   
   


   
   
  
