#' Standard score
#'
#' @param x Numerical vector
#'
#' @return Z score of the vector input
#' @export

z.score <- function(x){
  avg <- mean(x)
  sd <- sd(x)

  z <- (x - avg)/sd
  return(z)
}
