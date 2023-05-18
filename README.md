# Class Description

This set of lessons is designed to help Addiction Science Team Members
develop basic skills in using R and RStudio for data management and
analysis. These lessons focus on using the {tidyverse} collection of
functions and tools to help learners develop data analysis skills that
are adaptable, and develop documents which are shareable.

# Class Outline

-   Lesson 1: Import, Inspect, and Visualize data. This lesson provides
    a brief overview of how to get data into R to work with, defining
    objects, inspecting data frames, and plotting with both base R and
    ggplot2. Includes information about measures of central tendency and
    spread, for those more statistically inclined.

-   Lesson 2: How to Use Select, Filter, and Mutate functions to begin
    wrangling your data. Also includes basic statistical functions to
    enhance your investigation of data & data frames. Learning about
    **Tidy Data**.

-   Lesson 3: Factors, strings, text, and data types. \[In development\]

-   Lesson 4: Exploratory Data Analysis: Combining our tools to
    investigate our data, building a workflow, and using pipes and
    RMarkdown. \[In development\]

-   Lesson 5: Relational data: Splitting, joining, and keys. \[In
    development\]

-   Lesson 6: Confusing everything for dates: No really, what is a date?
    \[In development\]

-   Lesson 7: Missing data \[In development\]

-   Lesson 8: Functions and for loops \[In development\]

# How to Use

You will need R in order to participate in this class. You can download
it via the Comprehensive R Archive Network (CRAN):
<https://cran.r-project.org/>. It is also recommended that you use
RStudio, an integrated development environment (IDE) that adds extensive
functionality to the R environment. It is available from posit for free:
<https://posit.co/download/rstudio-desktop/>. If you are using an
UMSL-owned computer, you will be able to download R from the CRAN link
above, but will need to use the Software Center to install RStudio.
Please contact the owner of this repo for additional instructions.

You can access this class in a few ways. I recommend using the {usethis}
package to clone the entire file straight from GitHub. You can do so
with the following code in R:

    # If you do not have it already, install usethis package first:
    # install.packages("usethis")

    # Then execute the following line of code:
    usethis::create_from_github("https://github.com/zbudesa/Learn-R-with-Addiction-Science", 
    destdir = "<SET DESTINATION FOLDER ON YOUR COMPUTER>")

Set a destination inside of the quotation marks. For example, on my USML
owned PC, `"C:/Users/zrbxv2/OneDrive - University of Missouri/Desktop"`
would copy the entire repo to a new folder on my desktop. Windows users,
note that you will have to change the backslashes (\\) to forward
slashes (/) if you copy a path from the file explorer.

You can also download the entire repository as a .zip file. Click the
green “Code” button next the the “About” section at the top of this page
and select “Download ZIP”.

Finally, you can access all of the code through your browser. Copying
and pasting code is probably not the most exciting or fastest way to
explore this class, but hey, you do you.

# Books and Resources

These lessons have been heavily adapted from the following resources:

-   [R for Data Science](https://r4ds.had.co.nz/)

-   [Modern Data Science with R](https://mdsr-book.github.io/mdsr2e/)

-   [Tidyverse Skills for Data
    Science](https://jhudatascience.org/tidyversecourse/)

## Expand your Skills

-   [Happy Git and GitHub for the
    useR](https://happygitwithr.com/index.html)

-   [The {targets} R package user
    manual](https://books.ropensci.org/targets/)

-   [Advanced R](http://adv-r.had.co.nz/)
