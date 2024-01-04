#instalacja i użycie bibliotek neuralnet
install.packages("neuralnet")
library(neuralnet)
#stworzenie danych treningowych
x = as.data.frame(runif(100, min=1, max=100))
y = log(x^2)
trainingdata = cbind(x,y)
colnames(trainingdata) = c("wej","wyj")
print (trainingdata)
#nauczanie sieci neuronowej
net.log = neuralnet(wyj~wej, trainingdata, hidden=c(4,3), threshold=0.01)
#wyświetlenie sieci neuronowej
print (net.log)
plot (net.log)
#testowanie
testdata = as.data.frame(runif(300, min=1, max=100))
net.results = compute(net.log, testdata)
print (net.results$net.result)
cleanoutput = cbind (testdata, log(testdata^2), as.data.frame(net.results$net.result))
colnames (cleanoutput) <- c("Wej","Wyj log x^2", "Wyj z sieci neuronowej")
print (cleanoutput)
