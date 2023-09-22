
#' Tile Generator
#' @export
Tile.Generator <- \() {
  generators <- list()
  generators[['Diamond']] <- \(specifications) {
    data.frame(
      x = c(0,(specifications[['width']]/2),0,(0-(specifications[['width']]/2)),0),
      y = c(0,(specifications[['width']]/2),specifications[['width']],(specifications[['width']]/2),0)
    )
  }
  generators[['Rectangle']] <- \(specifications) {
    data.frame(
      x = c(0,specifications[['width']],specifications[['width']],0,0),
      y = c(0,0,specifications[['height']],specifications[['height']],0)
    )
  }
  return(generators)
}
