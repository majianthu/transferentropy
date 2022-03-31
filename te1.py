from copent import transent, ci
from knncmi import cmi
from causallearn.utils.KCI.KCI import KCI_CInd
from pycit import citest
from fcit import fcit
from CCIT import CCIT
from pcit.IndependenceTest import PCIT  ##  the 'mlxtend' package required
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/00381/PRSA_data_2010.1.1-2014.12.31.csv"
prsa2010 = pd.read_csv(url)
# index: 5(PM2.5),6(Dew Point),7(Temperature),8(Pressure),10(Cumulative Wind Speed)
varname = ["","","","","","PM2.5","Dew Point","Temperature","Pressure","","CWS"]
eid = 5 # effect
cid = 8 # cause
data = prsa2010.iloc[2200:2700,[eid,cid]].values

te1 = np.zeros(24)
cmi1 = np.zeros(24)
kci1 = np.zeros(24)
ci1 = np.zeros(24)
fcit1 = np.zeros(24)
ccit1 = np.zeros(24)
pcit1 = np.zeros(24)
for lag in range(1,25):
	x1 = data[0:(500-lag),0]
	x2 = data[lag:500,0]
	y = data[0:(500-lag),1]
	
	## copent
	te1[lag-1] = ci(x2,y,x1)
	# te1[lag-1] = transent(data[:,0],data[:,1],lag)
	## knncmi
	df = pd.DataFrame(np.vstack((x2,y,x1)).T, columns = ['x2','y','x1'])
	cmi1[lag-1] = cmi(['x2'], ['y'], ['x1'], 3, df)	
	## pycit
	ci1[lag-1] = citest(x2, y, x1, test_args={'statistic': 'ksg_mi'})
	## fcit
	len1 = len(x1)
	x2a = np.reshape(x2,[len1,1])
	ya = np.reshape(y,[len1,1])
	x1a = np.reshape(x1,[len1,1])
	fcit1[lag-1] = fcit.test(x2a,ya,x1a)
	## causal-learn
	kci_cind = KCI_CInd()
	kci1[lag-1],_ = kci_cind.compute_pvalue(x2a,ya,x1a)
	## CCIT
	ccit1[lag-1] = CCIT.CCIT(x2a,ya,x1a)
	## pcit
	p,tmp,tmp = PCIT(x2a,ya,z = x1a)
	pcit1[lag-1] = p[0]
	
	str = "lag: %d; TE:%.3f; CMI:%.3f; KCI:%.3f; CI:%.3f; fcit:%.3f; ccit:%.3f; pcit:%.3f" %(lag,te1[lag-1],cmi1[lag-1],kci1[lag-1],ci1[lag-1],fcit1[lag-1],ccit1[lag-1],pcit1[lag-1])
	print(str)
	
plt.plot(te1,'g',label = 'copent')
plt.plot(cmi1,'r',label = 'knncmi')
plt.plot(kci1,'c', label = 'causal-learn')
plt.plot(ci1,'b', label = 'pycit')
plt.plot(fcit1,'y', label = 'fcit')
plt.plot(ccit1,'m', label = 'ccit')
plt.plot(pcit1,'k', label = 'pcit')
title = "%s on %s" % (varname[cid],varname[eid])
plt.title(title)
plt.xlabel('lag(hours)')
pos = np.array([4,9,14,19])
plt.xticks(pos,pos+1)
plt.ylabel('Causality')
plt.legend()
plt.show()		
