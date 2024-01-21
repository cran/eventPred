## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eventPred)

## -----------------------------------------------------------------------------
set.seed(2000)

df = interimData2
df$agegrp = as.factor(sample(c(1,2,3), nrow(df), replace = TRUE, 
                             prob = c(0.3, 0.6, 0.1)))

pred <- getPrediction(
  df = df,
  to_predict = "event only",
  target_d = 200,
  event_model = "weibull",
  covariates_event = "agegrp",
  dropout_model = "exponential",
  pilevel = 0.90, 
  nyears = 1,
  nreps = 500)

