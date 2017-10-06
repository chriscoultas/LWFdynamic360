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
  titlePanel("Leadership Worth Following Dynamic 360-Degree Feedback App"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("CRMGDinput", "Enter CRMGD rating", min = 2, max = 6, value = 3.8, step=.01),
       sliderInput("CCIinput1", "Enter 1st CCI rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("CCIinput2", "Enter 2nd CCI rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("CPAinput", "Enter CPA rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("CPRinput", "Enter CPR rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("CLPGinput1", "Enter 1st CLPG rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("CLPGinput2", "Enter 2nd CLPG rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("PIEinput", "Enter PIE rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("HGFinput1", "Enter 1st HGF rating", min = 2, max = 6,  value = 3.8, step=.01),
       sliderInput("HGFinput2", "Enter 2nd HGF rating", min = 2, max = 6,  value = 3.8, step=.01)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot"),
       plotOutput("plot2")
    )
  )
))
