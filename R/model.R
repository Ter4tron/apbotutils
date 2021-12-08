#' Calculator of AICc of nonlinear models from the drc package
#'
#' @param x Independent cariable bector
#' @param y Dependent variable vector
#' @param starters Vector with names of starter functions
#'
#' @return Data frame of AICc values belonging to models from the DRC package
#' @export

model.choose <- function(x, y, starters){

  res <- c()
  labels <- c()

  for(i in 1:length(starters)){
    rm(model)
    try(model <- eval(rlang::parse_expr(paste("drc::drm(y ~ x, fct = drc::", starters[i], "())", sep = ""))))

    if(exists("model") == T){
      AICc.model <-  MuMIn::AICc(model)
      res <- c(res, AICc.model)
      labels <- c(labels, starters[i])
    }else{
      res <- c(res,NA)
      labels <- c(labels, starters[i])
    }

  }

  res.df <- data.frame(labels, res)

  return(res.df)

}
