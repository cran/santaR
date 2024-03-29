% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/santaR_pvalue_fit.R
\name{santaR_pvalue_fit}
\alias{santaR_pvalue_fit}
\title{Evaluate difference in group trajectories based on the comparison of model fit (F-test) between one and two groups}
\usage{
santaR_pvalue_fit(SANTAObj, nPerm = 1000, alpha = 0.05)
}
\arguments{
\item{SANTAObj}{A fitted \emph{SANTAObj} as generated by \code{\link{santaR_fit}}.}

\item{nPerm}{(int) Number of permutations. Default 1000.}

\item{alpha}{(float) Confidence Interval on the permuted \emph{p}-value \emph{(0.05 for 95\% Confidence Interval)}. Default 0.05.}
}
\value{
A \emph{SANTAObj} with added \emph{p}-value fit and confidence interval on the \emph{p}-value.
}
\description{
Evaluate the difference in group trajectories by executing a t-test based on the comparison of improvement in model fit \emph{(F-test)} between fitting one group mean curve to all individuals and fitting two group mean curves. This between-class differential evolution test, evaluates whether fitting 2 group curves decreases the residuals compared to a single group mean curve. The statistic employed is defined as a quantification of evidence for differential evolution, with the larger the statistic the more differentially evolving the variable appears to be. Individual group membership is repeatedly randomly permuted to generate new random groups and group mean curves, then employed to compute a \emph{Null} distribution of the statistic (improvement in model fit from one to two groups). The improvement in model fit for the real group membership is then compared to this \emph{Null} distribution \emph{(of no group difference)} and a \emph{p}-value is computed. Adapted from \cite{Storey and al. 'Significance analysis of time course microarray experiments', PNAS, 2005 [1]}.
\itemize{
  \item The \emph{p}-value is calculated as \code{(b+1)/(nPerm+1)} as to not report a \emph{p}-value=0 (which would give problem with FDR correction) and reduce type I error.
  \item The \emph{p}-value will vary depending on the random sampling. Therefore a confidence interval can be constructed using Wilson's interval which presents good properties for small number of trials and probabilities close to 0 or 1.
}
}
\examples{
## 56 measurements, 8 subjects, 7 unique time-points
## Default parameter values decreased to ensure an execution < 2 seconds
Yi          <- acuteInflammation$data$var_3
ind         <- acuteInflammation$meta$ind
time        <- acuteInflammation$meta$time
group       <- acuteInflammation$meta$group
grouping    <- get_grouping(ind, group)
inputMatrix <- get_ind_time_matrix(Yi, ind, time)
SANTAObj    <- santaR_fit(inputMatrix, df=5, grouping=grouping, verbose=TRUE)
SANTAObj    <- santaR_pvalue_fit(SANTAObj, nPerm=100)

}
\references{
[1] Storey, J. D., Xiao, W., Leek, J. T., Tompkins, R. G. & Davis, R. W. Significance analysis of time course microarray experiments. \emph{Proceedings of the National Academy of Sciences of the United States of America} \strong{102}, 12837-42 (2005).
}
\seealso{
Comparison with constant model with \code{\link{santaR_pvalue_fit_within}}

Other Analysis: 
\code{\link{get_grouping}()},
\code{\link{get_ind_time_matrix}()},
\code{\link{santaR_CBand}()},
\code{\link{santaR_auto_fit}()},
\code{\link{santaR_auto_summary}()},
\code{\link{santaR_fit}()},
\code{\link{santaR_plot}()},
\code{\link{santaR_pvalue_dist}()},
\code{\link{santaR_start_GUI}()}
}
\concept{Analysis}
