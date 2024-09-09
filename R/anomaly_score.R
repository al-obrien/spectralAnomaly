#' Create anomaly score from input data
#'
#' Convert an input of numeric data, typically a time series, into a score for anomaly detection.
#' The data is first extended to improve the detection latency, followed by saliency map creation. The
#' score is calculated using the sliding window average for each point in the saliency map.
#'
#' @param x Numeric vector.
#' @param score_window Integer value for the window width for scoring.
#' @param spec_window Positive integer value for the window to calculate the averaged log spectrum.
#' @param m Integer value representing the number of preceding points for the estimation.
#'
#' @returns A numeric vector of anomaly scores.
#'
#' @examples
#' tmp <- ts(rnorm(12*6,10,2), start=c(2009, 1), end=c(2014, 12), frequency=12)
#' anomaly_score(tmp, score_window = 25)
#' @export
anomaly_score <- function(x, score_window, spec_window = 3, m = 5) {

  if(stats::is.ts(x)) x <- as.numeric(x)

  # Extend (5 points)
  ext_pts <- 5
  x <- c(x, rep(simple_extrapolation(x, m), ext_pts))

  # Saliency Map
  sal_map <- saliency_map(x, spec_window)

  # Create score
  avg_val <- avg_sliding_window(sal_map, score_window)
  #safe_div <- pmax( .Machine$double.eps, pmin(avg_val, max(avg_val)))
  score <- abs((sal_map - avg_val) / avg_val)

  # Return same length
  utils::head(score, -ext_pts)
}
