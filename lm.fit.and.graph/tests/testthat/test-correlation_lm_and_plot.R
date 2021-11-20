test_that("linear modeling works", {
  p <- correlation_lm_and_plot(datateachr::cancer_sample, datateachr::cancer_sample$concave_points_mean, datateachr::cancer_sample$concavity_mean)[[2]]
  expect_identical(sapply(p$layers, function(x) class(x$geom)[1]), c("GeomPoint", "GeomSmooth"))
})


test_that("linear model testing", {
  test_model <-correlation_lm_and_plot(datateachr::cancer_sample, datateachr::cancer_sample$concave_points_mean, datateachr::cancer_sample$concavity_mean)[[1]]
  test_p_value<- substr(test_model$coefficients[,4], 1, 20)
  concavity_lm <- lm(concave_points_mean ~ concavity_mean, datateachr::cancer_sample)
  lm_summary <- summary(concavity_lm)
  expected_p_value <- substr(lm_summary$coefficients[,4], 1, 20)
  expect_equal(test_p_value, expected_p_value)
})

test_that("Error is correctly thrown", {
  expect_error(correlation_lm_and_plot(datateachr::cancer_sample, cancer_sample$diagnosis, cancer_sample$concavity_mean))
})
