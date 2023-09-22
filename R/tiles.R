
scale <- \(input) {input / 10}

#' Tile Placement function
#'
#' @param shape shape specifications
#' @param x x co-ordinate
#' @param y y co-ordinate
#'
#' @export
tileShift <- \(shape, x, y) {
  data.frame(
    x = shape[['x']] + x,
    y = shape[['y']] + y
  )
}

findWindow <- \() {
  data.frame(
    xMin <- par('usr')[1:2][1],
    xMax <- par('usr')[1:2][2],
    yMin <- par('usr')[3:4][1],
    yMax <- par('usr')[3:4][2]
  )
}

getGroutWidth <- \() {
  0.1 # This can eventually be updated etc
}

makeTile <- \(width=0, height=0, type="Rectangle") {
  tileGen <- Tile.Generator()

  specifications <- list()
  specifications[['width']] <- width |> scale()
  if (!(type == "Diamond")) {
    specifications[['height']] <- height |> scale()
  }

  specifications |> tileGen[[type]]()
}

drawTile <- \(tile, x=0, y=0) {
  x <- x |> scale()
  y <- y |> scale()
  tile |> tileShift(x,y) |> polygon()
}

checkTile <- \(tile, area, x, y) {
  tile <- tile |> tileShift(x,y)
  # General Out of Bounds test
  !(any(tile[['x']] < area[['x']][[1]]) || any(tile[['x']] > area[['x']][[2]]) || any(tile[['y']] < area[['y']][[1]]) || any(tile[['y']] > area[['y']][[2]]))
  # any x is smaller than bottom x
  # OR, any x is bigger than top x
  # OR, any y is smaller than bottom y
  # OR, any y is bigger than top y
}

checkDrawTile <- \(tile, area, x, y) {
  if (checkTile(tile, area, x, y)) {
    tile |> drawTile(x,y)
  }
}
