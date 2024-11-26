# Load the haven package
library(haven)
library(tidyverse)

# Read the .dta file
data <- read_dta("/Users/zhuliang/Projects/eco324_ps3/blundell_bond_2000_production_function.dta")

# View the first few rows of the data
head(data)

# take the log of the variables
data <- data %>% 
  mutate(log_sales = log(sales),
         log_capital = log(capital),
         log_labor = log(labor))

# regress with time fixed effects on year by plm
library(plm)
# set the data as pdata.frame, and set the index as "firm" and "year"
data <- pdata.frame(data, index = c("id", "year")) # the first one is id, the second one is time variable
pdim(data) # check the dimension of the data
# regress with time fixed effects
reg1 <- plm(log_sales ~ log_capital + log_labor, data = data, model = "within", effect = "time")
# report summary
summary(reg1)

# now test the approach which creats the year dummy variables and do ols
data <- data %>% 
  mutate(year = as.factor(year))
reg2 <- lm(log_sales ~ log_capital + log_labor + year, data = data)
summary(reg2)

# they should be the same or very close, since the time fixed effects are the same as year dummy variables
# however, setting the id and time index is more efficient and convenient
# as the package will automatically take care of the fixed effects
# and will not print out the year dummy variables

