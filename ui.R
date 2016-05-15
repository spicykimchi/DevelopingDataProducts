library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Singapore Transport Ulitilization"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("type", "Choose a Transport Type:", 
                  choices = c("Bus", "MRT", "LRT", "Taxi")),
      
      sliderInput("years",
                  "Years:",
                  min = 1995,
                  max = 2016,
                  value = c(1995,2016))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
  
      plotOutput("distPlot"),
      tableOutput("view")
      
    )
  )
))