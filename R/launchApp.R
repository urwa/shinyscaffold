#' launch shinyscaffold app.
#'
#' @return shiny app object.
#'
#' @import shiny shinydashboard reshape2 ggplot2 dplyr RColorBrewer Cairo networkD3 roxygen2
#' @export

launchApp <- function(){
  shinyApp(ui = ui, server = server)
}
