## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(eventPred)

## -----------------------------------------------------------------------------
set.seed(2000)

enroll_prior <- list(
  model = "piecewise poisson",
  theta = log(c(13, 26)/30.4375),
  vtheta = diag(2)*1e-8,
  accrualTime = c(0, 200))

## -----------------------------------------------------------------------------
event_prior <- list(
  list(model = "piecewise exponential",
       theta = log(c(log(2)/13, 0.58*log(2)/13)/30.4375),
       vtheta = diag(2)*1e-8,
       piecewiseSurvivalTime = c(0, 140)),
  list(model = "piecewise exponential",
       theta = log(c(log(2)/13, log(2)/13)/30.4375),
       vtheta = diag(2)*1e-8,
       piecewiseSurvivalTime = c(0, 140)))

## -----------------------------------------------------------------------------
dropout_prior <- list(
  list(model = "exponential",
       theta = log(-log(1-0.05)/365.25),
       vtheta = 1e-8),
  list(model = "exponential",
       theta = log(-log(1-0.05)/365.25),
       vtheta = 1e-8))

## -----------------------------------------------------------------------------
pred <- getPrediction(
  to_predict = "enrollment and event",
  target_n = 300,
  target_d = 200,
  enroll_prior = enroll_prior,
  event_prior = event_prior,
  dropout_prior = dropout_prior,
  pilevel = 0.90, 
  nreps = 500,
  by_treatment = TRUE,
  ngroups = 2, 
  alloc = c(2,2),
  treatment_label = c("Drug", "Placebo"))

