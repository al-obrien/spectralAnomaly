test_that("Threshold helper returns expected vector...", {
  sal_map <- c(0.008132905, 0.002205079, 0.014745095, 0.024349918, 0.023928495, 0.982835279, 0.023928495, 0.024349918, 0.014745095, 0.002205079, 0.008132905)
  expect_equal(anomaly_thresh(sal_map, threshold = 0.95),
               c(F, F, F, F, F, T, F, F, F, F, F))
})
