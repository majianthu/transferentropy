from copent import copent
from pandas import read_csv
import numpy as np
import matplotlib.pyplot as plt

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv"
prsa2010 = read_csv(url)
# index: 5(PM2.5),6(Dew Point),7(Temperature),8(Pressure),10(Cumulative Wind Speed)
data = prsa2010.iloc[2200:2700,[5,8]].values

te = np.zeros(24)
for lag in range(1,25):
	pm25a = data[0:(500-lag),0]
	pm25b = data[lag:500,0]
	cause = data[0:(500-lag),1]
	data123 = np.vstack((pm25a,pm25b,cause)).T
	data12 = np.vstack((pm25a,pm25b)).T
	data13 = np.vstack((pm25a,cause)).T
	# estimating transfer entropy
	te[lag-1] = copent(data123) - copent(data12) - copent(data13)
	str = "TE from pressure to PM2.5 at %d hours lag : %f" %(lag,te[lag-1])
	print(str)
	
plt.plot(te)
plt.title("Pressure on PM2.5")
plt.xlabel('lag(hours)')
pos = np.array([4,9,14,19])
plt.xticks(pos,pos+1)
plt.ylabel('Transfer Entropy')
plt.show()
	
