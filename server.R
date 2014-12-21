library(shiny)
deathdata <- read.csv("deathdata.csv", sep = "\t")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$summaryinput <- renderText({
    paste("You have selected the number of deaths occuring", input$deathlocation, ".There were", sum(switch(input$deathlocation, 
      "Outside City Limits" = deathdata[, 2],
      "In Toronto" = deathdata[, 3],
      "In Total" = deathdata[, 2:3])), "deaths in this area.")
  })
  
  output$deathhist <- renderPlot({
    data <- switch(input$deathlocation, 
      "Outside City Limits" = deathdata[, 2],
      "In Toronto" = deathdata[, 3],
      "In Total" = deathdata[, 2:3])
    
  if(input$deathlocation == "In Toronto"){
    barplot(t(data), xlab = "Time", names = deathdata[,1], ylab = "Number of registered deaths", col = "#E6E6E6", beside = TRUE)
  } else {
    barplot(t(data), xlab = "Time", names = deathdata[,1], ylab = "Number of registered deaths", beside = TRUE)
  } 
 })
})