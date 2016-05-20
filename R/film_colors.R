#' Complete list of palettes
#'
#' Use \code{\link{film_colors}} to construct palettes of desired length.
#'
#' @export
film_palettes <- list(
  Vertigo = c("#060306", "#131325", "#290705", "#352E3C", "#450B0B", "#621D20", "#6D575D", "#8C8597")
)

#' A Film Color Palette Generator
#'
#' These are a handful of color palettes from movies.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{Vertigo}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @return A vector of colours.
#' @export
#' @importFrom grDevices colorRampPalette rgb
#' @importFrom graphics par image rect text
#' @keywords colors
#' @examples
#' film_colors("Vertigo")
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- film_colors(21, name = "Vertigo", type = "continuous")
#' image(volcano, col = pal)
film_colors <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- film_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
