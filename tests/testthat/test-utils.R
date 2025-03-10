test_that("Threshold helper returns expected vector...", {
  sal_map <- c(0.008132905, 0.002205079, 0.014745095, 0.024349918, 0.023928495, 0.982835279, 0.023928495, 0.024349918, 0.014745095, 0.002205079, 0.008132905)
  expect_equal(anomaly_thresh(sal_map, threshold = 0.95),
               c(F, F, F, F, F, T, F, F, F, F, F))
})

test_that("var_sliding_window computes as expected...", {
  expect_equal(round(var_sliding_window(1:20, 4),2),
               c(NA, 0.50, 1.00, rep(1.67, 17)))
})

# test_that("Add an anomaly...", {
#   withr::local_seed(1980)
#   expect_equal(add_anomaly(c(1,8,10,11,20,25,50,50,20,20,20,5), 2, 5, 9),
#                c(1, 8 , 10, 11, 20, 1574.563, 50, 50, 20, 20 ,20, -4071.679))
# })

