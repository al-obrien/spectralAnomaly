
<!-- README.md is generated from README.Rmd. Please edit that file -->

# spectralAnomaly <a href="https://al-obrien.github.io/spectralAnomaly/"><img src="man/figures/logo.png" align="right" height="120" alt="spectralAnomaly website" /></a>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/spectralAnomaly)](https://CRAN.R-project.org/package=spectralAnomaly)
[![CRAN
checks](https://badges.cranchecks.info/summary/spectralAnomaly.svg)](https://cran.r-project.org/web/checks/check_results_spectralAnomaly.html)
[![R-CMD-check](https://github.com/al-obrien/spectralAnomaly/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/al-obrien/spectralAnomaly/actions/workflows/R-CMD-check.yaml)
[![Dependencies](https://tinyverse.netlify.app/badge/spectralAnomaly)](https://cran.r-project.org/package=spectralAnomaly)
[![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/spectralAnomaly?color=blue)](https://cran.r-project.org/package=spectralAnomaly)
[![Codecov test
coverage](https://codecov.io/gh/al-obrien/spectralAnomaly/graph/badge.svg)](https://app.codecov.io/gh/al-obrien/spectralAnomaly)
<!-- badges: end -->

The {spectralAnomaly} package is a simple set of tools for R users to
detect anomalies in data, such as a time series, using the ‘Spectral
Residual’ method.

## Installation

The {spectralAnomaly} can be installed directly from CRAN:

``` r
install.packages('spectralAnomaly')
```

You can also install the latest development version of {spectralAnomaly}
like so:

``` r
remotes::install_github('al-obrien/spectralAnomaly')
```

## Examples

``` r
library(spectralAnomaly)
```

### Create a noisy time series with a modest anomaly threshold

``` r
test_ts <- ts(rnorm(12*6,10,2), start=c(2009, 1), end=c(2014, 12), frequency=12)
ts_scores <- anomaly_score(test_ts, score_window = 25)
plot(test_ts, type = 'l')
points(test_ts, col = ifelse(ts_scores > quantile(ts_scores, prob = 0.95),'red',NA), pch = 16)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" alt="Anomalies in a noisy time series." width="100%" />

### Create a series with a step

``` r
test_ts_step <- c(rnorm(1, 1, n=250),
                  rnorm(10, 1, n=250))
ts_scores <- anomaly_score(test_ts_step, score_window = 100)
plot(test_ts_step, type = 'l')
points(test_ts_step, col = ifelse(ts_scores > quantile(ts_scores, prob = 0.99),'red',NA), pch = 16)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" alt="Anomalies in a time series with a breakpoint." width="100%" />

## References

1.  [Time-Series Anomaly Detection Service at
    Microsoft](https://arxiv.org/pdf/1906.03821)  
2.  [ML-based Anomaly
    Detection](https://github.com/y-bar/ml-based-anomaly-detection/tree/master)  
3.  [Saliency
    Detection](http://www.houxiaodi.com/assets/papers/cvpr07.pdf)  
4.  [anomalydetector](https://github.com/microsoft/anomalydetector/tree/master)
