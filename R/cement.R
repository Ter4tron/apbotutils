#' Function that concatenates strings without the objects needing to be quoted
#'
#' @param ... objects to concatenate
#'
#' @return A concatenated string. Function pulled from https://adv-r.hadley.nz/quasiquotation.html
#' @export

cement <- function(...) {
  args <- rlang::ensyms(...)
  paste(purrr::map(args, rlang::as_string), collapse = " ")
}
