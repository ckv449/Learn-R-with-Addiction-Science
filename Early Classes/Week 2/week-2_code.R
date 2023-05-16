# Learn R with Addiction Science - Week 2 ----
# Date - 12/02/2022
# Author: Zach Budesa
# For those with access to the Addiction Science Shared Drive, all of the code can
# be found: 
# \\umad.umsystem.edu\mimh\Projects\Addiction Science\1_Employee Documents for Reference\Learn_R_with_AddiSci

# Week 1 Recap ----
## Installing Packages ----
# Function: install.packages()
# Packages we installed: {tidyverse}, {palmerpenguines}
install.packages("tidyverse") ; intstall.packages("palmerpenguins")
library(tidyverse) ; library(palmerpenguins)

## Using {ggplot2} ----
ggplot(data = penguins) + # First, you use the ggplot function. In this funciton, 
  # you sepcifiy where your data is from. This creates a blank canvas for your graph.
  # When you use ggplot, you connect functions using the + sign.
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) # Second, you use a geom function.
  # Geom functions tell R what kind of visualization to use. Here we're using a 
  # scatter plot, which is called geom_point. 

# Plot with different colors by species
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species))

# Facet_Grid
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) + 
  facet_grid(island ~ sex)

## Coding Basics ----
# R is at it's base a calculator you can enter in any type of math equation and
# it will give you the answer
1 + 1 #= 2

## Symbols ----
# Creating Objects: <-
# This symbol can work in both directions ->
a <- 11
a
465 -> What_ever_name_I_want
What_ever_name_I_want
# You can always use the = sign, but it only works one direction.
a = 2
a
2 = a
# If you need more information about a funtion within R, use the ?
?install.packages
















# Data Wragnling ----
# Just like last time, we're going to use the tidyverse, 
# so we load it like we did last time:
library(tidyverse)

# First, let's practice saving data
write_csv(penguins, "penguins.csv")

# Now, we need to load a package that will help us import data:
library(readr)
# Next you need to navigate to where you have stored the data:
setwd("~/Desktop") # This is not always the best method, but it works for now.
penguins <- read_csv("penguins.csv") # Finally, read in the data
View(penguins) # And inspect it.

# Let's reuse our scatter plot functions from last time:
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = bill_length_mm, 
                           y = flipper_length_mm, 
                           color = species))

# Before data wrangling, the pipe!
# %>% 

penguins %>% # This symbol can help keep code easier to read and write.
  ggplot() + # It places whatever comes before it into the first argument
  # of the next function. You can also use a . to move it.
  geom_boxplot(mapping = # This is the function to produce boxplots
                 aes(x = body_mass_g,
                     y = species, 
                     color = sex))

# Now that we know that there are weight differences across sex and species,
# let's learn a little more about the details.

# filter()
gentoo <- penguins %>% 
  filter(species = "Gentoo")

gentoo <- penguins %>% 
  filter(species == "Gentoo")
View(gentoo)

gentoo %>% 
  ggplot() + 
  geom_boxplot(
    aes(species,
        body_mass_g,
        color = sex))

not_gentoo <- penguins %>% 
  filter(species != "Gentoo")
View(not_gentoo)

not_gentoo %>% 
  ggplot() + 
  geom_boxplot(
    aes(species,
        body_mass_g,
        color = sex))

# You can filter using the following symbols:
# == - Two equal signs means "is"
# != - a ! and = sign means "is not"
# <= - a < and = sign means "less than or equal to"
# >= - a > and = sign means "greater than or equal to"
# You can also use < and > by themselves if you don't want
# the "equal to" part.

# Next, I want only male penguins on Biscoe Island
mb <- penguins %>% 
  filter(sex == "male") %>% 
  filter(island == "Biscoe")

mb %>% 
  ggplot() + 
  geom_boxplot(
    aes(species,
        body_mass_g,
        color = sex))

# You can combine statements like this with symbols:
# & - "and", everything filtered has to meet both criteria.
# | - "or", everything filtered has to meet at least one criteria.
m_and_b <- penguins %>%  
  filter(sex == "male" & island == "Biscoe")
m_and_b %>% 
  ggplot() + 
  geom_boxplot(
    aes(species,
        body_mass_g,
        color = island,
        fill = sex))

m_or_b <- penguins %>%  
  filter(sex == "male" | island == "Biscoe")
m_or_b %>% 
  ggplot() + 
  geom_boxplot(
    aes(species,
        body_mass_g,
        color = island,
        fill = sex))

mb_med <- penguins %>% 
  filter(sex == "male",
         species == "Gentoo",
         (body_mass_g <=5000 &
            body_mass_g >= 4000))
mb_med

# Summarizing 
# What is the average penguin weight in our dataset? 
# The summarize() function can help us learn more.

penguins %>% 
  summarize(
    mean = mean(body_mass_g), 
    sd = sd(body_mass_g))

# Because there are missing cells, R can't calculate this correctly.
# We have to tell it to ignore missing data.
penguins %>% 
  summarize(
    mean = mean(body_mass_g, na.rm = TRUE), 
    sd = sd(body_mass_g, na.rm = TRUE))

# You can use all of these functions within summarize()
# mean(): the average
# sd(): the standard deviation, which is a measure of spread
# min() and max(): the minimum and maximum values, respectively
# IQR(): interquartile range
# sum(): the total amount when adding multiple numbers
# n()

# Grouping!

# What is the average penguin weight by species? 
# We have 3 islands, with various numbers of penguins 
# of different species. The group_by() function can help
# us learn more.

penguins %>% 
  group_by(species) %>% 
  summarize(
    count = n(),
    mean = mean(body_mass_g, na.rm = TRUE), 
    sd = sd(body_mass_g, na.rm = TRUE),
    IQR(body_mass_g, na.rm = TRUE))

# We can even have R group our data by multiple columns.
avg_weight_s_i <- penguins %>% 
  group_by(species, island) %>% 
  summarize(
    count = n(),
    mean = mean(body_mass_g, na.rm = TRUE), 
    sd = sd(body_mass_g, na.rm = TRUE),
    IQR(body_mass_g, na.rm = TRUE))

# Sometimes we want to arrange() our columns in different order.
avg_weight_s_i %>% arrange(count)

avg_weight_s_i %>% arrange(desc(mean))


# Now we don't always need all of our columns. We can filter out 
# rows we don't want, and use select() to keep or remove columns.

mtcars

adelie <- 
  penguins %>% 
  filter(species == "Adelie")
adelie

adelie_sizes <- penguins %>% 
  select(bill_length_mm, bill_depth_mm, flipper_length_mm,body_mass_g)
adelie_sizes
adelie_sizes_abridged <- penguins %>% 
  select(bill_length_mm:body_mass_g)
adelie_sizes_abridged

adelie

adelie <- adelie %>% 
  select(-species)
adelie

# Finally, let's convert these metric measurements to imperial.
# The mutate() function can help us create new variables.
penguins <- penguins %>% 
  mutate(
    bill_length_in = bill_length_mm/25.4, 
    bill_depth_in = bill_depth_mm/25.4, 
    flipper_length_in = flipper_length_mm/25.4,
    body_mass_lbs = body_mass_g/453.6
  )

View(penguins)

penguins %>% group_by(species) %>% summarize(mean.bill.length = mean(bill_length_in, na.rm = TRUE),
                                             mean.bill.depth = mean(bill_depth_in, na.rm = TRUE),
                                             mean.mass.lbs = mean(body_mass_lbs, na.rm = TRUE))


ggplot(data = penguins) + 
  geom_point(mapping = aes(x = bill_length_mm, 
                           y = flipper_length_mm, 
                           color = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = bill_length_in, 
                           y = flipper_length_in, 
                           color = species))

# Data Types
glimpse(penguins)
# fct = Factor - Categorical data
# dbl = Double - Number, usually with decimals allowed.
# int = Integer - Number, no decimals allowed 






