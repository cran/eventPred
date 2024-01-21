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
  df = interimData1,
  to_predict = "enrollment and event",
  target_n = 300,
  target_d = 200,
  enroll_model = "time-decay",
  event_model = "weibull",
  dropout_model = "none",
  pilevel = 0.90, 
  nreps = 500)

