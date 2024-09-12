#' Inverse Fast Fourier Transform
#'
#' A helper function to perform the inverse operation of the fast fourier transform.
#'
#' @param x Numeric vector.
#' @param len Optional argument, define length of provided vector as a numeric.
#'
#' @returns Numeric vector.
#' @noRd
inv_fft <- function(x, len = NULL) {
  if(is.null(len)) len <- length(x)
  stats::fft(x, inverse = TRUE)/ len
}

#' Sliding window convolution.
#'
#' Calculate the sliding window average based upon the width provided.
#'
#' @param x Numeric vector.
#' @param window Integer vector for sliding window.
#'
#' @returns Numeric vector of averaged values over the sliding window.
#' @noRd
avg_sliding_window <- function(x, window) {
  up2window <- window-1
  first_set <- cumsum(x[1:up2window])
  out <- stats::filter(x, filter = rep(1/window, window), sides = 1)
  if(!stats::is.ts(x)) out <- as.numeric(out) # Preserve the input as a numeric is wasnt a ts
  out[1:up2window] <- first_set[1:up2window] / 1:up2window
  out
}

#' Apply threshold to anomaly score
#'
#' A helper function that wraps around \code{quantile} to apply a threshold to anomaly scores.
#'
#' @param x Numeric vector of anomaly scores (e.g. created by \code{anomaly_score}).
#' @param threshold Numeric value to determine the threshold to flag outliers among the score.
#' @param ... Additional parameters passed to \code{quantile}.
#'
#' @returns Logical vector referencing which, if any, of the provided values are outliers.
#'
#' @examples
#' test_data <- c(1,2,3,4,5,100,5,4,3,2,1)
#' anomaly_thresh(test_data, 0.99)
#' @export
anomaly_thresh <- function(x, threshold = 0.99, ...) {
  x > stats::quantile(x, prob = threshold, ...)
}
