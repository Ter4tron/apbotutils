#' Standard score
#'
#' @param x Numerical vector
#'
#' @return Z score of the vector input
#' @export

z.score <- function(x){
  avg <- mean(x, na.rm = TRUE)
  sd <- sd(x, na.rm = TRUE)

  z <- (x - avg)/sd
  return(z)
}
