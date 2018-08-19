Course Project: Shiny Application and Reproducible Pitch
========================================================
author: René Drost
date: 19 augustus 2018
autosize: true

Overview
========================================================
This application has been developed for the Coursera Data Science course. In the final week of the course Developing Data Products I had to develop a Shiny app.

This Shiny app is using the standard mtcars dataset. It is created to play around
with the mtcars dataset and fitted lineair models.


How to use the application
========================================================
With the application the user can do the following things:

- Choose an dependent variable.
- Choose one or more independent variables.
  + If you happen to choose the same dependent and independent variable, then the independent variable will be left out.

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
## Source code can be found on github:
- https://github.com/renedrost/Shiny-Application-and-Reproducible-Pitch

## The generated pitch (you are reading now) can be found on RPubs:
- http://rpubs.com/rened/shiny_app_pitch

## Shiny app can be found on Shinyapp.io:
- https://rened.shinyapps.io/mtcarsexploration/

