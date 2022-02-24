library(copent) # transfer entropy (TE)
library(CondIndTests) # kernel-based CI test (KCI)
library(RCIT) # Randomized conditional Correlation Test (RCoT)
library(cdcsis) # conditional distance correlation (CDC)
library(FOCI) # conditional dependence coefficient (CODEC)
library(GeneralisedCovarianceMeasure) # Generalised Covariance Measure (GCM)
library(KPC) # Kernel Partial Correlation (KPC)
library(ppcor) # Partial Correlation (pcor)

prsa2010data = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv")
# id: 6(PM2.5), 7(Dew Point), 8(Temperature), 9(Pressure), 11(Cumulative Wind Speed)
idx = c(6,9)
data = prsa2010data[2200:2700, idx]

te1 = 0
kci1 = 0
rcot1 = 0
cdc1 = 0
codec1 = 0
gcm1 = 0
kpc1 = 0
pcor1 = 0
for (lag in 1:24){
  pm25a = data[1:(501-lag),1]
  pm25b = data[(lag+1):501,1]
  v1 = data[1:(501-lag),2]
  
  # conditional independence test with copula entropy
  te1[lag] = ci(pm25b,v1,pm25a)  
  # or estimating transfer entropy directly as below
  # te1[lag] = transent(data[,1],data[,2],lag)
  
  kci1[lag] = KCI(pm25b,v1,pm25a)$testStatistic
  rcot1[lag] = RCIT(pm25b,v1,pm25a)$Sta
  cdc1[lag] = cdcor(pm25b,v1,pm25a)$statistic
  codec1[lag] = codec(pm25b,v1,pm25a)
  gcm1[lag] = gcm.test(pm25b,v1,pm25a)$test.statistic
  kpc1[lag] = KPCRKHS(pm25b,pm25a,v1)
  pcor1[lag] = pcor.test(pm25b,v1,pm25a)$statistic
}

# TE via CE
x11()
plot(te1, xlab = "lag (hours)", ylab = "Transfer Entropy", main = "Pressure")
lines(te1)
# KCI
x11()
plot(kci1, xlab = "lag (hours)", ylab = "KCI", main = "Pressure")
lines(kci1)
# RCoT
x11()
plot(rcot1, xlab = "lag (hours)", ylab = "RCoT", main = "Pressure")
lines(rcot1)
# CDC
x11()
cdc1 = unlist(cdc1)
plot(cdc1, xlab = "lag (hours)", ylab = "CDC", main = "Pressure")
lines(cdc1)
# CODEC
x11()
plot(codec1, xlab = "lag (hours)", ylab = "CODEC", main = "Pressure")
lines(codec1)
# GCM
x11()
plot(gcm1, xlab = "lag (hours)", ylab = "GCM", main = "Pressure")
lines(gcm1)
# KPC
x11()
plot(kpc1, xlab = "lag (hours)", ylab = "KPC", main = "Pressure")
lines(kpc1)
# Partial Correlation
x11()
pcor1 = unlist(pcor1)
plot(pcor1, xlab = "lag (hours)", ylab = "Partial Correlation", main = "Pressure")
lines(pcor1)
