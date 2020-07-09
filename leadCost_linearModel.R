library(readr)
library(stargazer)
library(dplyr)

#import data file
data <- read.csv("full_data_20200707.csv")

# get data where money was spent on lead
lm.data <- filter(data, lead.cost > 0)

# run linear regression model
lm.leadCost <- lm(lead.cost ~ gender + age + prospect.score + grad.gpa + undergrad.gpa + gre.quant + gre.verbal + ed.level, data=lm.data)

#view lm model
summary(lm.leadCost)

stargazer(lm.leadCost, 
          type="text", 
          intercept.bottom = FALSE, 
          report = 'vcp*', 
          digits=3)
