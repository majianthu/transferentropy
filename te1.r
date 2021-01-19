library(copent)
prsa2010data = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")
# id: 6(PM2.5), 7(Dew Point), 8(Temperature), 9(Pressure), 11(Cumulative Wind Speed)
idx = c(6,9)
data = prsa2010data[2200:2700, idx]
telag = 0
for (lag in 1:24){
  pm25a = data[1:(501-lag),1]
  pm25b = data[(lag+1):501,1]
  v1 = data[1:(501-lag),2]
  data1 = cbind(pm25a, pm25b, v1)
  # estimating transfer entropy via copula entropy
  telag[lag] = copent(data1) - copent(data1[,c(1,2)]) - copent(data1[,c(1,3)]) 
}
x11()
plot(telag, xlab = "lag (hours)", ylab = "Transfer Entropy", main = "Pressure")
lines(telag)
