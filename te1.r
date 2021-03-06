library(copent) # copula entropy
library(CondIndTests) # kernel-based CI test
library(cdcsis) # conditional distance correlation

prsa2010data = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")
# id: 6(PM2.5), 7(Dew Point), 8(Temperature), 9(Pressure), 11(Cumulative Wind Speed)
idx = c(6,9)
data = prsa2010data[2200:2700, idx]

te1 = 0
kci1 = 0
cdc1 = 0
for (lag in 1:24){
  pm25a = data[1:(501-lag),1]
  pm25b = data[(lag+1):501,1]
  v1 = data[1:(501-lag),2]
  data1 = cbind(pm25a, pm25b, v1)
  # estimating transfer entropy via copula entropy
  te1[lag] = copent(data1) - copent(data1[,c(1,2)]) - copent(data1[,c(1,3)]) 
  kci1[lag] = KCI(pm25b,v1,pm25a)$testStatistic
  cdc1[lag] = cdcor(pm25b,v1,pm25a)
}

x11()
plot(te1, xlab = "lag (hours)", ylab = "Transfer Entropy", main = "Pressure")
lines(te1)
x11()
plot(kci1, xlab = "lag (hours)", ylab = "KCI", main = "Pressure")
lines(kci1)
x11()
cdc1 = unlist(cdc1)
plot(cdc1, xlab = "lag (hours)", ylab = "CDC", main = "Pressure")
lines(cdc1)
