#' Simple extrapolation of time series
#'
#' The next point is estimated based upon a user provided number (m) of preceeding points. The gradient
#' between the last point and the prior points are summed and applied to the next point based upon the n-m+1 data point.
#'
#' @param x Numeric vector of data points to extrapolate forwards.
#' @param m Integer value representing the number of preceding points for the estimation.
#'
#' @returns Vector of estimated points.
#' @examples
#' tmp <- ts(rnorm(12*6,10,2), start=c(2009, 1), end=c(2014, 12), frequency=12)
#' simple_extrapolation(tmp, 5)
#' simple_extrapolation(tmp, 2)
#' simple_extrapolation(tmp, 10)
simple_extrapolation <- function(x, m = 5) {
  subvec <- tail(x, 1+m)
  if(length(subvec) <=1) stop('Must have at least two numbers.')
  if(m >= length(subvec)) stop('Window must be smaller than vector.')
  final_val <- tail(subvec, 1)
  diff_v <- (final_val - subvec[1:(length(subvec)-1)]) / seq(m, 1, by = -1)
  subvec[2] + sum(diff_v)
}

