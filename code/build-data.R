library(tidyverse)
source("code/functions.R")

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

df <- df[complete.cases(df[26:27]),]

n <- nrow(df)
data <- df[sample(nrow(df), 500), ]

data <- data %>% 
  mutate(id = 1:nrow(data),
         .before = progress)



missing_pct(data)

write.csv(data, file = "data/training-scales.csv") 

library(missMethods)

data.missing <- delete_MCAR(data,  p = .19) 

data.missing.placeholder <- data.missing

data.missing.placeholder[1:8][is.na(data.missing.placeholder[1:8])] <- "-99"
data.missing.placeholder[9:16][is.na(data.missing.placeholder[9:16])] <- -99
data.missing.placeholder[17:24][is.na(data.missing.placeholder[17:24])] <- "NA"
data.missing.placeholder[25:39][is.na(data.missing.placeholder[25:39])] <- ""

write.csv(data.missing, file = "data/training-scales-missing.csv")  
write.csv(data.missing.placeholder, file = "data/training-scales-missing-special.csv")

  
  
  
