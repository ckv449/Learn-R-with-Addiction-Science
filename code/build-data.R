library(tidyverse)

df <- read.csv("//umad.umsystem.edu/mimh/Projects/Addiction_Science_Data/DOTS/data/02_intermediate/2023-01-09_ems_combined.csv")

ems <- df %>% filter(timepoint == "pretest")


df <- read.csv("//umad.umsystem.edu/mimh/Projects/Addiction_Science_Data/DOTS/data/02_intermediate/2023-01-09_leo_combined.csv")

leo <- df %>% filter(timepoint == "pretest")

df <- read.csv("//umad.umsystem.edu/mimh/Projects/Addiction_Science_Data/DOTS/data/02_intermediate/2023-01-09_online_combined.csv")

online <- df %>% filter(timepoint == "pretest")

names(ems) %in% names(leo)
names(leo)

leo <- leo %>% select(
  progress, leo, duration_in_seconds, finished, recorded_date, age, gend, aian:white,
  ethnicity, year_position = years_position, year_field, 
  ooas1:ooas6, narrcb1:narrcb4, mhl1:mhl4, burnout1:burnout9
)

ems <- ems %>% select(
  progress, leo, duration_in_seconds, finished, recorded_date, age, gend, aian:white,
  ethnicity, year_position = years_position, year_field, 
  ooas1:ooas6, narrcb1:narrcb4, mhl1:mhl4, burnout1:burnout9
)

online <- online %>% select(
  progress, leo, duration_in_seconds, finished, recorded_date, age, gend, aian:white,
  ethnicity, year_position = years_position, year_field, 
  ooas1:ooas6, narrcb1:narrcb4, mhl1:mhl4, burnout1:burnout9
)

df <- rbind(leo,
            ems, 
            online)

n <- nrow(df)
data <- df[sample(nrow(df), 1000), ]

data <- data %>% 
  mutate(id = 1:nrow(data),
         .before = progress)

write.csv(data, file = "training-scales.csv") 

data.missing <- data %>% 
  replace(is.na(.), "-99")

write.csv(data.missing, file = "training-scales-missing.csv")  

  
  
  
