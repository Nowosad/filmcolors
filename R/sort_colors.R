#' A Color Sorting Function
#'
#' @param col vector of any of the three kinds of \R color specifications, i.e., either a color name (as listed by \code{\link{colors}()}), a hexadecimal string of the form \code{"#rrggbb"} or \code{"#rrggbbaa"} (see \code{\link{rgb}}), or a positive integer \code{i} meaning \code{\link{palette}()[i]}.
#'
#' @return A vector of colors.
#' @importFrom grDevices col2rgb rgb
#' @importFrom colorspace RGB
#' @importFrom methods as
#' @export
#'
#' @references \url{https://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/}
#'
#' @examples
#' colors <- c("#060306", "#131325", "#290705")
#' sorted_colors <- sort_colors(colors)
#' sorted_colors

sort_colors <- function(col){
        col_rgb = col2rgb(col)
        col_rgb = RGB(t(col_rgb) %*% diag(rep(1/255, 3)))
        col_HSV = as(col_rgb, "HSV")@coords
        order(col_HSV[, 1], col_HSV[, 2], col_HSV[, 3])
}