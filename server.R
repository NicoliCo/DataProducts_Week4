

library(shiny)

library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    fit <- lm(mpg ~ cyl  + wt, mtcars)
    newdata <- reactive({data.frame(cyl=input$cyl,wt=(input$wt/1000))})
    mpgPrediction <- reactive({predict(fit,newdata())})
    output$mpgPrediction <- renderPrint({cat(mpgPrediction())})
    output$wtInput <- renderPrint({cat(input$wt)})
    output$cylInput <- renderPrint({cat(input$cyl)})

    output$mpgPlot <- renderPlot({

    ggplot(data=mtcars) +
            geom_point(aes(x=wt*1000,y=mpg,color=factor(cyl),size=factor(cyl))) +
            geom_point(aes(x=input$wt,y=mpgPrediction(),color="Your Car",size="Your Car")) +
            labs(x="Weight (pounds)", y="Miles per Gallon") +
            scale_colour_manual(name="", values = c("4"="blue", "6"="red", "8"="green",
                                           "Your Car"="black")) +
            scale_size_manual(name = "",  values = c("4"=2, "6"=2, "8"=2, "Your Car"=6)) +
            theme_grey(base_size = 18)
  })


})
