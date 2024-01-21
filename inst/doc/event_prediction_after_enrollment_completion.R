## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eventPred)

## -----------------------------------------------------------------------------
set.seed(2000)

pred <- getPrediction(
  df = interimData2,
  to_predict = "event only",
  target_d = 200,
  event_model = "weibull",
  dropout_model = "exponential",
  pilevel = 0.90, 
  nyears = 1,
  nreps = 500)

