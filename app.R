library(shiny)

## Create some global variables.
vars <- c("Miles per gallon" = "mpg", 
          "Number of cylinders" = "cyl", 
          "Displacement" = "disp", 
          "Horsepower" = "hp", 
          "Rear axle ratio" = "drat", 
          "Weight" = "wt", 
          "1/4 mile time" = "qsec", 
          "Engine (V-shaped, straight)" = "vs", 
          "Transmission (automatic, manual)" = "am", 
          "Number of forward gears" = "gear", 
          "Number of carburators" = "carb")

d_set <- mtcars
d_set$vs <- factor(d_set$vs)
d_set$am <- factor(d_set$am)


ui <- fluidPage(
    # Application title
    titlePanel("Regression on cars"),

    sidebarLayout(
        sidebarPanel(
            strong("How to use this app"),
            br(),
            "This app is using the standard mtcars-dataset.",
            br(),
            "After choosing a independent variable (default is miles per gallon) and 
             one or more independent variables, a residuals-plot and the summary of the
             fitted model will be given.",
            br(),
            br(),
            selectInput("dep_var", "Dependent variable", vars),
            checkboxGroupInput("indep_var", "Independent variable(s)", vars)
        ),
      
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("regPlot"),
            br(),
            verbatimTextOutput("regSummary")
        )
    )
)


server <- function(input, output) {
    ## Determine if there are any independent variables after removing the selected
    ## dependent variable.
    selInd <- reactive({
        indvar <- as.list(input$indep_var)
        depvar <- input$dep_var
        indvar <- indvar[indvar != depvar]
        length(indvar) > 0
    })
    
    ## Create a model with the selected dependent and independent variables.
    fit <- reactive({
        indvar <- as.list(input$indep_var)
        depvar <- input$dep_var
        indvar <- indvar[indvar != depvar]

        if (length(indvar) > 0) {
            selvar <- do.call(paste, c(indvar, sep = " + "))
            formStr <- paste(depvar, selvar, sep = " ~ ")
            expStr <- paste(c("lm(", formStr, ", data = d_set)"), sep = "")
            eval(parse(text = expStr))
        }
    })

    ## Render the residuals-plot.
    output$regPlot <- renderPlot({
        fit <- fit()
        if (selInd()) {
            plot(fit, which=c(1))
        }
    })
   
    ## Render the summary of the model.
    output$regSummary <- renderPrint({
        if (selInd()) {
            summary(fit())
        }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

