library(copent) # transfer entropy (TE)
library(CondIndTests) # kernel-based CI test (KCI)
library(cdcsis) # conditional distance correlation (CDC)
library(FOCI) # conditional dependence coefficient (CODEC)

prsa2010data = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")
# id: 6(PM2.5), 7(Dew Point), 8(Temperature), 9(Pressure), 11(Cumulative Wind Speed)
idx = c(6,9)
data = prsa2010data[2200:2700, idx]

te1 = 0
kci1 = 0
cdc1 = 0
codec1 = 0
for (lag in 1:24){
  pm25a = data[1:(501-lag),1]
  pm25b = data[(lag+1):501,1]
  v1 = data[1:(501-lag),2]
  # conditional independence test with copula entropy
  te1[lag] = ci(pm25b,v1,pm25a)  
  # or estimating transfer entropy directly as below
  # te1[lag] = transent(data[,1],data[,2],lag)
  
  kci1[lag] = KCI(pm25b,v1,pm25a)$testStatistic
  cdc1[lag] = cdcor(pm25b,v1,pm25a)
  codec1[lag] = codec(pm25b,v1,pm25a)
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
x11()
plot(codec1, xlab = "lag (hours)", ylab = "CODEC", main = "Pressure")
lines(codec1)
