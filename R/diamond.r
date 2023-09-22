

#' Diamond Single Line
#'
#' @param num_tiles number of tiles in a row
#' @param x start X
#' @param y start Y
#'
#' @export
#'
#' @examples
#' plot.new(); diamondLine(8,0,0)
diamondLine <- function(num_tiles, x, y){
    for (i in 1:num_tiles){
      x <- x + 0.5 # x+half tile, so tile doesn't go out of bounds
      makeTile(1,type="Diamond") |> drawTile(x,y)
      x <- x + 0.5 + getGroutWidth()
    }
}

#' Diamond Multi Line
#'
#' @param num_tiles number of tiles in a row
#' @param vert number of tile rows stacked
#' @param x start X
#' @param y start Y
#'
#' @export
#'
#' @examples
#' stackTiles(8,8,0,0)
#' 

stackTiles <- function(num_tiles, vert, x, y){ 
    for (i in 1:vert){
      if (i %% 2 == 0){
      diamondLine(num_tiles, x, y)
      x <- x - 0.55 
      y <- y - 0.55 
      }
    else {
      diamondLine(num_tiles, x, y)
      x <- x + 0.55
      y <- y - 0.55 
    }
      y <- y + 1 + getGroutWidth()
    }
}
