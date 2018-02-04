#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Fuel Efficiency Predictor"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        p("This Shiny app uses the mtcars data set. It will predict",
          "the fuel efficiency (in miles per gallon) for your car.",
          "Just enter a vehicle weight and the number of cylinders."),

        sliderInput("wt",
                    "Vehicle Weight (pounds):",
                    min = 1500,
                    max = 5500,
                    step = 100,
                    value = 3500),

       sliderInput("cyl",
                   "Number of Cylinders:",
                   min = 4,
                   max = 8,
                   step = 2,
                   value = 6)
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("mpgPlot"),
       h3('Prediction Results'),
       h4('You chose a vehicle weight of:'),
       verbatimTextOutput("wtInput"),
       h4('with this many cylinders:'),
       verbatimTextOutput("cylInput"),
       h4('We predict the vehicle will get this many mpg:'),
       verbatimTextOutput("mpgPrediction")
    )
  )
))
