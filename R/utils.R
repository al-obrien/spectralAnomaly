#' Inverse Fast Fourier Transform
#'
#' @param x Numeric vector.
#' @param len Optional argument, define length of provided vector as a numeric.
#'
#' @returns Numeric vector.
inv_fft <- function(x, len = NULL) {
  if(is.null(len)) len <- length(x)
  fft(x, inverse = TRUE)/ len
}

#' Sliding window convolution.
#'
#' @param x Numeric vector.
#' @param window Integer vector for sliding window.
#'
#' @returns Numeric vector of averaged values over the sliding window.
avg_sliding_window <- function(x, window) {
  up2window <- window-1
  first_set <- cumsum(x[1:up2window])
  out <- stats::filter(x, filter = rep(1/window, window), sides = 1)
  out[1:up2window] <- first_set[1:up2window] / 1:up2window
  out
}
