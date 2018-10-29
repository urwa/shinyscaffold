#' launch shinyscaffold app.
#'
#' @return shiny app object.

launchApp <- function(){
  shinyApp(ui = ui, server = server)
}
