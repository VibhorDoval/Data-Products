#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(bslib)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = bs_theme(version = 4, bootswatch = "cerulean"),
  # Application title
  titlePanel("PREDICTION OF DIAMOND PRICE"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      helpText("This application predicts the price of a diamond based on its characteristics."),
      h3(helpText("Select:")),
      sliderInput("car", label = h4("Carats"),
                  min = 0, max = 4,
                  value = 0.1, step = 0.1),
     selectInput("cut", label = h4("Cut"), 
                  choices = list("Unknown" = "*", "Fair" = "Fair", "Good" = "^Good",
                                 "Very Good" = "Very Good", "Premium" = "Premium",
                                 "Ideal" = "Ideal")),
      selectInput("col", label = h4("Color"), 
                  choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                 "F" = "F", "G" ="G",
                                 "H" = "H", "I" = "I",
                                 "J" = "J")),
      selectInput("clar", label = h4("Clarity"), 
                  choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                 "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                 "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" ))
    ),
    
    # Show a plot with diamonds and regression line
    mainPanel(
      plotOutput("distPlot"),
      h4("Predicted value of this diamond is:"),
      h3(textOutput("result"))
    )
  )
))
