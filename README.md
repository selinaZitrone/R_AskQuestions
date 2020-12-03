
<!-- README.md is generated from README.Rmd. Please edit that file -->

# What to do if you get stuck with R

It’s normal to get stuck on a problem where you need help from someone.
Don’t worry\! The course forum (and other online forums) ar the perfect
place to ask your question. However, it is important to follow some
guidelines for problem solving and question asking to make the whole
experience more pleasant and productive.

Please read the following guide to get an idea of how to trouble-shoot R
problems and where and how to get the best help.

## 1\. Read the R documentation before you ask

Often, questions about how to use a particular function are solved by
just reading the doc. To bring up the doc for a function in R, type ?
followed by the function name to check the doc for the function, e.g.:

``` r
?mean # or
help(mean)
```

Some special functions start with a symbol instead of an alphabet. In
such cases, wrap the function in backticks \`\`. e.g., to check the doc
for the \[ function:

``` r
?`[`
help(`[`)
```

## 2\. Look for the answer on the web

Learning how to search for an answer on the internet is arguably one of
the most important problem solving skills when programming. In most (if
not all) cases, you are not the first one having a specific problem and
others already posted questions about it on forums such as
Stackoverflow. You just need to learn how to formulate a question and
you will find the correct answer within the first hits from your search
engine of choice.

So before asking on a forum yourself, try looking for an answer online.

### Tips for searching

  - If you got an error or warning search with keywords: R, function
    name, error message
  - Use RStudio and R in English. Then can easily copy and paste the
    error message from the console to your search engine and find
    answers
      - calling `Sys.setenv(LANGUAGE='en')` in the console should do the
        trick and change your messages to English
  - If you don’t know how to do something in R try searching
      - “How to …”, e.g. “R ggplot how to change axis title”
  - Always search in English to get much more answers

## 3\. How to ask a good question?

If you didn’t find the answer with any of the above mentioned methods,
you can ask a question on a forum so that others can help you. You
should ask your questions as clear as possible to minimize guesswork and
make answering easy and effective.

To achieve this, a good question should contain the following:

  - **A clear problem statement**: Provide all necessary details. What
    are you trying to do? What have you tried that didn’t work? What is
    your expected output?
  - **A minimal dataset** to demonstrate the problem
      - smallest data set necessary to reproduce the problem
      - Don’t describe your data without providing it\!
  - **A minimal runnable** code to reproduce the error/problem
      - All relevant code that everyone can just copy and paste into
        their R console and run with minimal modification.
  - if necessary: information on the used packages, R version and system
  - if you have a function with random processes: a fixed seed before
    your example starts (fix seeds by calling set.seed() function)

### R can help you to ask a good question\!

Luckily, there are nice R functions that help you create a reproducible
example of your problem/question including data, plots and error
messages that ensure that everyone can copy your example and rerun it in
their own R sessions to see the problem for themselves.

Learning how to use these functions will make question asking and
answering much easier. Reproducible examples are key to getting your
questions answered fast, therefore it is worth to learn how to produce
them from the very beginning.

#### Include a minimal dataset

The easiest way to share your data is by using the dput command.

Basic: - Copy and paste the output of `dput(<your_data>)`

More advanced (if your data is too large for dput): - Create a gist with
dput in it and provide the link (e.g. on Github, more info
[here](https://docs.github.com/en/free-pro-team@latest/github/writing-on-github/creating-gists))
- Create a pastebin with dput in it and provide the link

**Example**

Assume you are using the built-in dataset `mtcars` for your analysis. If
you want to provide others with code that reproduces this dataset, you
can use `dput`. The output code of `dput` can be copy-pasted to any R
session to reproduce the dataset. If your dataset is large, try to
provide the minimum necessary to reproduce your problem. E.g. provide a
subset with fewer columns and fewer rows.

``` r
# This is how the data looks like
mtcars[1:5, 1:2]
#>                    mpg cyl
#> Mazda RX4         21.0   6
#> Mazda RX4 Wag     21.0   6
#> Datsun 710        22.8   4
#> Hornet 4 Drive    21.4   6
#> Hornet Sportabout 18.7   8
# get code that generates the frist five lines and first two columns your dataset
dput(mtcars[1:5, 1:2])
#> structure(list(mpg = c(21, 21, 22.8, 21.4, 18.7), cyl = c(6, 
#> 6, 4, 6, 8)), row.names = c("Mazda RX4", "Mazda RX4 Wag", "Datsun 710", 
#> "Hornet 4 Drive", "Hornet Sportabout"), class = "data.frame")
```

#### Create an example with runnable code using the `reprex` package

The reprex package helps you turn your code into reproducible examples.

**Why should you use this package?**

Because - you never have to copy paste code from the RStudio Console
again - you don’t have to do the code formatting in another program -
talking about code is more productive when: - code actually runs: it’s
annoying to fix the code before answering the question - code does not
have to be run: people can often already see the mistake from code and
output without running it themselves - code can easily be run

**In which situations is this helpful?**

  - When asking a question on a forum, Stackoverflow, GitHub, …
  - When asking a colleague or friend about some code issues that you
    have
  - When you want to paste R code in a highlighted and formatted form
    somewhere else

**How to do this?**

Before you get started, first (install) and load the `reprex` package
(Consider adding reprex to your Rstudio profile if you use it more
often. Then you don’t have to load it every time you need it)

``` r
install.packages("reprex")
library(reprex)
```

Assume your code looks like this and you want to know why the output is
strange

``` r
x <- factor("a")
y <- factor("b")
c(x,y)
```

You can simply copy the code from your R script to the clipboard and
then call the `reprex()` function in the console. Then will then see the
output in the Viewer Pane of R Studio or in the browser. What also
happened is, that the content of your clipboard changed. If you now
paste the content of your clipboard somewhere, you will see that it is
formatted as markdown, including the code, but also the console output
that it created. This can now be be pasted into your question e.g. on
Github.

Not all plattforms support this kind of markdown syntax and you can
specify to which platform the output of reprex should be tuned to by
using the `venue` argument.

Those are some of the options:

``` r
# GitHub (default) (this is also good for Discord, you only have to remove the whitespace between 
# the backticks and the r)
# you can also include your session info with si = TRUE
reprex(mean(rnorm(100)),
       venue = "gh",
       si = TRUE)

# Stack Overflow (this is also not bad for Discord)
reprex(mean(rnorm(100)),
       venue = "so")

# commented R script (good for email or slack)
reprex(mean(rnorm(100)),
       venue = "r")

# raw html
reprex(mean(rnorm(100)),
       venue = "html")

# as an rtf (experimental, so far only really works on mac because you need the command line
# tool highlight installed)
# but it's perfect to create code snipptes e.g. for powerpoint etc
# you can exclude the advertisment for reprex with advertise = F
# see also here if you want to use it (on Mac) https://reprex.tidyverse.org/articles/articles/rtf.html
reprex(mean(rnorm(100)),
       venue = "rtf",
       advertise = FALSE
       )
```

If the code you want to talk about includes figures reprex is even more
useful. Assume your code looks like this:

``` r
library(ggplot2)

ggplot(cars, aes(x=dist, y=speed)) + 
  geom_point() + 
  geom_smooth(method = "lm")
```

If you now copy this code to the clipboard, call `reprex()` and paste
it, you will see that the image was added to the markdown output. You
can now post this somewhere and the image will already be included. No
need to add a png, make a screenshot or let people you want help from
run the code themselves to see the output.

You can also provide the example directly as an input argument to
`reprex()` without copying to the clipboard before, e.g.

``` r
reprex({
  x <- rnorm(100)
  y <- rnorm(100)
  cor(x,y)
})
```

If you now call this, your rendered reprex will be on your clipboard and
can be pasted somewhere.

##### So which setup should be chosen for the discussion forum in Blackboard?

Unfortunately, neither the blackboard forum nor the Webex meetings chat
does support markdown formatting. If you use the forum, Webex chat or
Email to share your code I therefore suggest to use `venue = "r"`. This
does not support syntax highlighting and does not include plots but it
ensures that all the output of your code is included.

So a concrete examples would be:

``` r
# This includes the session info and does not show the rendered reprex locally 
reprex(venue="r",show=FALSE, si=TRUE)
```

If you want to include a plot in your reproducible example, I suggest
you use `venu = "html`. Like this, a link to the image is included and
is shown below your code in the forum. In the blackboard forum, you can
include html code by clicking on the little `HTML button` in the editor.
If you don’t see this button, you have to expand your toolbar, by
clicking on the two arrows on the right. If you click on the HTML
button, a window opens, where your post is shown in html format. Your
can just past your reproducible example in there after inserting a new
line.

##### Addins

If you install the reprex package, you will find two Addins (in the top
row of RStudio, right below Help). There is the addin `Reprex
selection`. If you click this, the code that is currently highlighted by
your mouse will be turned into a reprex. You can also bind this to a
keyboard shortcut then you neither have to click this button nor call a
function to create a reprex (under `Tools -> Modify Keyboard
Shortcuts`). You can also highlight code and then use the Addin `Render
reprex` which lets you specify source of the reprex, target venue etc.

#### The other way around with `reprex_clean()`

If you copy some code e.g. from Stack Overflow and paste it into your R
session to run it, you can do it the other way around. Copy the code
(including comments of the answer) to the clipboard and run
`reprex_clean()`. Now you can paste the clean code into your R-Script.

## 4\. Some words on code style

If you share your code with others, it’s important that it is formatted
in a readable way following good practice standards. There are different
standards around, and this is not the place to talk about them. I just
want to note, that there is a R package called `styler` which can apply
different code style standards to your code.

It provides functions to style a section of your code, a whole file or
even an entire directory. I suggest you install and have a look at the
package with

``` r
install.packages("styler")
library(styler)
?`styler-package`
```

When you installed the package, there is also a addin that you can use
to format your code. You can select the code you want to style with the
mouse, got to `Addins->Style Selection` and voilà, your code is styled
nicely. By default, style uses the style guide of the tidyverse (see
[here](https://style.tidyverse.org/) for more info) which is a pretty
common and well thought through standard. So you can just leave it like
that.

### Use styler on your reprex

If you don’t want to style the code in your script, you should
definitely consider styling the reproducible example that you provide.
Fortunately, there is an argument `style` that you can pass into the
reprex function that does that for you.

``` r
reprex(venue="r", show=FALSE, si=TRUE, style=TRUE)
#> No input provided and clipboard is not available.
#> Rendering reprex...
```

Like that, the reprex on your clipboard will be styled according to the
tidyverse style guide.

## Further ressources

  - more on how to make great reproducible examples in R
    [here](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example)
  - great into to the `reprex` package by Jenny Bryan in \[this
    video\](video\](<https://community.rstudio.com/t/video-reproducible-examples-and-the-reprex-package/14732>)
  - Github repository of the [`styler`
    package](https://github.com/r-lib/styler)