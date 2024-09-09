test_that("Test creation of scores...", {
  time_series <- c(1,2,3,4,5,100,5,4,3,2,1)
  a_scores <- anomaly_score(time_series, 3)
  expect_equal(round(a_scores, 5),
               c(0.00000, 0.14799, 0.21184, 0.17963, 0.21628, 1.56837, 0.76386, 0.80830, 0.18806, 0.16523, 0.23823))
  expect_equal(a_scores > quantile(a_scores, prob = 0.95),
               c(F, F, F, F, F, T, F, F, F, F, F))
  })
