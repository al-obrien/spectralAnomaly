test_that("Obvious outlier in saliency map...", {
  time_series <- c(1,2,3,4,5,100,5,4,3,2,1)
  sal_map <- saliency_map(time_series)
  expect_equal(sal_map > quantile(sal_map, prob = 0.95),
               c(F, F, F, F, F, T, F, F, F, F, F))
})

test_that("No obvious outlier in saliency map...", {
  time_series <- c(1,2,3,4,5,5,5,4,3,2,1)
  sal_map <- saliency_map(time_series)
  expect_equal(sal_map > quantile(sal_map, prob = 0.95),
               c(F, F, F, F, F, F, F, F, F, F, F))
})
