# eventPred 0.1.0

- added the piecewise Poisson model to fitEnrollment and predictEnrollment at the analysis stage
- added number of dropouts
- added number of subjects at risk
- added a data set when the enrollment has completed
- corrected the x-axis title for predictEnrollment and predictEvent
- updated alogrithm to allow one piece piecewise Poisson enrollment model and one piece piecewise exponential time-to-event model
- modified the weight calculation for model averaging to avoid underflow
- used weighted BIC for model averaging
- removed the dropout_model parameter for summarizeObserved
- changed the default number of knots of the b-spline enrollment model to zero
- replaced first and last with slice of dplyr in summarizeObserved
- improved the initial value for the time-decay enrollment model parameters
- added showplot to fitEnrollment, fitEvent and fitDropout
- sped up the calculations of quantiles
- added target_n to predictEnrollment output and target_d to predictEvent output
- removed the cutoff date from ongoing_pred_df before data cutoff
- restricted enrollment model fitting to the last randomization date
- added piecewise exponential dropout model
- use delta method to obtain the variance of model parameters for pooled population
- replace randomization probabilities with treatment allocation within a randomization block
- allow number of subjects to differ among simulated data sets
- remove custom date axis

# eventPred 0.0.1

- Initial release
