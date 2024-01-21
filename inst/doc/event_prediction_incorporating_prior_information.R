## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eventPred)

## -----------------------------------------------------------------------------
set.seed(2000)

dropout_prior <- list(
  model = "piecewise exponential",
  theta = c(-8, -9),
  vtheta = diag(2)*1e-8,
  piecewiseDropoutTime = c(0, 140))

pred <- getPrediction(
  df = interimData1,
  to_predict = "enrollment and event",
  target_n = 300,
  target_d = 200,
  enroll_model = "time-decay",
  event_model = "weibull",
  dropout_model = "piecewise exponential",
  piecewiseDropoutTime = 0,
  dropout_prior = dropout_prior,
  pilevel = 0.90, 
  nreps = 500)

