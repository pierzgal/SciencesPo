#' @encoding UTF-8
#' @title Recode or Replace Values With New Values
#'
#' @description Recodes a value or a vector of values.
#'
#' @param x The vector whose values will be recoded.
#' @param old the old value or a vector of old values (numeric/factor/string).
#' @param into the new value or a vector of replacement values (1 to 1 recoding).
#' @param warn A logical to print a message if any of the
#'  old values are not actually present in \code{x}.
#' @keywords Manipulation
#'
#' @examples
#' x <- LETTERS[1:5]
#' Recode(x, c("B", "D"), c("Beta", "Delta"))
#'
#' # On numeric vectors
#' x <- c(1, 4, 5, 9)
#' Recode(x, old = c(1, 4, 5, 9), into = c(10, 40, 50, 90))
#'
#' @export
`Recode` <- function(x, old, into, warn=TRUE) UseMethod("Recode")
NULL


#' @rdname Recode
#' @export
`Recode.default` <- function(x, old, into, warn = TRUE) {
    if (base::missing(x))
      stop("No variable provided.") 
  if (length(old) != length(into))
    stop("`old` and `into` values are not the same length.")
  
  if (!is.atomic(x) && is.null(x) && !is.null(dim(x)))
   stop('`x` must be an atomic vector or a variable.')

  if (is.factor(x)) {
    # If x is a factor, call self but operate on the levels
    levels(x) <- Recode(levels(x), old, into, warn)
    return(x)
  }
  map_x <- match(x, old)
  map_x_NA  <- is.na(map_x)
  # index of items in `old` that were found in `x`
  old_unique <- sort(unique(map_x))
  if (warn && length(old_unique) != length(old)) {
    message("The following `old` values were not present in `x`: ",
     paste(old[!(1:length(old) %in% old_unique) ], collapse = ", "))
  }
  x[!map_x_NA] <- into[map_x[!map_x_NA]]
  return(x)
}
NULL
