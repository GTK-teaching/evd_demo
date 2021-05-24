
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Model of student heights across many classrooms"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("sex", "Choose a gender:",
                  choices = c("female","male")),
      sliderInput("mean_height",
                  "Average height:",
                  min = 160,
                  max = 170,
                  value = 165),
      sliderInput("sd_height",
                  "Standard deviation of heights:",
                  min = 1,
                  max = 10,
                  value = 4),
      sliderInput("students",
                  "Students per class:",
                  min = 10,
                  max = 200,
                  value = 50),
      sliderInput("classes",
                  "Number of classes:",
                  min = 10,
                  max = 1000,
                  value = 50),
      selectInput("statistic", "Choose a statistic:",
                  choices = c("none","mean","max","both"))
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
