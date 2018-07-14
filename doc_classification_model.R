
library(e1071)
library(tm)
library(SnowballC)
library(caret)


# Reading the csv
mortgage.doc.data <- read.csv("shuffled-full-set-hashed.csv", header = FALSE)

# Assigning the attribute names to the unlabelled data
colnames(mortgage.doc.data) <- c("document.label", "document.cotent")
mortgage.doc.data$document.label <- factor(mortgage.doc.data$document.label)

# Stratified splitting of data
train.split <- createDataPartition(mortgage.doc.data$document.label, times = 1, p = 0.90, list = FALSE)
training.set <- mortgage.doc.data[train.split, ]
testing.set <- mortgage.doc.data[-train.split, ] 

# Building a corpus (a collection of text documents) from the document contents
corpus <- Corpus(VectorSource(training.set$document.cotent))

# Possible stemming of the words
corpus <- tm_map(corpus, stemDocument)

# Creating a document term matrix from the corpus
dtm <- DocumentTermMatrix(corpus)

# Removing sparse terms
sparse <- 0.90
dtm <- removeSparseTerms(dtm, sparse)

# Converting the document term matrix into a data frame
dtm.m <- as.matrix(dtm)
dtm.df <- as.data.frame(dtm.m)

# Adding the label data to the new data frame (prepping for training the model)
dtm.df$document.label <- training.set$document.label


# Training of the model
classifier.model <- svm(document.label ~ ., data = dtm.df)