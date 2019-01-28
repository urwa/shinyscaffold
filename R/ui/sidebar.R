#'  shinydashboard UI sidebar.
#'
#'  @return dashboardSidebar object.
#'  @export
#'
shinySidebar <- function () {
  dashboardSidebar(
    AddHelpText("ADD_HELP_TEXT_HERE"),
    sidebarMenu(
      id = "tabs",
      menuItem("INTRODUCTION", tabName = "intro"),
      conditionalPanel("input.accessToken === 'partial'",
                       sidebarMenu(id = 'partial',
                                   menuItem("HISTOGRAMS",
                                            menuSubItem("SIMPLE HISTOGRAM", tabName = "simpleHist"),
                                            menuSubItem("MULTI HISTOGRAM", tabName = "multiHist")
                                            )
                                   )),
      conditionalPanel("input.accessToken === 'full'",
                      sidebarMenu(id = 'full',
                                  menuItem("HISTOGRAMS",
                                           menuSubItem("SIMPLE HISTOGRAM", tabName = "simpleHist"),
                                           menuSubItem("MULTI HISTOGRAM", tabName = "multiHist")
                                           ),
                                  menuItem("BARS",
                                           menuSubItem("SIMPLE BAR", tabName = "simpleBar"),
                                           menuSubItem("MULTI BAR", tabName = "multiBar")
                                           ),
                                  menuItem("RADARS",
                                           menuSubItem("SIMPLE RADAR", tabName = "simpleRadar"),
                                           menuSubItem("SIMPLE RADAR W/ COMP", tabName = "simpleRadarComp"),
                                           menuSubItem("FANCY RADAR W/ COMP", tabName = "fancyRadarComp")
                                           ),
                                  menuItem("LINES",
                                           menuSubItem("SIMPLE LINE", tabName = "simpleLine"),
                                           menuSubItem("FANCY LINE", tabName = "fancyLine")
                                           ),
                                  menuItem("SCATTER",
                                           menuSubItem("SIMPLE SCATTER", tabName = "simpleScatter"),
                                           menuSubItem("FANCY SCATTER", tabName = "fancyScatter")
                                           ),
                                  menuItem("PIE",
                                           menuSubItem("SIMPLE PIE", tabName = "simplePie")
                                           ),
                                  menuItem("BOXES",
                                           menuSubItem("SIMPLE BOX", tabName = "simpleBox"),
                                           menuSubItem("MULTI BOX", tabName = "multiBox")
                                           ),
                                  menuItem("NETWORKS",
                                           menuSubItem("FULL NETWORK", tabName = "fullNetwork"),
                                           menuSubItem("SMALL NETWORK", tabName = "smallNetwork")
                                           )
                                  )),
      textInput(inputId = "userToken", label = "User Code", value = "Enter your token here."),
      textInput(inputId = "accessToken", label = "Access Code", value = "Show/Hide Version.")
    )
  )
}
