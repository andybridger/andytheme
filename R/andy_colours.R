#' andy colour pallete
#' Adjusted from the The Color Universal Design from the University of Tokyo using black palatte
andy_colours <- c("#0072B2","#E69F00","#009E73", "#cc79a7", "#56B4E9", "#F0E442", "#8e9fbc", "#d55e00", "#a6192e")

andy_teal <- "#009E73"
andy_yellow <- "#E69F00"
andy_blue <- "#0072B2"
andy_pink <- "#cc79a7"
andy_lightblue <- "#56B4E9"
andy_lightyellow <- "#F0E442"
andy_coolgrey <- "#8e9fbc"
andy_orange <- "#d55e00"
andy_red <- "#a6192e"

#########################
#' Create a andy-appropriate palette for your chart.
#'
#' @param n Numeric. The number of levels in your colour scale. Minimum value is
#'   1, maximum is 10. Using more than 6 is not recommended. If you don't
#'   specify `n`, a five-colour palette will be used, which may not look right.
#'   Specify `n`.
#'
#'   By default, n = 2 will give you light orange and dark orange. Use n = "2a"
#'   if you want light orange and red.
#' @param reverse Logical. FALSE by default. Setting to TRUE reverses the
#'   standard colour order. Standard colour order runs from light to dark. If
#'   you set reverse to TRUE, colours will run from dark to light.
#' @param faded Logical. FALSE by default. Setting to TRUE returns the faded
#'   variations of the standard colours.
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     andy_style() +
#'     scale_colour_manual(values = andy_pal(n = 3))
#'
#' p
#'
#' # Alternatively, use aig_colour_manual(), which is a wrapper
#' # around scale_colour_manual():
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'     geom_point() +
#'     andy_style() +
#'     andy_colour_manual(n = 3)
#'
#' p
#'
#' @export

andy_pal <- function(n = 0, reverse = FALSE, faded = FALSE) {
  
  if (n == 0) {
    n <- 5
    "Your chart will probably look better if you specify n in andy_pal()."
  }
  
  if (n > 6 & n <= 9) {
    warning("Using more than six colours is not recommended.")
  }
  
  if (n > 9 & n != "2a") {
    stop(paste0("You've requested ", n,
                " colours; andy_pal() only supports up to 9."))
  }
  
  if(isFALSE(faded)) {
    palette <- regular_palette(n)
  }
  
  if(isTRUE(faded)) {
    palette <- regular_palette(n)
  }
  
  if (isTRUE(reverse)) {
    palette <- rev(palette)
  }
  
  palette
}

regular_palette <- function(n) {
  
  if (n == 1) {
    palette <- andy_blue
  } else if (n == "2a") {
    palette <- c(andy_blue,
                 andy_red)
  } else if (n == 2) {
    palette <- c(andy_blue,
                 andy_yellow)
  } else if (n == 3) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal)
  } else if (n == 4) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink)
  } else if (n == 5) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink,
                 andy_lightblue)
  } else if (n == 6) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink,
                 andy_lightblue,
                 andy_lightyellow)
  } else if (n == 7) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink,
                 andy_lightblue,
                 andy_lightyellow,
                 andy_coolgrey)
  } else if (n == 8) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink,
                 andy_lightblue,
                 andy_lightyellow,
                 andy_coolgrey,
                 andy_orange)
  } else if (n == 9) {
    palette <- c(andy_blue,
                 andy_yellow,
                 andy_teal,
                 andy_pink,
                 andy_lightblue,
                 andy_lightyellow,
                 andy_coolgrey,
                 andy_orange,
                 andy_red)
  } 
  palette
}




#' Convenient functions to set aig-appropriate palettes
#'
#' @param n Numeric. The number of levels in your colour scale. Minimum value is
#'   1, maximum is 7.
#'
#' @param reverse Logical. FALSE by default. Setting to TRUE reverses the
#'   standard colour order.
#'
#' @param faded Logical. FALSE by default. Setting to TRUE returns faded
#'   variations of the standard colours.
#'
#' @param discrete Logical. TRUE by default. Setting to FALSE generates a
#'   continuous colour scale.
#'
#' @param palette Sets the colours that will form the continuous palette when
#'   discrete = FALSE. One of:
#'
#' \itemize{
##' \item{"full"}{The default. Red, dark orange, light orange, yellow, light
##' yellow}
##' \item{"full_f"}{ faded version of "full"}
##' \item{"light"}{ light
##' orange, yellow, light yellow}
##' \item{"dark"}{ red, dark orange, light orange}
##' \item{"diverging"}{ red, faded red, white, faded light orange, light orange}
##' \item{"grey"}{ grey 1, grey 2, grey 3, grey 4, grey 5}
##'}
#'
#' @param ... arguments passed to ggplot2 scales
#'
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(data = mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
#'    geom_point() +
#'    andy_colour_manual(n = 3) +
#'    andy_style()
#'
#' @name andy_colours
#' @aliases NULL
NULL

#' @rdname andy_colours
#' @import ggplot2
#' @export


andy_colour_manual <- function(n = 0,
                               reverse = FALSE,
                               discrete = TRUE,
                               faded = FALSE,
                               palette = "full", ...) {
  if (discrete) {
    return(
      ggplot2::scale_colour_manual(...,
                                   values = andy_pal(n = n,
                                                     reverse = reverse,
                                                     faded = faded))
    )
  }
  
  if (!discrete) {
    pal <- andy_palette(palette = palette, reverse = reverse)
    return(ggplot2::scale_color_gradientn(colours = pal(256), ...))
  }
}

#' @rdname andy_colours
#' @import ggplot2
#' @export

andy_fill_manual <- function(n = 0, reverse = FALSE,
                             discrete = TRUE,
                             faded = FALSE,
                             palette = "full", ...) {
  if (discrete) {
    return(
      ggplot2::scale_fill_manual(...,
                                 values = andy_pal(n = n,
                                                   reverse = reverse,
                                                   faded = faded))
    )
  }
  
  if (!discrete) {
    pal <- andy_palette(palette = palette, reverse = reverse)
    return(ggplot2::scale_fill_gradientn(colours = pal(256), ...))
  }
  
}
  
}
