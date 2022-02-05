from copent import transent, ci
import knncmi as k
from pycit import citest
from pandas import read_csv, DataFrame
import numpy as np
import matplotlib.pyplot as plt

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv"
prsa2010 = read_csv(url)
# index: 5(PM2.5),6(Dew Point),7(Temperature),8(Pressure),10(Cumulative Wind Speed)
data = prsa2010.iloc[2200:2700,[5,8]].values

te = np.zeros(24)
cmi1 = np.zeros(24)
ci1 = np.zeros(24)
for lag in range(1,25):
	x1 = data[0:(500-lag),0]
	x2 = data[lag:500,0]
	y = data[0:(500-lag),1]
	df = DataFrame(np.vstack((x2,y,x1)).T, columns = ['x2','y','x1'])
	
	te[lag-1] = ci(x2,y,x1)
	# te[lag-1] = transent(data[:,0],data[:,1],lag)
	cmi1[lag-1] = k.cmi(['x2'], ['y'], ['x1'], 3, df)
	ci1[lag-1] = citest(x2, y, x1, test_args={'statistic': 'ksg_mi'})
	
	str = "lag : %d; TE : %f; CMI : %f; CI : %f" %(lag,te[lag-1],cmi1[lag-1],ci1[lag-1])
	print(str)
	
plt.plot(te,'g',label = 'copent')
plt.plot(cmi1,'r',label = 'knncmi')
plt.plot(ci1,'b', label = 'pycit')
plt.title("Pressure on PM2.5")
plt.xlabel('lag(hours)')
pos = np.array([4,9,14,19])
plt.xticks(pos,pos+1)
plt.ylabel('Transfer Entropy')
plt.legend()
plt.show()		
