
# Predicting against the entire test data
prediction <- predict(classifier.model, testing.set)

# Generating the confusion matrix
confusion <- table(prediction = prediction, actual = testing.set$document.label)

# Computing the accuracy
accuracy <- sum(diag(confusion))/sum(confusion)
accuracy