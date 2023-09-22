
herring90Fit <- \(pattern=1, area=data.frame(x=c(1,6),y=c(1,6))) {
  # Start at the bottom left and build left to right, bottom to top
  x <- area[['x']][[1]]
  y <- area[['y']][[1]]
  horiTile <- makeTile(1,0.5)
  vertTile <- makeTile(0.5,1)
  while (y < area[['y']][[2]]) {
    increment <- FALSE
    if (pattern == 1) {
      # Vertical, Skip, Horizontal
      # Check if the first step can be completed
      if (checkTile(vertTile,area,x,y)) {
        checkDrawTile(vertTile,area,x,y)
        x <- x + 1
        checkDrawTile(horiTile,area,x,y)
        x <- x + 1
      } else {
        # If it cant then move on
        increment <- TRUE
      }
    } else if (pattern == 2) {
      # Skip, Horizontal, Vertical
      x <- x + 0.5
      if (x < area[['x']][[2]]) {
        checkDrawTile(horiTile,area,x,y)
        x <- x + 1
        checkDrawTile(vertTile,area,x,y)
        x <- x + 0.5
      } else {
        increment <- TRUE
      }
    } else if (pattern == 3) {
      # Horizontal, Vertical, Skip
      if (checkTile(horiTile,area,x,y)) {
        checkDrawTile(horiTile,area,x,y)
        x <- x + 1
        checkDrawTile(vertTile,area,x,y)
        x <- x + 1
      } else {
        increment <- TRUE
      }
    } else { # pattern == 4
      # Skip, Vertical, Skip, Horizontal
      x <- x + 0.5
      if (x < area[['x']][[2]]) {
        checkDrawTile(vertTile,area,x,y)
        x <- x + 1
        checkDrawTile(horiTile,area,x,y)
        x <- x + 0.5
      } else {
        increment <- TRUE
      }
    }
    if (increment) {
      # Go up a level
      y <- y + 0.5 # + getGroutWidth()
      x <- area[['x']][[1]]
      pattern <- pattern + 1
      if (pattern == 5) {
        pattern <- 1
      }
    }
  }
}
