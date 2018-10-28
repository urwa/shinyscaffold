#' launch shinyscaffold app.
#'
#' @return shiny app object.
#'
#' @import shiny.

launchApp <- function(){
  shinyApp(ui = ui, server = server)
}
