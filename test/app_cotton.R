library(tidyverse)
library(shiny)

weather <- read.csv("test/weather_monthsum.csv")

ui <- fluidPage(
  
  #Title
  titlePanel("Cotton EDA"),
  
  #Sidebar with a slider
  sidebarLayout(
    sidebarPanel(
      varSelectInput("variable",
                     "Variable:",
                     weather
                     )
      
    ),
    mainPanel(
      plotOutput("Plot")
    )
  )
  
  
)

server <- function(input, output) {
  output$Plot <- renderPlot({
    ggplot(data = weather,
           aes(x = !!sym(input$variable))) +
      geom_density()
  }
  )
  
}
  
  
shinyApp(ui, server)
  
  
  
  
  
  
  