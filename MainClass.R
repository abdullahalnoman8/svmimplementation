data = read.csv(file = "D:/HIS 4th Semester/Lfd/SVM Paper Writing/ClassifyTextWithR/sunnyData.csv", sep =",", header = TRUE)
attach(data)

dtMatrix = create_matrix(data["Text"])

dtMatrix

# Configure the training data
container = create_container(dtMatrix, data$IsSunny, trainSize=1:11, virgin=FALSE)

# train a SVM Model
model = train_model(container, "SVM", kernel="linear", cost=1)

# new data
predictionData = list("sunny sunny sunny rainy rainy", "rainy sunny rainy rainy", "hello", "", "this is another rainy world")

# create a prediction document term matrix
predMatrix = create_matrix(predictionData, originalMatrix=dtMatrix)

# create the corresponding container
predSize = length(predictionData);
predictionContainer = create_container(predMatrix, labels=rep(0,predSize), testSize=1:predSize, virgin=FALSE)

results = classify_model(predictionContainer, model)
results
