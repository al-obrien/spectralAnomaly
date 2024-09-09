#' Create saliency map
#'
#' Using the provided numeric input, typically a time series, calculate the spectral residual
#' and output the saliency map for use in anomaly detection.
#'
#' @param x Numeric vector.
#' @param window Positive integer value.
#'
#' @returns Numeric vector representing the saliency map values.
#'
#' @examples
#' tmp <- ts(rnorm(12*6,10,2), start=c(2009, 1), end=c(2014, 12), frequency=12)
#' saliency_map(tmp)
#' @seealso \code{\link{anomaly_score}}
#' @export
saliency_map <- function(x, window = 3) {

  len_data <- length(x)
  fft_data <- stats::fft(x)

  # Get amplitude, and phase
  amp <- Mod(fft_data)
  log_amp <- log(amp)
  pha <- Arg(fft_data) # atan2(Im(tmp_fft),Re(tmp_fft))

  avg_log_spec <- avg_sliding_window(log_amp, window)
  spec_resid <- exp(log_amp - avg_log_spec)

  rl <- Re(fft_data) * spec_resid / amp
  imgv <- Im(fft_data) * spec_resid / amp

  # Convert SR to SM
  sal_map <- inv_fft(complex(real= rl, imaginary = imgv))
  sal_map <- sqrt( (Re(sal_map) ^ 2) + (Im(sal_map) ^ 2))
  sal_map
}


