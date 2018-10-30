#' launch shinyscaffold app.
#'
#' @return shiny app object.
#'
#' @import shiny
#' @export

launchApp <- function(){
  shinyApp(ui = ui, server = server)
}
