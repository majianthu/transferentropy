# Estimating Transfer Entropy via Copula Entropy
This is the code for the preprint paper "Estimating Transfer Entropy via Copula Entropy" which available at [here](https://arxiv.org/abs/1910.04375). A non-parametric method for estimating Transfer Entropy via estimating three Copula Entropy terms is proposed in this paper.

The proposed method is implemented in the R and Python package '**copent**', available at 
* R : [here](https://github.com/majianthu/copent) and  [CRAN](https://cran.r-project.org/package=copent), 
* Python : [here](https://github.com/majianthu/pycopent) and [PyPI](https://pypi.org/project/copent). 
 
The method is demonstrated in the experiment with the [UCI Beijing PM2.5 data](http://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data). The following conditional independence measures are compared in the experiment:
* Transfer Entropy via Copula Entropy (TE) [1];
* Conditional Distance Correlation (CDC) [2];
* Kernel-based Conditional Independence (KCI) [3];
* COnditional DEpendence Coefficient (CODEC) [4];
* Generalised Covariance Measure (GCM) [5];
* weighted Generalised Covariance Measure (wGCM) [6];
* Kernel Partial Correlation (KPC) [7];
* Partial Correlation (pcor);
* Randomized conditional Correlation Test (RCoT) [8];
* kNN based Conditional Mutual Information Estimators [9,10];
* Fast Conditional Independence Test (fcit) [11];
* Model-Powered Conditional Independence Test (CCIT) [12];
* Predictive Conditional Independence Testing (PCIT) [13];
* Conditional Kendall's Tau (CKT) [14];
* Conditional Mean Dependence (CMD) [15].

## References
1. Ma, J. Estimating Transfer Entropy via Copula Entropy. arXiv preprint arXiv:1910.04375, 2019.
2. Wang, X.; Pan, W.; Hu, W.; Tian, Y. & Zhang, H. Conditional distance correlation. Journal of the American Statistical Association, 2015, 110, 1726-1734.
3. Zhang, K.; Peters, J.; Janzing, D. & Schölkopf, B. Kernel-based conditional independence test and application in causal discovery. Uncertainty in Artificial Intelligence, 2011, 804-813.
4. Azadkia, M. & Chatterjee, S. A simple measure of conditional dependence. arXiv preprint arXiv:1910.12327, 2019.
5. Shah, R. D. & Peters, J. The hardness of conditional independence testing and the generalised covariance measure. Annals of Statistics, 2020, 48, 1514-1538.
6. Cyrill Scheidegger, Julia Hörrmann, Peter Bühlmann. The Weighted Generalised Covariance Measure. arXiv preprint arXiv:2111.04361, 2021.
7. Huang, Z.; Deb, N. & Sen, B. Kernel Partial Correlation Coefficient -- a Measure of Conditional Dependence. arXiv preprint arXiv:2012.14804, 2020.
8. Strobl, E. V.; Zhang, K. & Visweswaran, S. Approximate Kernel-based Conditional Independence Tests for Fast Non-Parametric Causal Discovery. arXiv preprint arXiv:1702.03877, 2017.
9. Runge, J. (2018). Conditional independence testing based on a nearest-neighbor estimator of conditional mutual information. In AISTATS'18.
10. Octavio César Mesner, Cosma Rohilla Shalizi. Conditional Mutual Information Estimation for Mixed Discrete and Continuous Variables with Nearest Neighbors. arXiv preprint arXiv:1912.03387, 2019.
11. Krzysztof Chalupka, Pietro Perona, Frederick Eberhardt. Fast Conditional Independence Test for Vector Variables with Large Sample Sizes. arXiv preprint arXiv:1804.02747, 2018.
12. Rajat Sen, Ananda Theertha Suresh, Karthikeyan Shanmugam, Alexandros G. Dimakis, Sanjay Shakkottai. Model-Powered Conditional Independence Test. NIPS 2017: 2951-2961.
13. Samuel Burkart, Franz J Király. Predictive Independence Testing, Predictive Conditional Independence Testing, and Predictive Graphical Modelling. arXiv preprint arXiv:1711.05869, 2017.
14. Alexis Derumigny, Jean-David Fermanian. A classification point-of-view about conditional Kendall’s tau. Computational Statistics & Data Analysis, 135, 70-94, 2019.
15. Xiaofeng Shao, Jingsi Zhang. Martingale Difference Correlation and Its Use in High-Dimensional Variable Screening. Journal of the American Statistical Association, 109(507), 1302-1318, 2014.
