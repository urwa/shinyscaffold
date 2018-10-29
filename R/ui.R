#' Shiny app ui object.
#'
#' @description It is used to load in ui header, sidebar, and body components.

ui <- dashboardPage(
  header = shinyHeader(),
  sidebar = shinySidebar(),
  body = shinyBody(),
  skin = DASHBOARD_SKIN_COLOR
)
