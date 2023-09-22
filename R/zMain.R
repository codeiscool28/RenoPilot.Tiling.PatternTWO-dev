# This file is used to test and display the generated patterns.
#   Note that it needs to be the last alphabetically to work

plot.new()

# Diamond Tile Function
#stackTiles(8, 8, 0, 0)

# Subway Tile Function
stack_tile_line(1, 1, 0.5, area = area)

# Square Tile Function
#stack_tile_line_square(1, 1, 0.5, area = area)

# Herringbone Tile function
#herring90Fit()

#drawBox(x = 0, y = 0, width = 0.5, height = 1)
#drawGrout(x = 0, y = 0, width = 0.5, height = 1)
#drawPoint(x = 0, y = 0, pch = 5, size = 1)

# Polygon Tile Test
#specs <- data.frame(x = c(0,0.05,0.05,0,0),y = c(0,0,0.1,0.1,0)) |> tileShift(0.99, -0.04)
#polygon(specs)

# Polygon Grout Test
#specs <- data.frame(x = c(0,0.01,0.01,-0.05,-0.05,0,0),y = c(0,0,0.11,0.11,0.1,0.1,0)) |> tileShift(0.05, 0)
#polygon(specs, col = "gray")

#myGrout <- data.frame(x = c(0,0.01,0.01,-0.05,-0.05,0,0),y = c(0,0,0.11,0.11,0.1,0.1,0)) |> tileShift(0.05, 0)
#myArea <- data.frame(x = c(0,1), y = c(0,0.15))
#print(checkGrout(myGrout,myArea))
