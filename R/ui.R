#' Shiny app ui object.
#'
#' @desc It is used to load in ui header, sidebar, and body components.
#'
#' @import shiny.

source('./R/ui/header.R')
source('./R/ui/sidebar.R')
source('./R/ui/body.R')

# ui <- dashboardPage(
#   header = header(),
#   sidebar =  sidebar(),
#   body = body(),
#   skin = DASHBOARD_SKIN_COLOR
# )

ui = dashboardPage(
  header = shinyHeader(),
  sidebar = shinySidebar(),
  body = shinyBody(),
  skin = "blue"
)
