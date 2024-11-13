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
$$ \frac{p_j - MC_j}{p_j} = \frac{q_j}{\frac{\partial q_j}{\partial p_j} \cdot p_j} = \frac{1}{u} $$

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
$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + u_{it} $$

With the time dummy variables $\gamma_t$, we can estimate the time effects on the production function.

$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + \gamma_t + u_{it} $$

Withe the firm dummy variables $\eta_j$, we can estimate the firm effects on the production function.

$$ y_{it} = \alpha_0 + \alpha_L \cdot l_{it} + \alpha_K \cdot k_{it} + \gamma_t + \eta_i + u_{it} $$

To estimate this model, we can apply transfermation to the data to eliminate the firm effects by subtracting the firm means from the data.

$$ \tilde{y}_{it} = y_{it} - \bar{y}_i $$
$$ \tilde{l}_{it} = l_{it} - \bar{l}_i $$
$$ \tilde{k}_{it} = k_{it} - \bar{k}_i $$
$$ \tilde{u}_{it} = u_{it} - \bar{u}_i $$

Then we can estimate the model:
$$ \tilde{y}_{it} = \alpha_0 + \alpha_L \cdot \tilde{l}_{it} + \alpha_K \cdot \tilde{k}_{it} + \gamma_t + \tilde{u}_{it} $$

Then we can just apply OLS regression with time dummies. You need to do the transformation on the data before running the regression.

#### Testing for the firm effects

To test for the firm effects, we can use the F-test to compare the model with and without firm effects. The null hypothesis is that the firm effects are zero, and the alternative hypothesis is that the firm effects are non-zero. If the F-test is significant, we reject the null hypothesis and conclude that the firm effects are present in the model.

### Time Series

The time series analysis can be used to study the trend and seasonality in the data. It helps in understanding the patterns and variations over time, which can be useful for forecasting and decision-making.

The basic process of time series analysis involves:

- AR (AutoRegressive) models
  - AR(1) model: $Y_t = \alpha + \beta \cdot Y_{t-1} + u_t$
  - AR(2) model: $Y_t = \alpha + \beta_1 \cdot Y_{t-1} + \beta_2 \cdot Y_{t-2} + u_t$
- MA (Moving Average) models
  - MA(1) model: $Y_t = \alpha + \beta \cdot u_{t-1} + u_t$
  - MA(2) model: $Y_t = \alpha + \beta_1 \cdot u_{t-1} + \beta_2 \cdot u_{t-2} + u_t$

### Arellano-Bond Estimation

It solve the problem of endogeneity in panel data models by using lagged values of the dependent variable as instruments.

### Cost Function for Cobb-Douglas Production Function

The cost function for the Cobb-Douglas production function can be derived from the production function using the duality between cost and production. The cost function represents the minimum cost of producing a given level of output, subject to the input prices and the production technology.

The cost can be expressed as:
$$ C = w \cdot L + r \cdot K $$

Where: L is the labor input, K is the capital input, w is the wage rate, and r is the rental rate of capital.

Firms minimize the cost of production subject to the production function:
$$ \min_{L,K} w \cdot L + r \cdot K \text{ subject to } Y = A \cdot L^{\alpha_L} \cdot K^{\alpha_K} $$

The cost function can be derived by solving the Lagrangian of the optimization problem.
$$ \mathcal{L} = w \cdot L + r \cdot K + \lambda \cdot (Y - A \cdot L^{\alpha_L} \cdot K^{\alpha_K}) $$

First-order conditions:
$$ \frac{\partial \mathcal{L}}{\partial L} = w - \lambda \cdot \alpha_L \cdot A \cdot L^{\alpha_L-1} \cdot K^{\alpha_K} = 0 $$
$$ \frac{\partial \mathcal{L}}{\partial K} = r - \lambda \cdot \alpha_K \cdot A \cdot L^{\alpha_L} \cdot K^{\alpha_K-1} = 0 $$

Solving these equations, we can derive the optimal input choices for labor and capital, which define the cost function.

From the first-order conditions, we can solve for $\lambda$:
$$ \lambda = \frac{w}{\alpha_L \cdot A \cdot L^{\alpha_L-1} \cdot K^{\alpha_K}} $$
$$ \lambda = \frac{r}{\alpha_K \cdot A \cdot L^{\alpha_L} \cdot K^{\alpha_K-1}} $$

Setting the two expressions for $\lambda$ equal to each other:
$$ \frac{w}{\alpha_L \cdot A \cdot L^{\alpha_L-1} \cdot K^{\alpha_K}} = \frac{r}{\alpha_K \cdot A \cdot L^{\alpha_L} \cdot K^{\alpha_K-1}} $$

Simplifying to find the relationship between $L$ and $K$:
$$ \frac{w}{\alpha_L} \cdot K = \frac{r}{\alpha_K} \cdot L $$

Let $\alpha = \alpha_L + \alpha_K$, then:
$$ Y = A \cdot L^{\alpha_L} \cdot K^{\alpha_K} $$

Substituting $K$ from the relationship back into the production function:
$$ Y = A \cdot L^{\alpha_L} \cdot \left( \frac{r}{\alpha_K w} L \right)^{\alpha_K} = A \cdot \left( \frac{r}{\alpha_K w} \right)^{\alpha_K} \cdot L^{\alpha} $$

Therefore, the **cost function for the Cobb-Douglas production function** is:
$$ C(Y) = \alpha \left(\frac{Y}{A} \right)^\frac{1}{\alpha}\left(\frac{w}{\alpha_L}\right)^\frac{\alpha_L}{\alpha}\left(\frac{r}{\alpha_K} \right)^{\frac{\alpha_K}{\alpha}} $$

And the **marginal cost function** is:
$$ MC(Y) = \frac{\partial C}{\partial Y} = Y^{\left(\frac{1}{\alpha} - 1\right)} \cdot \left(\frac{1}{A}\right)^{\frac{1}{\alpha}} \cdot \left(\frac{w}{\alpha_L}\right)^{\frac{\alpha_L}{\alpha}} \cdot \left(\frac{r}{\alpha_K}\right)^{\frac{\alpha_K}{\alpha}} $$

Note: the cost function and marginal cost function are derived under the **optimal input choices** for labor and capital, which minimize the cost of production for a given level of output.

Based on the marginal cost functions, we can calculate the marginal cost of production and the marginal cost of each product, given the output level and input prices, as well as the parameters of the production function. **Notice:** The parameters get from regression analysis is in the log form, so we need to transform them back to the original form before calculating the marginal cost.
(e.g. $A = e^{\alpha_0}$)