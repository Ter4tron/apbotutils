#' Title
#'
#' @param df.name name of data frame to be rearranged as a string
#' @param group vector of strings with names of the columns you wish to group by
#' @param columns vector of strings with names of the columns you with to summarise
#'
#' @return A data frame with specified means, standard deviations and standard errors
#' @export
#'
avg.tbl <- function(df.name, group, columns){
  #codestart <- "df %>% dplyr::group_by"
  #code <- paste(codestart, "(", group, ")", "%>% dplyr::summarise(", sep = "")

  grouped <- paste("dplyr::group_by(", df.name, ",", sep = "")

  for(i in group){
    grouped <- paste(grouped, i, ",", sep = "")

    grouped.cut <- substr(grouped, 1, nchar(grouped)-1)
    grouped.final <- eval(rlang::parse_expr(paste(grouped.cut, ")")))
  }



  summarised <- paste("dplyr::summarise(", "grouped.final", ",", "sample.size = dplyr::n(),", sep = "")

  for(i in columns){
    summarised <- paste(summarised, i, ".avg = mean(", i, ", na.rm = T)", ",",
                        i, ".sd = sd(", i, ", na.rm = T)", ",", sep = "")
  }

  summarised.cut <- substr(summarised, 1, nchar(summarised)-1)
  summarised.final <- eval(rlang::parse_expr(paste(summarised.cut, ")")))

  mutated <- paste("dplyr::mutate(", "summarised.final", ",", sep = "")

  for(i in columns){
    mutated <- paste(mutated, i, ".se = ", "(", i, ".sd)", "/(sqrt(sample.size - 1))", ",",sep = "")
  }

  mutated.cut <- substr(mutated, 1, nchar(mutated)-1)
  mutated.final <- eval(rlang::parse_expr(paste(mutated.cut, ")", sep = "")))

  return(mutated.final)

}
