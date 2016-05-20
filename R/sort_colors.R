#' A Color Sorting Function
#'
#' @param col vector of any of the three kinds of \R color specifications, i.e., either a color name (as listed by \code{\link{colors}()}), a hexadecimal string of the form \code{"#rrggbb"} or \code{"#rrggbbaa"} (see \code{\link{rgb}}), or a positive integer \code{i} meaning \code{\link{palette}()[i]}.
#'
#' @return A vector of colors.
#'
#' @references \url{https://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/}
#'
#' @importFrom grDevices col2rgb rgb
#' @importFrom colorspace RGB
#' @importFrom methods as
#'
#' @export
#'
#' @examples
#' colors <- c("#060306", "#290705", "#131325")
#' sorted_colors <- sort_colors(colors)
#' sorted_colors

sort_colors <- function(col){
        col_rgb <- col2rgb(col)
        col_rgb <- RGB(t(col_rgb) %*% diag(rep(1/255, 3)))
        col_HSV <- as(col_rgb, "HSV")@coords
        col_sort <- order(col_HSV[, 1], col_HSV[, 2], col_HSV[, 3])
        new_col <- col[col_sort]
        class(new_col) <- 'palette'
        return(new_col)
}

#' Complete list of palettes
#'
#' Use \code{\link{film_colors}} to construct palettes of desired length.
#'
#' @export
film_palettes <- list(Vertigo = filmcolors:::sort_colors(c("#060306", "#131325", "#290705", "#352E3C", "#450B0B", "#621D20", "#6D575D", "#8C8597")))
