Course Project: Shiny Application and Reproducible Pitch
========================================================
author: René Drost
date: 19 augustus 2018
autosize: true

Overview
========================================================
This Shiny app is using the standard mtcars dataset.

With the application the user can do the following things:

- Choose an dependent variable.
- Choose one or more indpendent variables.

The application will show:

- A residuals plot.
- Summary of the fitted model.


An example of a residual plot
========================================================

```r
fit <- lm(mpg ~ hp + wt, data = mtcars)
plot(fit, which=c(1))
```

![plot of chunk unnamed-chunk-1](pitch shiny app-figure/unnamed-chunk-1-1.png)

Source code
========================================================

![plot of chunk unnamed-chunk-2](pitch shiny app-figure/unnamed-chunk-2-1.png)
