% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarizeObserved.R
\name{summarizeObserved}
\alias{summarizeObserved}
\title{Summarize observed data}
\usage{
summarizeObserved(
  df,
  to_predict = "enrollment and event",
  dropout_model = "weibull"
)
}
\arguments{
\item{df}{The subject-level data, including \code{randdt} and
\code{cutoffdt} for enrollment prediction,
as well as \code{time}, \code{event} and \code{dropout}
for event prediction.}

\item{to_predict}{Specifies what to predict: "enrollment only",
"event only", or "enrollment and event". By default, it is set to
"enrollment and event".}

\item{dropout_model}{The dropout model with options including "none",
"exponential", "Weibull", and "log-normal". By default, it is
set to "Weibull".}
}
\value{
A list that includes a range of summary statistics and
data sets depending on the value of \code{to_predict}.
}
\description{
Provides an overview of the observed data, including
the trial start date, data cutoff date, number of subjects
enrolled, enrollment duration, number of events and dropouts,
number of subjects at risk, cumulative enrollment and event data,
daily enrollment rate, and Kaplan-Meier plots for time to event
and time to dropout.
}
\examples{

observed <- summarizeObserved(df = observedData,
                              to_predict = "enrollment and event")

}
