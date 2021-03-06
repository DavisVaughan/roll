##' Rolling Sums
##'
##' A parallel function for computing rolling sums of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling sums of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling sums.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling sums
##' result <- roll_sum(data, 252)
##' 
##' # Rolling sums with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_sum(data, 252, weights)
##' @export
roll_sum <- function(data, width, weights = rep(1, width),
                     min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                     parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_sum`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Products
##'
##' A parallel function for computing rolling products of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling products of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling products.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling products
##' result <- roll_prod(data, 252)
##' 
##' # Rolling products with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_prod(data, 252, weights)
##' @export
roll_prod <- function(data, width, weights = rep(1, width),
                      min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                      parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_prod`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Means
##'
##' A parallel function for computing rolling means of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling means of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling means.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling means
##' result <- roll_mean(data, 252)
##' 
##' # Rolling means with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_mean(data, 252, weights)
##' @export
roll_mean <- function(data, width, weights = rep(1, width),
                      min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                      parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_mean`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Variances
##'
##' A parallel function for computing rolling variances of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling variances of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling variances.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling variances
##' result <- roll_var(data, 252)
##' 
##' # Rolling variances with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_var(data, 252, weights)
##' @export
roll_var <- function(data, width, weights = rep(1, width), center = TRUE,
                     min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                     parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_var`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Standard Deviations
##'
##' A parallel function for computing rolling standard deviations of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling standard deviations of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling standard deviations.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling standard deviations
##' result <- roll_sd(data, 252)
##' 
##' # Rolling standard deviations with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_sd(data, 252, weights)
##' @export
roll_sd <- function(data, width, weights = rep(1, width), center = TRUE,
                    min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                    parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_sd`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Scaling and Centering
##'
##' A parallel function for computing rolling scaling and centering of time-series data.
##'
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param scale logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
##' if \code{FALSE} then no scaling is done.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then each value is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling scaling and centering of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling scaling and centering.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling z-scores
##' result <- roll_scale(data, 252)
##'
##' # Rolling z-scores with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_scale(data, 252, weights)
##' @export
roll_scale <- function(data, width, weights = rep(1, width), center = TRUE, scale = TRUE,
                       min_obs = width, complete_obs = FALSE, na_restore = FALSE,
                       parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_scale`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.logical(scale),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Covariance Matrices
##'
##' A parallel function for computing rolling covariance matrices of time-series data.
##' 
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param scale logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
##' if \code{FALSE} then no scaling is done.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling covariance matrices of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return A cube with each slice the rolling covariance matrix.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling covariance matrices
##' result <- roll_cov(data, 252)
##' 
##' # Rolling covariance matrices with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_cov(data, 252, weights)
##' @export
roll_cov <- function(data, width, weights = rep(1, width), center = TRUE, scale = FALSE,
                     min_obs = width, complete_obs = TRUE, na_restore = FALSE,
                     parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_cov`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.logical(scale),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Correlation Matrices
##'
##' A parallel function for computing rolling correlation matrices of time-series data.
##' 
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param scale logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
##' if \code{FALSE} then no scaling is done.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling correlation matrices of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return A cube with each slice the rolling correlation matrix.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling correlation matrices
##' result <- roll_cor(data, 252)
##' 
##' # Rolling correlation matrices with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_cor(data, 252, weights)
##' @export
roll_cor <- function(data, width, weights = rep(1, width), center = TRUE, scale = TRUE,
                     min_obs = width, complete_obs = TRUE, na_restore = FALSE,
                     parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_cov`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.logical(scale),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Linear Models
##'
##' A parallel function for computing rolling linear models of time-series data.
##' 
##' @param x matrix or xts object. Rows are observations and columns are the independent variables.
##' @param y matrix or xts object. Rows are observations and columns are the dependent variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param intercept logical. Either \code{TRUE} to include or \code{FALSE} to remove the intercept.
##' @param center logical. \code{center = z} is shorthand for \code{center_x = z} and
##' \code{center_y = z}, where \code{z} is either \code{TRUE} or \code{FALSE}.
##' @param center_x logical. If \code{TRUE} then the weighted mean of each \code{x} variable is used,
##' if \code{FALSE} then zero is used.
##' @param center_y logical. Analogous to \code{center_x}.
##' @param scale logical. \code{scale = z} is shorthand for \code{scale_x = z} and
##' \code{scale_y = z}, where \code{z} is either \code{TRUE} or \code{FALSE}.
##' @param scale_x logical. If \code{TRUE} then the weighted standard deviation of each \code{x} 
##' variable is used, if \code{FALSE} then no scaling is done.
##' @param scale_y logical. Analogous to \code{scale_x}.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling linear models of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return A list containing the following components:
##' \item{coefficients}{A list of objects with the rolling coefficients for each \code{y}.
##' An object is the same class and dimension (with an added column for the intercept) as \code{x}.}
##' \item{r.squared}{A list of objects with the rolling r-squareds for each \code{y}.
##' An object is the same class as \code{x}.}
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' y <- matrix(rnorm(n_obs), nrow = n_obs, ncol = 1)
##' 
##' # Rolling regressions
##' result <- roll_lm(x, y, 252)
##' 
##' # Rolling regressions with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_lm(x, y, 252, weights)
##' @export
roll_lm <- function(x, y, width, weights = rep(1, width), intercept = TRUE, 
                    center = FALSE, center_x = center, center_y = center,
                    scale = FALSE, scale_x = scale, scale_y = scale,
                    min_obs = width, complete_obs = TRUE,
                    na_restore = FALSE, parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_lm`,
               x,
               y,
               as.integer(width),
               as.numeric(weights),
               as.logical(intercept),
               as.logical(center_x),
               as.logical(center_y),
               as.logical(scale_x),
               as.logical(scale_y),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Eigenvalues and Eigenvectors
##'
##' A parallel function for computing rolling eigenvalues and eigenvectors of time-series data.
##' 
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param scale logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
##' if \code{FALSE} then no scaling is done.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling eigenvalues and eigenvectors of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return A list containing the following components:
##' \item{values}{An object of the same class and dimension as \code{data} with the rolling eigenvalues.}
##' \item{vectors}{A cube with each slice the rolling eigenvectors.}
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling eigenvalues and eigenvectors
##' result <- roll_eigen(data, 252)
##' 
##' # Rolling eigenvalues and eigenvectors with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_eigen(data, 252, weights)
##' @export
roll_eigen <- function(data, width, weights = rep(1, width), center = TRUE, scale = FALSE,
                       min_obs = width, complete_obs = TRUE, na_restore = FALSE,
                       parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_eigen`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.logical(scale),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Principal Component Regressions 
##'
##' A parallel function for computing rolling principal component regressions of time-series data.
##' 
##' @param x matrix or xts object. Rows are observations and columns are the independent variables.
##' @param y matrix or xts object. Rows are observations and columns are the dependent variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param comps integer vector. Select a subset of principal components.
##' @param intercept logical. Either \code{TRUE} to include or \code{FALSE} to remove the intercept.
##' @param center logical. \code{center = z} is shorthand for \code{center_x = z} and
##' \code{center_y = z}, where \code{z} is either \code{TRUE} or \code{FALSE}.
##' @param center_x logical. If \code{TRUE} then the weighted mean of each \code{x} variable is used,
##' if \code{FALSE} then zero is used.
##' @param center_y logical. Analogous to \code{center_x}.
##' @param scale logical. \code{scale = z} is shorthand for \code{scale_x = z} and
##' \code{scale_y = z}, where \code{z} is either \code{TRUE} or \code{FALSE}.
##' @param scale_x logical. If \code{TRUE} then the weighted standard deviation of each \code{x} 
##' variable is used, if \code{FALSE} then no scaling is done.
##' @param scale_y logical. Analogous to \code{scale_x}.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling principal component regressions of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return A list containing the following components:
##' \item{coefficients}{A list of objects with the rolling coefficients for each \code{y}.
##' An object is the same class and dimension (with an added column for the intercept) as \code{x}.}
##' \item{r.squared}{A list of objects with the rolling r-squareds for each \code{y}.
##' An object is the same class as \code{x}.}
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' x <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' y <- matrix(rnorm(n_obs), nrow = n_obs, ncol = 1)
##' 
##' # Rolling principal component regressions
##' result <- roll_pcr(x, y, 252, comps = 1)
##' 
##' # Rolling principal component regressions with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_pcr(x, y, 252, comps = 1, weights)
##' @export
roll_pcr <- function(x, y, width, comps = 1:ncol(x), weights = rep(1, width), intercept = TRUE, 
                     center = FALSE, center_x = center, center_y = center,
                     scale = FALSE, scale_x = scale, scale_y = scale,
                     min_obs = width, complete_obs = TRUE,
                     na_restore = FALSE, parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_pcr`,
               x,
               y,
               as.integer(width),
               as.numeric(comps),
               as.numeric(weights),
               as.logical(intercept),
               as.logical(center_x),
               as.logical(center_y),
               as.logical(scale_x),
               as.logical(scale_y),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}

##' Rolling Variance Inflation Factors
##'
##' A parallel function for computing rolling variance inflation factors of time-series data.
##' 
##' @param data matrix or xts object. Rows are observations and columns are variables.
##' @param width integer. Window size.
##' @param weights vector. Weights for each observation within a window.
##' @param center logical. If \code{TRUE} then the weighted mean of each variable is used,
##' if \code{FALSE} then zero is used.
##' @param scale logical. If \code{TRUE} then the weighted standard deviation of each variable is used,
##' if \code{FALSE} then no scaling is done.
##' @param min_obs integer. Minimum number of observations required to have a value within a window,
##' otherwise result is \code{NA}.
##' @param complete_obs	logical. If \code{TRUE} then rows containing any missing values are removed,
##' if \code{FALSE} then pairwise is used.
##' @param na_restore logical. Should missing values be restored?
##' @param parallel_for character. Executes a "for" loop in which iterations run in parallel by
##' \code{rows} or \code{cols}.
##' @details The numerical calculations use RcppParallel to parallelize rolling variance inflation factors of time-series data. 
##' RcppParallel provides a complete toolkit for creating safe, portable, high-performance parallel 
##' algorithms, built on top of the Intel Threading Building Blocks (TBB) and TinyThread libraries.
##' 
##' By default, all the available cores on a machine are used for parallel algorithms. If users are 
##' either already taking advantage of parallelism or instead want to use a fixed number or proportion of 
##' threads, then set the number of threads in the RcppParallel package with the 
##' \code{\link[RcppParallel]{setThreadOptions}} function.
##' @return An object of the same class and dimension as \code{data} with the rolling variance
##' inflation factors.
##' @examples
##' n_vars <- 10
##' n_obs <- 1000
##' data <- matrix(rnorm(n_obs * n_vars), nrow = n_obs, ncol = n_vars)
##' 
##' # Rolling variance inflation factors
##' result <- roll_vif(data, 252)
##' 
##' # Rolling variance inflation factors with exponential decay
##' weights <- 0.9 ^ (251:0)
##' result <- roll_vif(data, 252, weights)
##' @export
roll_vif <- function(data, width, weights = rep(1, width), center = FALSE, scale = FALSE,
                     min_obs = width, complete_obs = TRUE, na_restore = FALSE,
                     parallel_for = c("rows", "cols")) {
  return(.Call(`_roll_roll_vif`,
               data,
               as.integer(width),
               as.numeric(weights),
               as.logical(center),
               as.logical(scale),
               as.integer(min_obs),
               as.logical(complete_obs),
               as.logical(na_restore),
               as.character(match.arg(parallel_for))
  ))
}



