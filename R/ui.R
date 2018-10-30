source('./R/ui/header.R')
source('./R/ui/sidebar.R')
source('./R/ui/body.R')

#' Shiny app ui object.
#'
#' @description It is used to load in ui header, sidebar, and body components.
#'
#' @import shiny
#' @import shinydashboard

ui <- dashboardPage(
  header = shinyHeader(),
  sidebar = shinySidebar(),
  body = shinyBody(),
  skin = DASHBOARD_SKIN_COLOR
)
