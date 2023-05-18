#### Functions ####

## Calculate ercent of total missing data 
missing_pct <- function(data){
  # The total count of missing data
  sum(is.na(data))/
    # count of all data (missing + non-missing)
    (sum(is.na(data)+!is.na(data)))
}