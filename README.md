# Mortgage Document Classifier
## Overview
This application analyzes the input document data and classifies it to respective mortgage document. It is a text analysis model which is designed to classify amongst the 14 classes namely BILL, BINDER, POLICY CHANGE etc. The algorithm used to train the model is Support Vector Machines. The text data that this model accepts can be in the form of tokenized version of the original document (a3b334c6eefd be95012ebf2b ... 41d67080e078 ff1c26ea0b6f 3397db22bc41). The model is trained using R and the web application is built using 'shiny', a library in R to design web application for R scripts.

## Source Files:
### doc_classification_model.R
This R script contains the preprocessing of the data and training of the SVM model.

### ui.R
This R script contains the User interface of the web application.

### server.R
This R script contains the server side of the web application. It accepts the input from the UI, processes it to shoot it into the same vector space as used to train the model. Finally, predicts the document type and returns the result to UI.
