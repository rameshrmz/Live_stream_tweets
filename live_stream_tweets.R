# Live streaming tweets on SAvAUS 2nd Test Match
#rtweet: Collecting Twitter Data


#Installing and loading package
## Install and Load rtweet
    library(rtweet)

# rtweet captures live streams of Twitter data using "stream_tweets()" function
  
    ## Stream keywords used to filter tweets
    q <- "#SAvAUS"
    
    ## Stream time in seconds so for one minute set timeout = 60
    ## For larger chunks of time, I recommend multiplying 60 by the number
    ## of desired minutes. This method scales up to hours as well
    ## (x * 60 = x mins, x * 60 * 60 = x hours)
    ## Stream for 5 minutes
    streamtime <- 05 * 60
    
    ## Filename to save json data (backup)
    filename <- "rtelect.json"
    
# Stream Tweets:
    ## No upfront-parse save as json file instead method
    stream_tweets(
      q = q,
      parse = FALSE,
      timeout = streamtime,
      file_name = filename
    )
    
    ## Parse from json file
    rt <- parse_stream(filename)
    
    ## Preview tweets data
    View(rt)
    
    ## Preview User Data:
    users_data(rt)
    
# Plot time series of all tweets aggregated by second
    ts_plot(rt, by = "secs")
# Plot time series of all tweets aggregated by Minutes
    ts_plot(rt, by = "mins")  

# Plotting with Filters:
    ## ts_plot() function can also generate multiple time series for grouped data frames.
    
    #rt %>%
    #  dplyr::group_by(screen_name) %>%
    #  ts_plot() +
    #  ggplot2::labs(
    #    title = "XXX",
    #    subtitle = "YYY"
    #  )