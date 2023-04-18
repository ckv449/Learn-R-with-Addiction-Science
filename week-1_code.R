# Learn R with Addiction Science - Week 1 ----
# Date - 11/4/2022
# Author: Zach Budesa


### References ----
# Helpful References
# Data Science: A First Introduction - https://datasciencebook.ca/
# Data Skills for Reproduceable Research - https://psyteachr.github.io/reprores-v3/index.html
# R for Data Science - https://r4ds.had.co.nz/
# RStudio Cheatsheets - https://posit.co/resources/cheatsheets/test


# For those with access to the Addiction Science Shared Drive, all of the code can
# be found: 
# \\umad.umsystem.edu\mimh\Projects\Addiction Science\1_Employee Documents for Reference\Learn_R_with_AddiSci



## Getting Started ----
# How to install R
## Go to https://cran.r-project.org/
## Select your operating system.
## Download the file and install it.

# How to install RStudio
## For personal computers: https://posit.co/download/rstudio-desktop/


## For UMSL computers:
### 1) Navigate to the start menu, by clicking the windows button in the bottom
### left, or hitting the windows key on your keyboard.
### 2) Type "Software Center", and either click on the icon or hit the enter key.
### 3) Select Rstudio from the list, then click install.
### 4) Follow all instructions and wait until the installiation is complete.
### 5) Now lauch RStudio. This will automatically start R as well.

# There are two tweaks that you should do to your RStudio installation to
# maximize reproducibility. Go to Global Options... under the Tools menu,
# and uncheck the box that says Restore .RData into workspace at startup.
# If you keep things around in your workspace, things will get messy, and
# unexpected things will happen. You should always start with a clear workspace.
# This also means that you never want to save your workspace when you exit, so
# set this to Never. The only thing you want to save are your scripts.

# Now that you have R & RStudio installed, welcome to learning to code.
# https://twitter.com/hadleywickham/status/589068687669243905



# The fun stuff first, how do you make data visualizations? ----
# Packages as the foundation for the language to grow.
install.packages("tidyverse")
library(tidyverse)

# And now the data that we'll be using: Penguins.
install.packages("palmerpenguins")
library(palmerpenguins)
# If you like Penguins, or want to learn more about this dataset, you can 
# check out this youtube video with the maintainers of the data: 
# https://www.youtube.com/watch?v=HZf5s_QWEpA


# Our first look at data
penguins
View(penguins) # Your first function
?penguins

# Now that you've seen what the "dataframe" (define) looks like, 
# let's graph it.

# Among the variables in penguins are:
#
# flipper_length_mm, penguins' flipper length in millimeter.
#
# bill_length_mm, penguins' bill length in millimeter.
#
# Let's say that we suspect some kind of relationship between them.

# ggplot, or ggplot2, is the fancy graphing package for R. 
# The "gg" in ggplot stands for "Grammar of Graphics", which is one of the 
# foundation data visualization books. This package draws heavily from it.

# Using ggplot requires at least two stages:
ggplot(data = penguins) + # First, you use the ggplot function. In this funciton, 
  # you sepcifiy where your data is from. This creates a blank canvas for your graph.
  # When you use ggplot, you connect functions using the + sign.
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) # Second, you use a geom function.
  # Geom functions tell R what kind of visualization to use. Here we're using a 
  # scatter plot, which is called geom_point. 

# Try it for yourself with some of the other variables in the penguins data set.

# Now, before we move on, there are other methods you can use to plot data.
# One is what's called base R, which is just the R language without packages.
# This method uses the plot() function:
plot(penguins$flipper_length_mm, penguins$bill_length_mm) # Similar, but different. Plot is useful, but doesn't look nice.

# Next, let's spice up the graph a bit. Let's change the points colors to represent
# specieses of vehicles.
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm, color = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm, size = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm, alpha = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm, shape = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm), color = "blue")

# Facet_Wrap
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) + 
  facet_wrap(~ species, nrow = 2)

# Facet_Grid
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) + 
  facet_grid(island ~ sex)

# Line
ggplot(data = penguins) + 
  geom_smooth(mapping = aes(x = flipper_length_mm, y = bill_length_mm))

# Combine
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = flipper_length_mm, y = bill_length_mm)) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y = bill_length_mm))




# Data Manipulation ----
## Coding Basics ----

# R is a big, dumb robot.
# It can do math.
1 + 1

# With big numbers
3000000000 + 48958392

# With small numbers
.00001*.0309

# It even knows order of operations
4-3*3

# And you still can't divide by 0
4/0

# All kinds of math
1 / 200 * 30

(59 + 73 + 2) / 3

sin(pi / 2)

# Creating Objects: <-

a <- 11
a

465 -> What_ever_name_I_want
What_ever_name_i_want
What_ever_name_I_want

# You can always use the = sign, but it only works one direction.

# You can even multiple them!
What_ever_name_I_want*x

# Saving text as a function.
x <- "Hello World"
x

# Finally, a function.
seq() #notice that the parentheses come up together.

seq(1, 10)
z <- seq(1,10)
z

y <- seq(1,10,length.out = 15)
y

# No look at the environment in the top right corner and see everything you've saved.
# Could you save the visualizations you made earlier?














