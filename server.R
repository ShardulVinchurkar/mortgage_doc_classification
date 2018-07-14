library(shiny)

shinyServer(function(input, output) {
  
  library(e1071)
  library(tm)
  library(SnowballC)
  library(caret)
  
  # FUnction that will preprocess the new data, transfer it to the same vector space as that of the trained data
  # and predict the document type using the model generated in doc_classification_model
  result.string <- function(new.input){
    
    # Processing of incoming/new data
    test.corpus <- Corpus(VectorSource(new.input))
    test.corpus <- tm_map(test.corpus, stemDocument)
    test.dtm <- DocumentTermMatrix(test.corpus, control = list(dictionary = Terms(dtm)))
    test.dtm.matrix <- as.matrix(test.dtm)
    test.dtm.df <- as.data.frame(test.dtm.matrix)
    
    # predicting the results for new data
    result <- predict(classifier.model, test.dtm.df)
    return(result)
  }
  
  # Get output and store it out.string
  output$out.string <- renderText({
    
    input$submit # flag to control the reactive nature of textInput
    
    isolate(
      paste("Prediction: ", result.string(input$input.string))
    )
  })
}
)