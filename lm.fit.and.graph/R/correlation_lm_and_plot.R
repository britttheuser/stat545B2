#' @title Linear model fitting and plotting for 2 numerical variable
#'
#' @Description This function summarizes and plots the linear relationship between 2 variables in a data set
#'
#' @param data specifies the data set which the variables are found
#' @param var1 the first variable in the relationship, has to be numerical
#' @param var2 the second variable in the relationship, has to be numerical
#'
#' @return a list consisting of a tidied up linear model and a plot
#'    the plot is a baseline scatter plot of the 2 variables, a linear line of best fit is present on top of the scatter plot
#' @examples
#' correlation_lm_and_plot(datateachr::cancer_sample, datateachr::cancer_sample$ID, datateachr::cancer_sample$concavity_mean)
#' correlation_lm_and_plot(datateachr::cancer_sample, datateachr::cancer_sample$concave_points_mean, datateachr::cancer_sample$concavity_mean)
#' @export


correlation_lm_and_plot <- function(data, var1, var2) {
  if(!is.numeric(var1) | !is.numeric(var2)) {
    stop('This function only works for numeric input.\n',
         'You have provided an object of classes: var1 is ', class(var1), ' and var 2 is ', class(var2))
  }
  result_model <- summary(stats::lm(var1 ~ var2, data))
  result_plot <- ggplot2::ggplot(data, ggplot2::aes(var1, var2)) +
    ggplot2::geom_point() +
    ggplot2::stat_smooth(method = "lm", alpha = 0.3, se = FALSE, fullrange = TRUE)
  results <- list(result_model, result_plot)
  return(results)
}
