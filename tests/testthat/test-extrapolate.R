test_that("Extrapolation functions...", {
  tmp <- ts(c(9, 9.8, 9.8, 9, 13, 11, 11, 12, 11, 11, 9, 9.5,
              10, 9.3, 15, 7, 9, 8, 10, 9.5, 10, 9, 14, 11),
            start=c(2009, 1),
            end=c(2010, 12),
            frequency=12)
  expect_equal(round(simple_extrapolation(tmp, 5), 3), 8.408)
  expect_equal(round(simple_extrapolation(tmp, 2), 3), 12)
  expect_equal(round(simple_extrapolation(tmp, 10), 3), 14.92)
})
