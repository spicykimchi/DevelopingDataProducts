
library(shiny)
library(lattice)
require(data.table)
library(stats)
library(sqldf)

data <- fread("data/public-transport-utilisation-average-public-transport-ridership.csv")
head(data)
# data column "year", "type_of_public_transport", "average_ridership"


shinyServer(function(input, output) {

  ## plot chart  
  output$distPlot <- renderPlot({
    subData1 = sqldf(paste('SELECT * FROM data WHERE type_of_public_transport == "',input$type,'"', sep = ""))
    
    xrange=input$years
    yrange=range(data$average_ridership)
   
    plot(xrange, yrange, type="n", xlab="Year",ylab="Average Ridership")     
    lines(subData1$year,subData1$average_ridership, type="o", lty=1, lwd=2, col='pink')
  })
  
  # Show the values using an HTML table
  output$view <- renderTable({
    subData1 = sqldf(paste('SELECT * FROM data WHERE type_of_public_transport == "',input$type,'" AND year >= ', input$years[1], ' AND year <= ', input$years[2], sep = ""))
    names(subData1) <- c("Year","Type of Public Transport","Average Ridership")
    subData1
  })  
})