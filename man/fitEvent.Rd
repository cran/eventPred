% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitEvent.R
\name{fitEvent}
\alias{fitEvent}
\title{Fit time-to-event model}
\usage{
fitEvent(
  df,
  event_model = "model averaging",
  piecewiseSurvivalTime = 0,
  k = 0,
  scale = "hazard",
  showplot = TRUE,
  by_treatment = FALSE,
  covariates = NULL
)
}
\arguments{
\item{df}{The subject-level event data, including \code{time}
and \code{event}. The data should also include \code{treatment}
coded as 1, 2, and so on, and \code{treatment_description}
for fitting the event model by treatment.}

\item{event_model}{The event model used to analyze the event data
which can be set to one of the following options:
"exponential", "Weibull", "log-logistic", "log-normal",
"piecewise exponential", "model averaging", or "spline".
The model averaging uses the \code{exp(-bic/2)} weighting and
combines Weibull and log-normal models. The spline model of
Royston and Parmar (2002) assumes that a transformation of
the survival function is modeled as a natural cubic spline
function of log time. By default, it is set to "model averaging".}

\item{piecewiseSurvivalTime}{A vector that specifies the time
intervals for the piecewise exponential survival distribution.
Must start with 0, e.g., c(0, 60) breaks the time axis into 2
event intervals: [0, 60) and [60, Inf). By default, it is set to 0.}

\item{k}{The number of inner knots of the spline. The default
\code{k=0} gives a Weibull, log-logistic or log-normal model,
if \code{scale} is "hazard", "odds", or "normal", respectively.
The knots are chosen as equally-spaced quantiles of the log
uncensored survival times. The boundary knots are chosen as the
minimum and maximum log uncensored survival times.}

\item{scale}{If "hazard", the log cumulative hazard is modeled
as a spline function. If "odds", the log cumulative odds is
modeled as a spline function. If "normal", -qnorm(S(t)) is
modeled as a spline function.}

\item{showplot}{A Boolean variable to control whether or not to
show the fitted time-to-event survival curve. By default, it is
set to \code{TRUE}.}

\item{by_treatment}{A Boolean variable to control whether or not to
fit the time-to-event data by treatment group. By default,
it is set to \code{FALSE}.}

\item{covariates}{The names of baseline covariates from the input
data frame to include in the event model, e.g., c("age", "sex").
Factor variables need to be declared in the input data frame.}
}
\value{
A list of results from the model fit including key information
such as the event model, \code{model}, the estimated model parameters,
\code{theta}, the covariance matrix, \code{vtheta}, as well as the
Akaike Information Criterion, \code{aic}, and
Bayesian Information Criterion, \code{bic}.

If the piecewise exponential model is used, the location
of knots used in the model, \code{piecewiseSurvivalTime}, will
be included in the list of results.

If the model averaging option is chosen, the weight assigned
to the Weibull component is indicated by the \code{w1} variable.

If the spline option is chosen, the \code{knots} and \code{scale}
will be included in the list of results.

When fitting the event model by treatment, the outcome is presented
as a list of lists, where each list element corresponds to a
specific treatment group.

The fitted time-to-event survival curve is also returned.
}
\description{
Fits a specified time-to-event model to the event data.
}
\examples{

event_fit <- fitEvent(df = interimData2,
                      event_model = "piecewise exponential",
                      piecewiseSurvivalTime = c(0, 180))

}
\references{
Patrick Royston and Mahesh K. B. Parmar. Flexible parametric
proportional-hazards and proportional-odds models for censored
survival data, with application to prognostic modelling and
estimation of treatment effects. Stat in Med. 2002; 21:2175-2197.
}
\author{
Kaifeng Lu, \email{kaifenglu@gmail.com}
}
