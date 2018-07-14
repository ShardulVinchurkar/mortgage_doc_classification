
library(shiny)

shinyUI(fluidPage(
  headerPanel("Document Classifier"), # Title
  
  # Inputs window
  sidebarPanel(
    textInput(inputId = 'input.string', "Please enter the document data here"),
    actionButton(inputId = "submit", "Submit text") # Helps control the reactive nature of textInput
  ),
  
  mainPanel(
    textOutput("out.string")) # Output screen
  )
)

