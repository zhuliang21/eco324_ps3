# Problem Set #3

The datafile `blundell_bond_2000_production.dta` contains annual information on sales, labor, and capital for 509 firms for the period 1982-1989 (8 years). Consider a Cobb-Douglas production function in terms of labor and capital. Use this dataset to implement the following estimation and hypothesis tests. Provide the code and the table of estimation results.

## Question 1

(a) OLS with time dummies.

Hint: The regression model is 
$$ y_{it} = \alpha_0 + \alpha_L l_{it} + \alpha_K k_{it} + \gamma_t + u_{it} $$
where $y_{it}$ is the log of sales, $l_{it}$ is the log of labor, $k_{it}$ is the log of capital, and $\gamma_t$ are time dummies. Before running the regression, you need to do the transformation of the variables into logs. Then, you need to specify the time dummies and run the regression with the time dummies.

(b) Test the null hypothesis $\alpha_L = \alpha_K = 1$. Comment on the results.

Hint: You can use the Wald test. In Stata, you can use the `test` command after running the regression. In R, you can use the `waldtest` function.
This hypothesis is about the returns to scale.
You may also think about the endogeneity of correlation between the firm fixed effects and the regressors.

## Question 2

(a) Fixed effects estimation with time dummies.

Hint: Fixed effects refers the firm fixed effects.
The regression model is
$$ y_{it} = \alpha_0 + \alpha_L l_{it} + \alpha_K k_{it} + \gamma_t + \eta_i + u_{it} $$
where $\eta_i$ are firm fixed effects. You can use the `plm` package in R to estimate this model, or command `xtreg` in Stata.

(b) Test the null hypothesis of no time-invariant unobserved heterogeneity: $\eta_i = 0$ for every firm $i$. Comment on the results.

Hint: Here this null hypothesis is about the presence of firm fixed effects. i.e. $\eta_i = 0 \quad \forall i$.
To test this hypothesis, you can use the F-test from the fixed effects regression. You may also think about the endogeneity of correlation between the firm fixed effects and the regressors.

## Question 3

(a) Arellano-Bond system estimator with time dummies and non-seriable correlated transitory shocks. Comment on the results.

(b) Arellano-Bond system estimator with time dummies and AR(1) transitory shock.
Comment the results.

Hint: The Arellano-Bond system estimator is a GMM estimator that uses lagged levels as instruments for the first-differenced equation. You can use the `plm` package in R to estimate this model, or command `xtabond2` in Stata.

To install `xtabond2` in Stata, you can use the following command:

```stata
ssc install xtabond2
```

In R, you can use the `plm` package to estimate the Arellano-Bond system estimator, with command `pgmm`.

## Question 4

(a) Based on the previous results, select your preferred estimates of the production function. Explain your choice.

Hint: Here it is not so important which estimator you choose, but the arguments you use to select that estimator.

(b) For this question, your favorite estimates according to your answer to Q4 (a), and
log-TFPs for year 1989. Obtain the median, the percentile 5, and the percentile 95
in the distribution of log-TFP. Suppose that all the firms operate in the same input
markets and $W_L = W_K = 1$. Present a figure with three marginal cost functions (i.e.,
output $Y$ in the horizontal axis and marginal cost MC in the vertical axis) for the rms
with median, percentile 5, and percentile 95 TFPs, respectively. Comment the results.

Hint: the $W_L$ is the price for labor, same as $w$; The $W_K$ is the price for capital, same as $r$.
You need to **calculate** the estimated marginal cost based on the estimation of parameters inlcuding $\alpha_L$, $\alpha_K$, $A$, and the data of $Y$ by the formula of marginal cost that drives from the Cobb-Douglas production function. Notice the transformation of the variables from logs to original levels.
Then plot a graph where the horizontal axis is the output $Y$ and the vertical axis is the marginal cost $MC$. You need to plot three lines, one for each of the median, the percentile 5, and the percentile 95 TFPs.