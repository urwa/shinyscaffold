#' Shiny app server object.
#'
#' @param input input provided by shiny app.
#' @param output output provided by shiny app.
#' @param session object to access session information.
#'
#' @import shiny
#' @export

server <- function (input, output, session) {

  # Setting up User Token
  observe({
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query[['userToken']])) {
      updateTextInput(session, "userToken", value = query[['userToken']])
    }
  })

  # Introduction
  output$Introduction.intro <- renderUI({ createIntroduction('Welcome!', 'Thank you for installing Shiny Scaffold', 'In order to access complete/partial menu items in the sidebar, type "full" or "partial" in Access Code.', 'In order to see custom report for sample data set, the User Code ranges from 1 - 100. Type a number from this range to see updated graphs/plots.','Thank you.') })

  # Simple Histogram
  output$simpleHist.intro <- renderUI({ HTML("Introduction - Simple Histogram") })

  output$simpleHist.desc  <- renderUI({ HTML("Description - Simple Histogram") })

  output$simpleHist.plot  <- renderPlot({ createHist(userToken = input$userToken, data = toydata$cont1, color = "#007ba7", xlabel = "Histogram x label") })

  # Multi Histogram
  output$multiHist.intro <- renderUI({ HTML("Introduction - Multi Histrogram") })

  output$multiHist.desc1 <- renderUI({ HTML("Description - Multi Histrogram for Dimension 1") })
  output$multiHist.desc2 <- renderUI({ HTML("Description - Multi Histrogram for Dimension 2") })
  output$multiHist.desc3 <- renderUI({ HTML("Description - Multi Histrogram for Dimension 3") })

  output$multiHist.plot1 <- renderPlot({ createHist(userToken = input$userToken, data = toydata$cont1, color = "#007ba7", xlabel = "Scores in comparison group") })
  output$multiHist.plot2 <- renderPlot({ createHist(userToken = input$userToken, data = toydata$cont2, color = "#007ba7", xlabel = "Scores in comparison group") })
  output$multiHist.plot3 <- renderPlot({ createHist(userToken = input$userToken, data = toydata$cont3, color = "#007ba7", xlabel = "Scores in comparison group") })

  # Simple Bar
  output$simpleBar.intro <- renderUI({ HTML("Introduction - Simple Bar") })

  output$simpleBar.desc  <- renderUI({ HTML("Description - Simple Bar") })

  output$simpleBar.plot  <- renderPlot({ createBar(userToken = input$userToken, data = toydata[,c("cont1","cont1_mean", "cont1_comp")], uniform = TRUE, color = "#355C7D", xlabel = "Simple Bar - x label") })

  # Multi Bar
  output$multiBar.intro <- renderUI({ HTML("Introduction - Multi Bar") })

  output$multiBar.desc1 <- renderUI({ HTML("Description - Multi Bar for Dimension 1") })
  output$multiBar.desc2 <- renderUI({ HTML("Description - Multi Bar for Dimension 2") })
  output$multiBar.desc3 <- renderUI({ HTML("Description - Multi Bar for Dimension 3") })

  output$multiBar.plot1 <- renderPlot({ createBar(userToken = input$userToken, data = toydata[,c("cont1","cont1_mean", "cont1_comp")], uniform = FALSE, color = c("#355C7D","#6C5B7B","#C06C84"), xlabel = "Scores in comparison group") })
  output$multiBar.plot2 <- renderPlot({ createBar(userToken = input$userToken, data = toydata[,c("cont2","cont2_mean", "cont2_comp")], uniform = FALSE, xlabel = "Scores in comparison group") })
  output$multiBar.plot3 <- renderPlot({ createBar(userToken = input$userToken, data = toydata[,c("cont3","cont3_mean", "cont3_comp")], uniform = TRUE, xlabel = "Scores in comparison group") })

  # Simple Radar
  output$simpleRadar.intro <- renderUI({ HTML("Introduction - Simple Radar") })

  output$simpleRadar.desc  <- renderUI({ HTML("Description - Simple Radar") })

  output$simpleRadar.plot  <- renderPlot({ createRadar(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], varlabels = c("dim1", "dim2", "dim3", "dim4")) })

  # Simple Radar W/ Comparison
  output$simpleRadarComp.intro <- renderUI({ HTML("Introduction - Simple Radar with Comparison") })

  output$simpleRadarComp.desc  <- renderUI({ HTML("Description - Simple Radar with Comparison") })

  output$simpleRadarComp.plot  <- renderPlot({ createRadarComp(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], dataComp = toydata[,c("cont1_mean","cont2_mean","cont3_mean", "cont4_mean")], legendColors = c("red","#007ba7"), varlabels = c("cont1_new","cont2_new","cont3_new", "cont4_new"), legendLabels = c("YOU","OTHERS")) })

  # Fancy Radar W/ Comparison
  output$fancyRadarComp.intro <- renderUI({ HTML("Introduction - Fancy Radar with Comparison")})

  # output$fancyRadarComp.desc1 <- renderUI({ input$fancyRadarCompTB})
  output$fancyRadarComp.desc1 <- renderUI({ HTML("Description - Fancy Radar with Comparison for Dimension 1") })
  output$fancyRadarComp.desc2 <- renderUI({ HTML("Description - Fancy Radar with Comparison for Dimension 2") })
  output$fancyRadarComp.desc3 <- renderUI({ HTML("Description - Fancy Radar with Comparison for Dimension 3") })
  output$fancyRadarComp.desc4 <- renderUI({ HTML("Description - Fancy Radar with Comparison for Dimension 4") })

  output$fancyRadarComp.plot1 <- renderPlot({ createRadarComp(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], dataComp = toydata[,c("cont1_mean","cont2_mean","cont3_mean", "cont4_mean")], legendColors = c("red","#007ba7"), dim = "cont1_new", varlabels = c("cont1_new","cont2_new","cont3_new", "cont4_new"), legendLabels = c("YOU","OTHERS")) })
  output$fancyRadarComp.plot2 <- renderPlot({ createRadarComp(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], dataComp = toydata[,c("cont1_mean","cont2_mean","cont3_mean", "cont4_mean")], legendColors = c("red","#007ba7"), dim = "cont2_new", varlabels = c("cont1_new","cont2_new","cont3_new", "cont4_new"), legendLabels = c("YOU","OTHERS")) })
  output$fancyRadarComp.plot3 <- renderPlot({ createRadarComp(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], dataComp = toydata[,c("cont1_mean","cont2_mean","cont3_mean", "cont4_mean")], legendColors = c("red","#007ba7"), dim = "cont3_new", varlabels = c("cont1_new","cont2_new","cont3_new", "cont4_new"), legendLabels = c("YOU","OTHERS")) })
  output$fancyRadarComp.plot4 <- renderPlot({ createRadarComp(userToken = input$userToken, data = toydata[,c("cont1","cont2","cont3", "cont4")], dataComp = toydata[,c("cont1_mean","cont2_mean","cont3_mean", "cont4_mean")], legendColors = c("red","#007ba7"), dim = "cont4_new", varlabels = c("cont1_new","cont2_new","cont3_new", "cont4_new"), legendLabels = c("YOU","OTHERS")) })

  # Simple Line
  output$simpleLine.intro <- renderUI({ HTML("Introduction - Simple Line") })

  output$simpleLine.desc  <- renderUI({ HTML("Description - Simple Line") })

  output$simpleLine.plot  <- renderPlot({ createLine(userToken = input$userToken, data = toydata[,c("ts_var1_V1_1","ts_var1_V1_2","ts_var1_V1_3", "ts_var1_V1_4", "ts_var1_V1_5",
                                                                                                    "ts_var1_V2_1","ts_var1_V2_2","ts_var1_V2_3", "ts_var1_V2_4", "ts_var1_V2_5",
                                                                                                    "ts_var2_V1_1","ts_var2_V1_2","ts_var2_V1_3", "ts_var2_V1_4", "ts_var2_V1_5",
                                                                                                    "ts_var2_V2_1","ts_var2_V2_2","ts_var2_V2_3", "ts_var2_V2_4", "ts_var2_V2_5")], xlength = 5) })

  # Fancy Line
  output$fancyLine.intro <- renderUI({ HTML("Introduction - Fancy Line") })

  output$fancyLine.desc1  <- renderUI({ HTML("Description - Fancy Line for Dimension 1") })
  output$fancyLine.desc2  <- renderUI({ HTML("Description - Fancy Line for Dimension 2") })
  output$fancyLine.desc3  <- renderUI({ HTML("Description - Fancy Line for Dimension 3") })
  output$fancyLine.desc4  <- renderUI({ HTML("Description - Fancy Line for Dimension 4") })

  output$fancyLine.plot1  <- renderPlot({ createLine(userToken = input$userToken, data = toydata[,c("ts_var1_V1_1","ts_var1_V1_2","ts_var1_V1_3", "ts_var1_V1_4", "ts_var1_V1_5",
                                                                                                    "ts_var1_V2_1","ts_var1_V2_2","ts_var1_V2_3", "ts_var1_V2_4", "ts_var1_V2_5",
                                                                                                    "ts_var2_V1_1","ts_var2_V1_2","ts_var2_V1_3", "ts_var2_V1_4", "ts_var2_V1_5",
                                                                                                    "ts_var2_V2_1","ts_var2_V2_2","ts_var2_V2_3", "ts_var2_V2_4", "ts_var2_V2_5")], xlength = 5, dim = "line1") })
  output$fancyLine.plot2  <- renderPlot({ createLine(userToken = input$userToken, data = toydata[,c("ts_var1_V1_1","ts_var1_V1_2","ts_var1_V1_3", "ts_var1_V1_4", "ts_var1_V1_5",
                                                                                                    "ts_var1_V2_1","ts_var1_V2_2","ts_var1_V2_3", "ts_var1_V2_4", "ts_var1_V2_5",
                                                                                                    "ts_var2_V1_1","ts_var2_V1_2","ts_var2_V1_3", "ts_var2_V1_4", "ts_var2_V1_5",
                                                                                                    "ts_var2_V2_1","ts_var2_V2_2","ts_var2_V2_3", "ts_var2_V2_4", "ts_var2_V2_5")], xlength = 5, dim = "line2") })
  output$fancyLine.plot3  <- renderPlot({ createLine(userToken = input$userToken, data = toydata[,c("ts_var1_V1_1","ts_var1_V1_2","ts_var1_V1_3", "ts_var1_V1_4", "ts_var1_V1_5",
                                                                                                    "ts_var1_V2_1","ts_var1_V2_2","ts_var1_V2_3", "ts_var1_V2_4", "ts_var1_V2_5",
                                                                                                    "ts_var2_V1_1","ts_var2_V1_2","ts_var2_V1_3", "ts_var2_V1_4", "ts_var2_V1_5",
                                                                                                    "ts_var2_V2_1","ts_var2_V2_2","ts_var2_V2_3", "ts_var2_V2_4", "ts_var2_V2_5")], xlength = 5, dim = "line3") })
  output$fancyLine.plot4  <- renderPlot({ createLine(userToken = input$userToken, data = toydata[,c("ts_var1_V1_1","ts_var1_V1_2","ts_var1_V1_3", "ts_var1_V1_4", "ts_var1_V1_5",
                                                                                                    "ts_var1_V2_1","ts_var1_V2_2","ts_var1_V2_3", "ts_var1_V2_4", "ts_var1_V2_5",
                                                                                                    "ts_var2_V1_1","ts_var2_V1_2","ts_var2_V1_3", "ts_var2_V1_4", "ts_var2_V1_5",
                                                                                                    "ts_var2_V2_1","ts_var2_V2_2","ts_var2_V2_3", "ts_var2_V2_4", "ts_var2_V2_5")], xlength = 5, dim = "line4") })

  # Simple Scatter
  output$simpleScatter.intro <- renderUI({ HTML("Introduction - Simple Scatter") })

  output$simpleScatter.desc <- renderUI({ HTML("Description - Simple Scatter") })

  output$simpleScatter.plot <- renderPlot({ createScatter(userToken = input$userToken, data = toydata[, c("cont1", "cont2")]) })

  # Fancy Scatter
  output$fancyScatter.intro <- renderUI({ HTML("Introduction - Fancy Scatter")})

  output$fancyScatter.desc <- renderUI({ HTML("Description - Fancy Scatter")})

  output$fancyScatter.plot <- renderPlot({ createScatter(userToken = input$userToken, data = toydata[, c(input$scatter_X, input$scatter_Y)]) })

  output$fancyScatter.input <- renderUI({ lapply(c("X","Y"), function(x){ selectInput(inputId = paste0("scatter_", x), label = paste0("Parameter ", x), choices = c("cont1", "cont2", "cont3", "cont4"), selected = "cont1" )}) })

  # Simple Pie
  output$simplePie.intro <- renderUI({ HTML("Introduction - Simple Pie") })

  output$simplePie.desc <- renderUI({ HTML("Description - Simple Pie") })

  output$simplePie.plot <- renderPlot({ createPie(userToken = input$userToken, data = toydata[,c("cat1","cat2","cat3","cat4")], colors <- c("#007ba7", "#2d6384", "#5a4b61", "#86333e")) })

  # Simple Box
  output$simpleBox.intro <- renderUI({ HTML("Introduction - Simple Box") })

  output$simpleBox.desc  <- renderUI({ HTML("Description - Simple Box") })

  output$simpleBox.plot  <- renderPlot({ createBox(userToken = input$userToken, dataSelf = toydata[, c("fb360_dim1_self")], dataComp1 = toydata[, c("fb360_dim1_other1", "fb360_dim1_other2", "fb360_dim1_other3")], dataComp1Mean = toydata[, c("fb360_dim1_other_mean")], dataComp2 = toydata[, c("fb360_dim2_other1", "fb360_dim2_other2", "fb360_dim2_other3")], dataComp2Mean = toydata[, c("fb360_dim2_other_mean")]) })

  # Multi Box
  output$multiBox.intro <- renderUI({ HTML("Introduction - Multi Box") })

  output$multiBox.desc1 <- renderUI({ HTML("Description - Multi Box for Dimension 1") })
  output$multiBox.desc2 <- renderUI({ HTML("Description - Multi Box for Dimension 2") })
  output$multiBox.desc3 <- renderUI({ HTML("Description - Multi Box for Dimension 3") })

  output$multiBox.plot1 <- renderPlot({ createBox(userToken = input$userToken, dataSelf = toydata[, c("fb360_dim1_self")], dataComp1 = toydata[, c("fb360_dim1_other1", "fb360_dim1_other2", "fb360_dim1_other3")], dataComp1Mean = toydata[, c("fb360_dim1_other_mean")], dataComp2 = toydata[, c("fb360_dim2_other1", "fb360_dim2_other2", "fb360_dim2_other3")], dataComp2Mean = toydata[, c("fb360_dim2_other_mean")]) })
  output$multiBox.plot2 <- renderPlot({ createBox(userToken = input$userToken, dataSelf = toydata[, c("fb360_dim2_self")], dataComp1 = toydata[, c("fb360_dim2_other1", "fb360_dim2_other2", "fb360_dim2_other3")], dataComp1Mean = toydata[, c("fb360_dim2_other_mean")], dataComp2 = toydata[, c("fb360_dim3_other1", "fb360_dim3_other2", "fb360_dim3_other3")], dataComp2Mean = toydata[, c("fb360_dim3_other_mean")]) })
  output$multiBox.plot3 <- renderPlot({ createBox(userToken = input$userToken, dataSelf = toydata[, c("fb360_dim3_self")], dataComp1 = toydata[, c("fb360_dim3_other1", "fb360_dim3_other2", "fb360_dim3_other3")], dataComp1Mean = toydata[, c("fb360_dim3_other_mean")], dataComp2 = toydata[, c("fb360_dim1_other1", "fb360_dim1_other2", "fb360_dim1_other3")], dataComp2Mean = toydata[, c("fb360_dim1_other_mean")]) })

  # Simple Quotes
  output$simpleQuotes.intro <- renderUI({ HTML("Introduction - Simple Quotes") })

  output$simpleQuotes.desc <- renderUI({ createQuotes(userToken = input$userToken, data = toydata[, c("par1","par2")]) })

  # Full Network
  output$fullNetwork.intro <- renderUI({ HTML("Introduction - Full Network") })

  output$fullNetwork.param <- renderUI({ HTML("Parameters - Full Network") })

  output$fullNetwork.plot  <- renderForceNetwork({ createNetwork(userToken = input$userToken, inputNetwork = toynetwork, inputData = toydata, networkType = "FULL", label = "nName", size = input$fullNetSize, color = input$fullNetColor, opacity = input$fullNetOpacity) })

  # Small Network
  output$smallNetwork.intro <- renderUI({ HTML("Introduction - Small Network") })

  output$smallNetwork.param <- renderUI({ HTML("Parameters - Small Network") })

  output$smallNetwork.plot  <- renderForceNetwork({ createNetwork(userToken = input$userToken, inputNetwork = egonets, inputData = egonets_attrs, networkType = "SMALL", label = "nName", size = input$smallNetSize, color = input$smallNetColor, opacity = input$smallNetOpacity) })

}
