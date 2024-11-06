# Review

## PS2 Bertrand Competition

### Profit Function

The profit function for firm j is defined as:
$$ \pi_j = p_j \cdot q_j - MC_j \cdot q_j $$

Where:

- $ p_j $ is the price of the product
- $ q_j $ is the quantity of the product
- $ MC_j $ is the marginal cost of the product

### Maximization and First Order Condition

Firms choose the price $ p_j $ of the product to maximize profit under Bertrand Competition. The first order condition (FOC) for profit maximization is:
$$ \frac{d\pi}{dp_j} = 0 $$
Which simplifies to:
$$ q_j + p_j \cdot \frac{dq_j}{dp_j} - MC_j \cdot \frac{dq_j}{dp_j} = 0 $$

### Lerner Index

The Lerner Index, which measures the markup of price over marginal cost, is given by:
$$ \frac{p_j - MC_j}{p_j} = \frac{q_j}{\frac{\partial q_j}{\partial p_j} \cdot p_j} = \frac{1}{\epsilon} $$

This formula represents the ratio of the price-cost margin to the price itself, which is a standard measure of market power. By assumption on demand, $\frac{\partial q_j}{\partial p_j} = \alpha  \cdot H \cdot s_j \cdot (1 - s_j)$, where $H$ is the market size, $s$ is the market share, so $\alpha \cdot H \cdot s_j \cdot (1 - s_j) = \alpha \cdot q_j \cdot (1-s_j)$.

Then we can express the Lerner Index with the data from the demand estimation:

$$ \frac{1}{\alpha \cdot (1-s_j) \cdot p_j} $$

### Estimating Marginal Costs

The marginal cost $MC_j$for each product in each market and year can be estimated using:
$$ MC_j = p_j - \frac{1}{\alpha(1 - s_j)} $$
where $s_j$ is the market share of product $j$, and $\alpha$ is the parameter from the demand estimation reflecting price sensitivity.

### Recover Marginal Costs Function

A regression analysis can be conducted to estimate the impact of various product characteristics on marginal costs, including horsepower, fuel efficiency, and size dimensions. The results help in understanding the cost structure of production and the influence of product features on costs.

## PS3 Production Function

### Cobb-Douglas Production Function

The Cobb-Douglas production function is a widely used model in economics to represent the relationship between inputs and outputs. It is defined as:
$$ Y = A \cdot L^{\alpha_L} \cdot K^{\alpha_K} $$

Where:

- $Y$ is the output
- $A$ is the total factor productivity
- $L$ is labor input
- $K$ is capital input
- $\alpha$ and $\beta$ are the output elasticities of labor and capital, respectively

This production function does not have a linear relationship between the dependent variable $Y$ and the independent variables $L$ and $K$. So we cannot directly estimate the parameters $\alpha_L$ and $\alpha_K$ using OLS regression.

A nice feature of the Cobb-Douglas production function is that it can be linearized by taking the natural logarithm of both sides:
$$ \ln(Y) = \ln(A) + \alpha_L \cdot \ln(L) + \alpha_K \cdot \ln(K) $$

Then we have a linear relationship between the dependent variable $\ln(Y)$ and the independent variables $\ln(L)$ and $\ln(K)$. We can then run OLS regression to estimate the parameters $\alpha_L$ and $\alpha_K$.

#### CRS: Constant Returns to Scale

If the production function exhibits constant returns to scale (CRS), then the sum of the output elasticities of labor and capital is equal to 1:
$$ \alpha_L + \alpha_K = 1 $$
This implies that the output increases proportionally to the increase in labor and capital inputs.


We can set up the following notation:

- $y = \ln(Y)$
- $l = \ln(L)$
- $k = \ln(K)$
- $\alpha_0 = \ln(A)$

Then the linearized Cobb-Douglas production function can be written as:
$$ y = \alpha_0 + \alpha_L \cdot l + \alpha_K \cdot k $$

We can then add the time and firm notation to the model to the equation, as well as an error term:
$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + \epsilon_{it} $$

With the time dummy variables $\gamma_t$, we can estimate the time effects on the production function.

$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + \gamma_t + \epsilon_{it} $$

Withe the firm dummy variables $\eta_j$, we can estimate the firm effects on the production function.

$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + \gamma_t + \eta_i + \epsilon_{it} $$

### Time Series

The time series analysis can be used to study the trend and seasonality in the data. It helps in understanding the patterns and variations over time, which can be useful for forecasting and decision-making.

The basic process of time series analysis involves:

- AR (AutoRegressive) models
  - AR(1) model: $Y_t = \alpha + \beta \cdot Y_{t-1} + \epsilon_t$
  - AR(2) model: $Y_t = \alpha + \beta_1 \cdot Y_{t-1} + \beta_2 \cdot Y_{t-2} + \epsilon_t$
- MA (Moving Average) models
  - MA(1) model: $Y_t = \alpha + \beta \cdot \epsilon_{t-1} + \epsilon_t$
  - MA(2) model: $Y_t = \alpha + \beta_1 \cdot \epsilon_{t-1} + \beta_2 \cdot \epsilon_{t-2} + \epsilon_t$

### Arellano-Bond Estimation

It solve the problem of endogeneity in panel data models by using lagged values of the dependent variable as instruments.