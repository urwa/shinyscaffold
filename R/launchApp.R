#' launch shinyscaffold app.
#'
#' @return shiny app object.
#'
#' @import shiny shinydashboard reshape2 ggplot2 dplyr RColorBrewer Cairo
#' @export

launchApp <- function(){
  shinyApp(ui = ui, server = server)
}

