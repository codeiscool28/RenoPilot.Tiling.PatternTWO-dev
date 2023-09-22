
area <- data.frame(x = c(1, 3), y = c(1, 10))
stack_tile_line_square <- function(x, y, offset, area) {
  x_initial <- x
  is_offset_added <- TRUE
  
  while (y < area[['y']][[2]]) {
    x <- x_initial
    
    while (x < area[['x']][[2]]) {
      tile <- makeTile(1, 1)  # Changed dimensions for square tile
      
      # Check if tile fits within the area
      if (x + 1 > area[['x']][[2]] || y + 1 > area[['y']][[2]]) {
        break
      }
      
      if (checkTile(tile, area, x, y)) {
        checkDrawTile(tile, area, x, y)
        x <- x + 1 + getGroutWidth()
      } else {
        break
      }
    }
    
    # Check if the next row would fit within the area
    if (y + 1 + getGroutWidth() > area[['y']][[2]]) {
      break
    }
    
    y <- y + 1 + getGroutWidth()  # Changed from 0.5 to 1 to match the square height
    
    if (is_offset_added) {
      x_initial <- x_initial + offset
    } else {
      x_initial <- x_initial - offset
    }
    
    is_offset_added <- !is_offset_added
  }
}

# Modified draw_tile_line function for square tiles
draw_tile_line_square <- function(x, y, area) {
  while (TRUE) {
    tile <- makeTile(1, 1)  # Changed dimensions for square tile
    if (!checkTile(tile, area, x, y)) {
      break
    }
    checkDrawTile(tile, area, x, y)
    x <- x + 1 + getGroutWidth()  # Assuming getGroutWidth function returns a value
  }
}
