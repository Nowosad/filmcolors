<!-- README.md is generated from README.Rmd. Please edit that file -->
Film Palettes
=============

[![Build Status](https://travis-ci.org/Nowosad/filmcolors.png?branch=master)](https://travis-ci.org/Nowosad/filmcolors)

Installation
------------

``` r
devtools::install_github("nowosad/filmcolors")
```

Usage
-----

``` r
library('filmcolors')

# See all palettes
names(film_palettes)
#> [1] "Vertigo"
```

### Vertigo (1958)

<img src="figs/Vertigo.png" width="1920" />

``` r
film_colors("Vertigo")
```

![](figure/Vertigo-1.png)

``` r
library('ggplot2')
ggplot(mtcars, aes(mpg, hp, color=as.factor(carb))) +  geom_point(size=8) +
  scale_color_manual(values = film_colors("Vertigo"))
```

![](figure/Vertigo_gg2-1.png)

### `sort_colors` function

``` r
colors <- c("#060306", "#290705", "#131325")
class(colors) <- 'palette'
colors
```

![](figure/sort_colors-1.png)

``` r
sorted_colors <- sort_colors(colors)
sorted_colors
```

![](figure/sort_colors-2.png)

Credits
-------

-   <https://github.com/woobe/rPlotter>
-   <https://github.com/karthik/wesanderson>
-   <https://learnr.wordpress.com/2010/01/21/ggplot2-crayola-crayon-colours/>
-   <https://twitter.com/CINEMAPALETTES>
