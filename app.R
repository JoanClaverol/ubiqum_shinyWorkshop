
# library -----


library(shinydashboard)
library(shiny)


# import ------

data <- read.csv("../../Shiny/Blackwell_Demographic_Data.csv")


# UI ----------

ui <- dashboardPage(

  dashboardHeader(title = "First title app"),
  
  dashboardSidebar(
    menuItem(text = "First menu", tabName = "firstMenu", icon = icon("fas fa-anchor"),
             menuSubItem(text = "Choose the breaks", tabName = "subItem1"),
             sliderInput(inputId = "coolSidebar", label = "Breaks nº:", 0, 100, 50)),
    
    menuItem(text = "Second menu", tabName = "secondMenu", icon = icon("fas fa-anchor")),
    menuItem(text = "Third menu", tabName = "thirdMenu", icon = icon("fas fa-anchor"))
  ),
  
  dashboardBody(
    fluidRow(
      box(plotOutput(outputId = "firstPlot", height = 250))
    )
  )
)


# server ------

server <- function(input, output) {
  output$firstPlot <- renderPlot(
    hist(data$age, breaks = input$coolSidebar )
  )
}

shinyApp(ui, server)