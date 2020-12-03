# for this script to work, you need to have the following packages installed:
# install.packages("ggplot2")
# install.packages("reprex")
# install.packages("styler")
# attach packages

library(reprex)


# Example 1: Including a dataset ------------------------------------------

# read data
# normally you would do this e.g. with read.table but here we just use the built-in
# mtcars dataset from R

my_data <- cars

# now you want to subset your data and only select the columns for speed 12
my_data[speed==12,]

# This does not work and you have no idea why. You want to ask a question in the forum

# First obtain code that generates your data:
dput(my_data)
# Now copy the content to your script to make a reproducible examle:
my_data <- structure(list(speed = c(4, 4, 7, 7, 8, 9, 10, 10, 10, 11, 11,
                                    12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14,
                                    15, 15, 15, 16, 16, 17, 17, 17, 18, 18, 18, 18,
                                    19, 19, 19, 20, 20, 20, 20, 20, 22, 23, 24, 24,
                                    24, 24, 25), dist = c(2, 10, 4, 22, 16, 10, 18,
                                    26, 34, 17, 28, 14, 20, 24, 28, 26, 34, 34, 46,
                                    26, 36, 60, 80,20, 26, 54, 32, 40, 32, 40, 50,
                                    42, 56, 76, 84, 36, 46, 68, 32,48, 52, 56, 64,
                                    66, 54, 70, 92, 93, 120, 85)), class = "data.frame",
                     row.names = c(NA, -50L))
my_data[speed==12,]

# Create a reprex ---------------------------------------------------------

# Option 1: Copy the code above (everything after dput) to your clipboard and call
reprex(venue = "r", style = TRUE)
# Now copy the content of your clipboard below your question in the forum.

# Option 2: highlight the code above with your mouse, go to Addins and select Reprex selection


# Example 2: Including a plot ---------------------------------------------

# Assume your created a plot with the ggplot library and you want to ask a
# question about it:

library(ggplot2)

ggplot(cars, aes(x=dist, y=speed)) +
  geom_point() +
  geom_smooth(method = "lm")

# In order to include the image into your question, you have to render it as html:

# first copy the code to the clipboard (important: also copy the library(ggplot2) part,
# otherwise your example will not be reproduced but instead throw an error because
# the ggplot2 package is missing)

# Now call

reprex(venue = "html", style = TRUE)

# Now you can paste your clipboard to the forum (remember that you have to add it to the
# html section of your post by clicking the little HTML button in the toolbar)
