# Estimating Transfer Entropy via Copula Entropy
This is the code for the preprint paper "Estimating Transfer Entropy via Copula Entropy" which available at [here](https://arxiv.org/abs/1910.04375). Transfer Entropy is estimated via estimating three Copula Entropy terms. Estimating copula entropy is easily done with the R package '**copent**' avaible at [here](https://github.com/majianthu/copent) and on the [CRAN](https://cran.r-project.org/package=copent), or its counterpart in Python available at [here](https://github.com/majianthu/pycopent) and on the [PyPI](https://pypi.org/project/copent). The method is demonstrated with the UCI Beijing PM2.5 data which is publicly available at [here](http://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data). The following CI measures are compared in the experiment:
* Transfer Entropy via Copula Entropy (TE) [1];
* Conditional Distance Correlation (CDC) [2];
* Kernel-based Conditional Independence (KCI) [3];
* COnditional DEpendence Coefficient (CODEC) [4];
* Generalised Covariance Measure (GCM) [5];
* Kernel Partial Correlation (KPC) [6];
* Partial Correlation (pcor).

## References
1. Ma, J. Estimating Transfer Entropy via Copula Entropy. arXiv preprint arXiv:1910.04375, 2019.
2. Wang, X.; Pan, W.; Hu, W.; Tian, Y. & Zhang, H. Conditional distance correlation. Journal of the American Statistical Association, 2015, 110, 1726-1734.
3. Zhang, K.; Peters, J.; Janzing, D. & Schölkopf, B. Kernel-based conditional independence test and application in causal discovery. Uncertainty in Artificial Intelligence, 2011, 804-813.
4. Azadkia, M. & Chatterjee, S. A simple measure of conditional dependence. arXiv preprint arXiv:1910.12327, 2019.
5. Shah, R. D. & Peters, J. The hardness of conditional independence testing and the generalised covariance measure. Annals of Statistics, 2020, 48, 1514-1538.
6. Huang, Z.; Deb, N. & Sen, B. Kernel Partial Correlation Coefficient -- a Measure of Conditional Dependence. arXiv preprint arXiv:2012.14804, 2020.
