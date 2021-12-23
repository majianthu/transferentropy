# Estimating Transfer Entropy via Copula Entropy
This is the code for the preprint paper "Estimating Transfer Entropy via Copula Entropy" which available at [here](https://arxiv.org/abs/1910.04375). Transfer Entropy is estimated via estimating three Copula Entropy terms. Estimating copula entropy is easily done with the R package 'copent' avaible at [here](https://github.com/majianthu/copent) and on the [CRAN](https://cran.r-project.org/package=copent), or its counterpart in Python available at [here](https://github.com/majianthu/pycopent) and on the [PyPI](https://pypi.org/project/copent). The method is demonstrated with the UCI Beijing PM2.5 data which is publicly available at [here](http://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data). The following CI measures are compared in the experiment:
* Transfer Entropy via Copula Entropy (TE);
* Conditional Distance Correlation (CDC);
* Kernel-based Conditional Independence (KCI);
* COnditional DEpendence Coefficient (CODEC);
* Generalised Covariance Measure (GCM);
* Kernel Partial Correlation (KPC);
* Partial Correlation (pcor).
