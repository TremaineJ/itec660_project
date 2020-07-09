library(readr)
library(stargazer)

data <- read.csv("full_data_20200707.csv")

#- Model using all variables in data set except Title
prob_enroll<- glm(app.enroll ~ age + undergrad.gpa + grad.gpa + gre.quant + gre.verbal + prospect.score, 
                 family = binomial(link="logit"),
                 data=data)

summary(prob_enroll)

stargazer(prob_mvWin, 
          type="text", 
          intercept.bottom = FALSE, 
          report = 'vcp*', 
          digits=3)

#- Re-Run on just variables that were significant
prob_mvWin <- glm(Winner ~ OscarNominations + GoldenGlobeWins,
                  family = binomial(link="logit"),  
                  data=movies)

summary(prob_mvWin)

stargazer(prob_mvWin, 
          type="text", 
          intercept.bottom = FALSE, 
          report = 'vcp*', 
          digits=3)

#- Just coeff
pMvWin_coeff <- as.data.frame(prob_mvWin$coefficients)