###################
# functions.R
#
# - UI FUNCTIONS
# -- SIDEBAR
# -- BODY
# - SERVER FUNCTIONS
#
##################
# dashboard skin color. Choose from ("blue", "black", "green", "purple", "red", "yellow")
DASHBOARD_SKIN_COLOR <- "blue"
# default color of all plots
COLOR_DEFAULT_PLOT <- "#007ba7"
COLOR_DEFAULT_USER <- "red"
# default color of boxes headers. Choose from ("primary", "success", "info", "warning", "danger")
STATUS_COLOR <- "primary"

################################################################
# UI FUNCTIONS
################################################################

##########################################
## SIDEBAR
##########################################

#' Convert input text into HTML.
#'
#' @param content The text as a character string.
#'
#' @return HTML code snippet of the input string as a padded paragraph with custom font color.

AddHelpText <- function(content){
  helpText(
    HTML(
      paste0('<p style="color:#3c8dbc; padding: 0px 15px;">', content, '</p>')
    )
  )
}

##########################################
## BODY
##########################################

#' Add Introduction tab in the body.
#'
#' @param tabId A unique id to identify the tab.
#' @param mainTitle The header of the tab.
#' @param introText The introduction of the tab.
#'
#' @return HTML code snippet to add an intro tabItem to main body.

AddIntroductionTab <- function (tabId, mainTitle, introText){
  tabItem(tabName = tabId,
          fluidRow(
            box(title = mainTitle, width = 12,
                status = STATUS_COLOR, solidHeader = TRUE,
                htmlOutput(introText)
            )
          )
  )
}

#' Add a simple tab in the body.
#'
#' @param tabId A unique id to identify the tab.
#' @param inputBox The check if input box should be added.(optional)
#' @param mainTitle The header of the tab.
#' @param introText The introduction of the tab.
#' @param descTitle The title of the description box. (optional)
#' @param descList The description of the plot.
#' @param descBoxWidth The width of the description box. (optional)
#' @param plotTitle The title of the plot box. (optional)
#' @param plotList The plot of the tab.
#' @param plotBoxWidth The width of the plot box. (optional)
#' @param inputTitle The title of input box. (optional)
#' @param inputList The inputs of the plot. (optional)
#' @param inputBoxWidth The width of the input box. (optional)
#'
#' @return HTML code snippet to add a simple tabItem to main body with 3 boxes:
#' * An introduction box
#' * A description box
#' * A plot box

AddSimpleTab <- function (tabId, inputBox = FALSE,
                          mainTitle, introText,
                          descTitle="Description", descList, descBoxWidth = 7,
                          plotTitle = "Plot", plotList, plotBoxWidth = 5,
                          inputTitle = "Inputs", inputList = NULL, inputBoxWidth = 3){
  if(!inputBox){
    tabItem(tabName = tabId,
            fluidRow(
              box(
                title = mainTitle, width = 12,
                status = STATUS_COLOR, solidHeader = TRUE,
                htmlOutput(introText)
              )
            ),
            fluidRow(
              box(title = descTitle, width = descBoxWidth,
                  status = STATUS_COLOR, solidHeader = TRUE,
                  htmlOutput(descList)
              ),
              box(title = plotTitle, width = plotBoxWidth,
                  status = STATUS_COLOR, solidHeader = TRUE,
                  plotOutput(plotList)
              )
            )
    )
  } else{
    descBoxWidth = 4;
    tabItem(tabName = tabId,
            fluidRow(
              box(
                title = mainTitle, width = 12,
                status = STATUS_COLOR, solidHeader = TRUE,
                htmlOutput(introText)
              )
            ),
            fluidRow(
              box(title = descTitle, width = descBoxWidth,
                  status = STATUS_COLOR, solidHeader = TRUE,
                  htmlOutput(descList)
              ),
              box(title = inputTitle, width = inputBoxWidth,
                  status = STATUS_COLOR, solidHeader = TRUE,
                  htmlOutput(inputList)
              ),
              box(title = plotTitle, width = plotBoxWidth,
                  status = STATUS_COLOR, solidHeader = TRUE,
                  plotOutput(plotList)
              )
            )
    )
  }
}

#' Add multiple tabs in the body.
#'
#' @param tabId A unique id to identify the tab.
#' @param mainTitle The header of the tab.
#' @param introText The introduction of the tab.
#' @param headList The list of headings of the dimensions.
#' @param descList The list of descriptions of the plots.
#' @param plotList The list of plots of the tab.
#' @param descTitle The title of the description box. (optional)
#' @param plotTitle The title of the plot box. (optional)
#' @param descBoxWidth The width of the description box. (optional)
#' @param plotBoxWidth The width of the plot box. (optional)
#'
#' @return HTML code snippet to add a multiple tabItem to main body with 3 boxes:
#' * An introduction box
#' * A description box with multiple tabs
#' * A plot box with multiple tabs

AddMultiTab <- function (tabId, mainTitle, introText,
                         headList, descList, plotList,
                         descTitle = "Description", plotTitle = "Plot",
                         descBoxWidth = 7, plotBoxWidth = 5){
  tabItem(tabName = tabId,
          fluidRow(
            box(title = mainTitle, width = 12,
                status = STATUS_COLOR, solidHeader = TRUE,
                htmlOutput(introText)
            )
          ),
          fluidRow(
            do.call(tabBox,
                    c(id = paste0(tabId, "TB"), width = 12, side = "left",
                      lapply(1:length(headList), function(i){
                        tabPanel(
                          title = headList[[i]],
                          box(title = descTitle, width = descBoxWidth,
                              status = STATUS_COLOR, solidHeader = TRUE,
                              htmlOutput(descList[[i]])
                          ),
                          box(title = plotTitle, width = plotBoxWidth,
                              status = STATUS_COLOR, solidHeader = TRUE,
                              plotOutput(plotList[[i]])
                          )
                        )
                      })
                    )
            )
          )
  )
}

#' Add a network tab in the body.
#'
#' @param tabId A unique id to identify the tab.
#' @param mainTitle The header of the tab.
#' @param introText The introduction of the tab.
#' @param paramTitle The title of the input parameters box. (optional)
#' @param paramList The input widgets of the plot.
#' @param paramBoxWidth The width of the input parameters box. (optional)
#' @param plotTitle The title of the plot box. (optional)
#' @param plotList The plot of the tab.
#' @param plotBoxWidth The width of the plot box. (optional)
#' @param plotHeight The height of the plot in px. (optional)
#' @param sizeId A unique id to identify size input.
#' @param sizeList A named list of drop-down options for size of nodes. Values should be column names of input data.
#' @param colorId A unique id to identify color input.
#' @param colorList A named list of drop-down pptions for color of nodes. Values should be column names of input data.
#' @param opacityId A unique id to identify opacity input.
#'
#' @return HTML code snippet to add a network tabItem to main body with 3 boxes:
#' * An introduction box
#' * An input parameters box
#' * A plot box

AddNetworkTab <- function(tabId,
                          mainTitle, introText,
                          paramTitle = "Parameters", paramList, paramBoxWidth = 3,
                          plotTitle = "Plot", plotList, plotBoxWidth = 9, plotHeight = "500px",
                          sizeId, sizeList, colorId, colorList, opacityId){
  tabItem(tabName = tabId,
          fluidRow(
            box(
              title = mainTitle, width = 12,
              status = STATUS_COLOR, solidHeader = TRUE,
              htmlOutput(introText)
            )
          ),
          fluidRow(
            box(title = paramTitle, width = paramBoxWidth,
                status = STATUS_COLOR, solidHeader = TRUE,
                selectInput(sizeId, "Size By", choices = sizeList),
                selectInput(colorId, "Color By", choices = colorList),
                sliderInput(opacityId, "Opacity", 0, 1, 1)
            ),
            box(title = plotTitle, width = plotBoxWidth,
                status = STATUS_COLOR, solidHeader = TRUE,
                forceNetworkOutput(plotList, width = "100%", height = plotHeight)
            )
          )
  )
}

################################################################
# SERVER FUNCTIONS
################################################################

#' Add introduction to the tab with multiple paragraphs.
#'
#' @param ... Any number of characters strings to be converted into separate HTML paragraphs.
#'
#' @return HTML code snippet for single/multiple paragraphs.

createIntroduction <- function(...) {
  content <- list(...)
  contentHTML <- ''
  for (i in seq_along(content)){
    contentHTML <- paste0(contentHTML, '<p>', content[[i]], '</p>')
  }
  return (HTML(contentHTML))
}


#' Create a histogram plot.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data A 1-dimensional array/ data frame of data.
#' @param color The color of histogram bars.
#' @param xlabel The x-axis label of the histogram.
#'
#' @return A histogram plot with vertical line to show user position.

createHist <- function (userToken, data, color, xlabel){
  hist(data,
       col = color,
       main = NULL,
       xlab = xlabel
  )
  if(userToken %in% userPassword){
    lineValue <- data[userPassword == userToken]
    if(!is.na(lineValue)){
      abline(v = lineValue, col = "red", lwd = 2)
    }
  }
}


#' Theme for ggplot bar plot

barTheme <- function(){
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"),
        axis.title.y = element_blank(),
        legend.position="bottom",
        axis.text =element_text(size=12),
        text =element_text(size=12),
        axis.text.x=element_blank(),
        legend.text=element_text(size=12))
}

#' create a bar plot either single bar for each column or ...
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param uniform The color of the bars, same for all bars or not.
#' @param color A single color variable or a vector of colors for the plot.
#' @param xlabel The x-axis label.
#' @param xlabs The x-axis tick labels.
#' @param single A boolean variable for single value for bar when TRUE, and mean column values when FALSE. (optional)
#' @param ylims The limits of y axis. (optional)
#' @param grouped A boolean variable for grouped bars. (optional)
#' @param grouplabs A character vector of labels of grouped bars. (optional)
#' @param groupsets An numeric vector showing which column belongs to which group. (optional)
#' @param legendtitle The title of the legend. (optional)
#'
#' @return a bar plot.

createBar <- function (userToken, data, uniform, color, xlabel, xlabs = NULL, single = FALSE, ylims = NULL,
                       grouped = FALSE, grouplabs = NULL, groupsets = c(1), legendtitle = "LEGEND"){

  varnames <- colnames(data)

  # check if limits are set, else set to 0 - 1.1 * data
  if(is.null(ylims)){
    ylims <- c(0, 1.1 * max(data, na.rm = T))
  }

  # check if x-axis tick labels are set, set them for columns of each group.
  if(!is.null(xlabs)){
    colnames(data) <- rep(xlabs, length(unique(groupsets)))
  }

  # check if your user token exist in user password column, needed for filtering the data.
  if(userToken %in% userPassword){
    # if single value (for a particular user) is needed, filter that row.
    if(single == TRUE) {
      data <- data[which(userPassword == userToken),]
    }
    else {
      # calculate column means for all rows; removing NAs from data.
      data <- data.frame(rbind(colMeans(data, na.rm = TRUE)))
    }
    # set NAs to 0.
    data[is.na(data)] <- 0

    # if bars are to be grouped.
    if(grouped){
      # format data into rows for each group.
      tempdata <- data.frame(matrix(unlist(data), nrow = length(unique(groupsets)), byrow = TRUE))
      colnames(tempdata) <- xlabs
      tempdata <- cbind(grouplabs, tempdata)
      data <- melt(tempdata, id.vars = 'grouplabs')
    } else{
      data <- melt(data)
      }

    # if colors of all bars is same.
    if(uniform){
      # if color is not set.
      if(missing(color)){
        color = COLOR_DEFAULT_PLOT
      }
      fillColor = color
    } else {
      if(missing(color)){
        color = brewer.pal(length(data), "Paired")
      }
      fillColor = data$variable
    }

    # plot if NO grouping.
    if(!grouped){
      ggplot(data, aes(x = variable, y = value, fill = fillColor)) +
        geom_bar(stat = "identity") +
        scale_fill_manual(legendtitle, values = color) +
        barTheme() +
        guides(fill = guide_legend(nrow = length(varnames)))+
        labs(x = xlabel) + lims(y = ylims)

    } else if(grouped){
        ggplot(data, aes(x = grouplabs, y = value, fill = fillColor)) +
          geom_bar(position = "dodge", stat = "identity") +
          scale_fill_manual(legendtitle, values = color) +
          barTheme() +
          guides(fill = guide_legend(nrow = length(varnames) / length(unique(groupsets))))+
          labs(x = xlabel) + lims(y = ylims)
    }
  }
}

#' Helper function for radar plot.
#'
#' @param theta TO-DO.
#' @param start TO-DO.
#' @param direction TO-DO.
#'
#' @return TO-DO.
coord_radar <- function(theta='x', start=0, direction=1){
  match.arg(theta, c('x','y'))
  ggproto(
    NULL, CoordPolar,
    theta=theta, r=ifelse(theta=='x','y','x'),
    start=start, direction=sign(direction),
    is_linear=function() TRUE)
}

#' Create a Radar Plot.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param legendColor The color of plot. (optional)
#' @param ylimMin Lower limit of y-axis. (optional)
#' @param ylimMax Upper limit of y-axis. (optional)
#' @param legendLabel A legend value for radar. (optional)
#' @param varlabels A character vector for axis tick labels.
#'
#' @return A ggplot radar plot.

createRadar <- function (userToken, data, legendColor = COLOR_DEFAULT_USER, ylimMin = 0, ylimMax = NULL,
                         legendLabel = "YOU", varlabels){

  # set max limit of y-axis from data if not defined.
  if(is.null(ylimMax)){
    ylimMax <- max(data, na.rm = TRUE)
  }

  pointLegend = legendColor
  names(pointLegend) = legendLabel

  # if user exists
  if(userToken %in% userPassword){

    # filter user-specific data
    data <- data[userToken == userPassword, ]

    # set column names
    colnames(data) <- varlabels

    # format data into long format
    data <- melt(data)

    # make the plot
    ggplot(data, aes(x = variable, y = value, group = 1)) +
      ylim(ylimMin, ylimMax) +
      geom_point(aes(colour = legendLabel), size = 3) +
      geom_polygon(colour = COLOR_DEFAULT_USER, size = 1, fill = NA) +
      scale_colour_manual("", values = pointLegend)  +
      coord_radar() +
      theme_bw() +
      theme(axis.line = element_blank(),
            axis.text.x = element_text(size = 12, hjust = 100),
            axis.text.y = element_blank(),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            legend.position = "top",
            panel.background = element_blank(),
            panel.border = element_blank(),
            plot.background = element_blank())
  }
}

#' Create 2 radar plots for comparison.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param dataComp An input data frame for comparison.
#' @param legendColors A vector of both colors for radar plots. (optional)
#' @param dim Manually selected dimension (tab) highlighted when the relevant tab is selected. (optional)
#' @param ylimMin Lower limit of y-axis. (optional)
#' @param ylimMax Upper limit of y-axis. (optional)
#' @param legendLabels A character vector for legend values for two radars.
#' @param varlabels A character vector for axis labels.
#'
#' @return Two radar plots with different colors.

createRadarComp <- function (userToken, data, dataComp, legendColors = c(COLOR_DEFAULT_USER, COLOR_DEFAULT_PLOT),
                             dim = " ", ylimMin = 0, ylimMax = NULL, legendLabels, varlabels){

  # set max limit of y-axis from data if not defined.
  if(is.null(ylimMax)){
    ylimMax <- max(data, dataComp, na.rm = TRUE)
  }

  pointLegend = c(legendColors[1], legendColors[2])
  names(pointLegend) = c(legendLabels[1], legendLabels[2])

  if(userToken %in% userPassword){
    # filter row data for a specific user.
    data <- data[userToken == userPassword,]
    dataComp <- dataComp[userToken == userPassword,]

    # set column names.
    colnames(data) <- varlabels

    # format data into long format.
    data <- melt(data)
    dataComp <- melt(dataComp)

    # combine both data frames.
    data <- data.frame(data, valueComp = dataComp$value)

    # highlight data for selected tab by font weight and font size.
    xlab_face <- ifelse(data$variable == dim, "bold", "plain")
    xlab_size <- ifelse(data$variable == dim, 15, 12)

    # plot the radars.
    ggplot(data, aes(x = variable)) +
      ylim(ylimMin, ylimMax) +
      geom_point(aes(y = value, group = 1, colour = legendLabels[1]), size = 3) +
      geom_point(aes(y = valueComp, group = 1, colour = legendLabels[2]), size = 3) +
      geom_polygon(aes(y = value, group = 1), colour = legendColors[1], size = 1, fill = NA) +
      geom_polygon(aes(y = valueComp, group = 1), colour = legendColors[2], size = 1, fill = NA) +
      scale_colour_manual("", values = pointLegend)  +
      coord_radar() +
      theme_bw() +
      theme(axis.line = element_blank(),
            axis.text.x = element_text(size = xlab_size, hjust = 100, face = xlab_face),
            axis.text.y = element_blank(),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            panel.background = element_blank(),
            panel.border = element_blank(),
            plot.background = element_blank(),
            legend.position = "top",
            legend.title = element_blank(),
            legend.text = element_text(size = 10))+
      guides(color = guide_legend(nrow = 2))
  }
}

#' Melt user-specific filtered data.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#'
#' @return A two-columns data frame with variable named as colx and column 2 containing values.

meltLineData <- function(userToken, data){
  data <- data[userToken == userPassword, ]

  # rename column names to colX
  for(i in 1:length(data)){
    names(data)[i] <- paste0('col',i)
  }
  data <- melt(data)
  return (data)
}

#' Format raw data into plot-able multi-line plot data.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param xlength Th length of x-axis/ The number of variables.
#' @param dimnames A chacter vector representing line labels in the legend. (optional)
#'
#' @return A data frame with first column as x-axis tick labels and one line per column for the rest of the columns.

formatLineData <- function (userToken, data, xlength, dimnames = NULL){
  df_end <- 0
  df_num <- length(data)/xlength
  dataList <- list()
  for (i in 1:df_num){
    df_start <- df_end + 1
    df_end   <- df_start + xlength - 1
    dataList[[i]] <- meltLineData(userToken, data[, df_start:df_end])

    # rename value column to lineX
    if(is.null(dimnames)){
      names(dataList[[i]])[names(dataList[[i]]) == 'value'] <-  paste0('line', i)
    } else {
      names(dataList[[i]])[names(dataList[[i]]) == 'value'] <-  dimnames[i]
    }
  }

  data <- Reduce(function(x, y) merge(x, y, all = TRUE, by = "variable"), dataList, accumulate = FALSE)
  return (data)
}

#' Create line plot with user-specific line highlighted.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param xlength The length of x-axis/ The number of variables.
#' @param dim Manually selected dimension (tab) highlighted when the relevant tab is selected. (optional)
#' @param xlabs A character vector of x-axis tick labels with length equal to xlength. (optional)
#' @param dimnames A chacter vector representing line labels in the legend. (optional)
#' @param legendtitle Title of the legend. (optional)
#' @param ylimMin Lower limit of y-axis. (optional)
#' @param ylimMax Upper limit of y-axis. (optional)
#' @param xrotate If TRUE, rotate x-axis tick labels by 90 degree. (optional)
#'
#' @return A plot with multiple lines.

createLine <- function(userToken, data, xlength, dim = "", xlabs = NULL, dimnames = NULL,
                       legendtitle = "", ylimMin = 0, ylimMax = NULL, xrotate = FALSE){

  if(is.null(ylimMax)){
    ylimMax <- 1.1 * max(data, na.rm = TRUE)
  }

  if(xrotate){
    gg_angle = 90
    gg_hjust = 1
  } else {
    gg_angle = 0
    gg_hjust = 0.5
  }

  if(userToken %in% userPassword){
    data <- formatLineData(userToken, data, xlength, dimnames = dimnames)
    names(data)[names(data) == 'variable'] <- 'xlabel'

    if(!is.null(xlabs)){
      data$xlabel <- xlabs
    }

    data <- melt(data, id.vars = "xlabel")
    data$line_size <- ifelse(data$variable == dim, 3, 1)

    ggplot(data, aes(x = xlabel, y = value, group = variable, color = variable)) +
      ylim(ylimMin, ylimMax) +
      geom_line(aes(size = line_size)) +
      geom_point(aes(size = line_size)) +
      scale_size(range = c(1,3)) +
      theme_bw() +
      theme(axis.text = element_text(size=12),
            axis.ticks = element_blank(),
            axis.title = element_blank(),
            panel.background = element_blank(),
            panel.border = element_blank(),
            plot.background = element_blank(),
            axis.line = element_line(colour = "black"),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            legend.text = element_text(size = 12),
            legend.position ="bottom",
            axis.text.x = element_text(angle = gg_angle, hjust = gg_hjust)
           ) +
      guides(size = FALSE, colour = guide_legend(nrow = xlength)) +
      labs(color = legendtitle) +
      scale_x_discrete(limits = xlabs)
  }
}

#' Create Scatter Plot.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#'
#' @return A scatter plot with highlighted user point.
#'
createScatter <- function(userToken, data){

  names(data) <- c("x", "y")

  data$color <- ifelse(userToken == userPassword, "YOU", "OTHERS")
  colorScale <- c("YOU" = COLOR_DEFAULT_USER, "OTHERS" = COLOR_DEFAULT_PLOT)

  ggplot(data, aes(x, y)) +
    geom_point(size = 3,  aes(colour = color)) +
    scale_color_manual("", values = colorScale) +
    theme_bw() +
    theme(axis.text = element_text(size=12),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          panel.background = element_blank(),
          panel.border = element_blank(),
          plot.background = element_blank(),
          axis.line = element_line(colour = "black"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.text = element_text(size = 12),
          legend.position ="bottom")

}

#' Create Pie Chart.
#' @param userToken A user-specific password to show user position on the plot.
#' @param data An input data frame.
#' @param colors The vector representing colors of pie-slices.
#'
#' @return A pie chart with percentage labels.
#'
createPie <- function (userToken, data, colors){

  if(userToken %in% userPassword){
    data <- data[userToken == userPassword,]
    data <- melt(data)

    data <- data %>%
      mutate(per=`value`/sum(`value`)) %>%
      arrange(desc(variable))

    data$label <- percent(data$per)

    ggplot(data = data)+
      geom_bar(aes(x = "", y = per, fill = variable), stat = "identity", width = 1, colour = "white") +
      coord_polar("y", start = 0)+
      theme_void()+
      geom_text(aes(x = 1, y = cumsum(per) - per/2, label = label), colour = "white") +
      scale_fill_manual(values = colors) +
      theme(legend.title = element_blank(),
            legend.position = "bottom",
            legend.text = element_text(size = 10))
  }
}

#' Create box plot of self versus others.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param dataSelf Data representing self value.
#' @param dataOthers Data representing others values.
#' @param dataOthersMean Data representing mean value among others.
#' @param xlims Limits of x axis. (optional)

createBox <- function(userToken, dataSelf, dataOthers, dataOthersMean, xlims = NULL){

  if(!userToken %in% userPassword){
    return()
  }

  if(is.null(xlims)){
    xlims <- c(min(dataSelf, min(dataOthers)), max(dataSelf, max(dataOthers)))
  }

  dataSelf <- as.data.frame(dataSelf)[userPassword == userToken,]
  dataOthers <- as.data.frame(dataOthers)[userPassword == userToken,]
  dataOthersMean <- as.data.frame(dataOthersMean)[userPassword == userToken,]

  dataSelf <- data.frame(ylab = "Self", y = 2, value = dataSelf)
  dataOthers <- data.frame(ylab = "Others", y = 1, value = melt(dataOthers)$value)
  dataOthersMean <- data.frame(ylab = "Others Mean", y = 1, value = dataOthersMean)

  data <- rbind(dataSelf, dataOthers, dataOthersMean)

  ggplot(data, aes(x = value, y = y)) +
    geom_point(aes(color = ylab, fill = ylab, shape = ylab), size = 10, stroke = 0.5) +
    geom_rect(fill = "grey50", xmin = -Inf, xmax = Inf, ymin = 1.7, ymax = 2.3, alpha = 0.05) +
    geom_rect(fill = "grey50", xmin = -Inf, xmax = Inf, ymin = 0.7, ymax = 1.3, alpha = 0.05) +
    lims(x = xlims) +
    scale_color_manual(values=rep("black",3)) +
    scale_fill_manual(values=c(COLOR_DEFAULT_PLOT, COLOR_DEFAULT_PLOT, COLOR_DEFAULT_USER)) +
    scale_shape_manual(name="ylab", values = c(21:23)) +
    scale_y_discrete(labels=c("1" = "Others", "2" = "Self"), limits=c("1","2","1")) +
    labs(color = "ylab", shape = "ylab") +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank(),
          axis.title = element_blank(),
          legend.position ="bottom",
          axis.text = element_text(size=10),
          text = element_text(size=12),
          axis.ticks = element_blank(),
          legend.text=element_text(size=12),
          legend.title = element_blank(),
          legend.key=element_blank(),
          legend.background = element_blank())
}

#################################
# NETWORK PLOTS
#################################

#' Make network data usable in the form of edge list and node list.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param inputNetwork A network as an adjacency with edges showns as matrix values of 1 and nodes as row/column names.
#' @param inputData The data of all the nodes in the above network.
#'
#' @return Edge list and Node list of the given data.

dataNetwork <- function (userToken, inputNetwork, inputData){

  # for small network
  if(!is.null(userToken)){

    if(!userToken %in% userPassword){
      return ();
    }

    #  small network names are characters, small network atrributes names are integers
    inputNetwork <- inputNetwork[[as.integer(userToken)]]
    inputData <- inputData[[as.integer(userToken)]]

  }

  # create edgeList
  edgeNetwork <- graph.adjacency(inputNetwork)
  edgeList <- get.edgelist(edgeNetwork)
  edgeList <- data.frame(edgeList, rep (1,nrow(edgeList)), stringsAsFactors = FALSE)
  colnames(edgeList) <- c("SourceName", "TargetName", "Weight")
  getNodeID <- function(x){which(x == V(edgeNetwork)$name) - 1}
  edgeList <- plyr::ddply(edgeList, .variables = c("SourceName", "TargetName", "Weight"),
                          function (x) data.frame(SourceID = getNodeID(x$SourceName),
                                                  TargetID = getNodeID(x$TargetName), stringsAsFactors = FALSE))

  #create nodeList
  nodeData <- inputData
  #nodeData$ID <- nodeData$ID - 1 # can not remember what this is for. commenting until further realization.
  nodeList <- data.frame(nName = as.character(V(edgeNetwork)$name), nodeData, uniform = rep(1,nrow(nodeData)), stringsAsFactors = FALSE)

  outNodeoutEdge <- list("edgeList" = edgeList, "nodeList" = nodeList)

  return (outNodeoutEdge)
}


#' Create a full network picture from network data.
#'
#' @param userToken A user-specific password to show user position on the plot.
#' @param inputNetwork Input network in the form of Adjacency Matrix.
#' @param inputData A data frame of attributes of nodes of inputNetwork.
#' @param networkType Network type to be created. Either "FULL" or "SMALL".
#' @param size Column used to define the size of nodes. (optional)
#' @param color COlumn used to define color of nodes. (optional)
#' @param label Column used to define label of nodes.
#' @param legend Boolean variable to show/not show the legend. (optional)
#' @param opacity opacity of nodes (optional)
#'
#' @return  NetworkD3 dynamic graph.

createNetwork <- function (userToken, inputNetwork, inputData, networkType, size = "uniform", color = "nNameNew", label, legend = FALSE, opacity = 1){

  userTokenVal <- userToken

  if(networkType == "FULL"){
    userTokenVal <- NULL
  }

  outList <- dataNetwork(userTokenVal, inputNetwork, inputData)

  if(is.null(outList)){
    return ();
  }

  nl <- outList$nodeList
  el <- outList$edgeList

  nl$nNameNew <- nl[[label]]

  if(networkType == "FULL"){
    if(userToken %in% userPassword){
      curUserName <- nl[[label]][userPassword == userToken]
      nl[nl[[label]] == curUserName,]$nNameNew <- "YOU"
      nl[nl[[label]] != curUserName,]$nNameNew <- ""
    }
  }

  networkD3::forceNetwork(Links = el, # data frame that contains info about edges
                          Nodes = nl, # data frame that contains info about nodes
                          Source = "SourceID", # ID of source node
                          Target = "TargetID", # ID of target node
                          Value = "Weight", # value from the edge list (data frame) that will be used to value/weight relationship amongst nodes
                          NodeID = "nNameNew", # value from the node list (data frame) that contains node description we want to use (e.g., node name)
                          Nodesize = size,  # value from the node list (data frame) that contains value we want to use for a node size
                          Group = color,  # value from the node list (data frame) that contains value we want to use for node color
                          #height = 5000, # Size of the plot (vertical)
                          #width = 5000,  # Size of the plot (horizontal)
                          #linkColour = edges_col # edge colors
                          fontSize = 20, # Font size
                          legend = legend,
                          linkDistance = networkD3::JS("function(d) { return 180 * d.value; }"), # Function to determine distance between any two nodes, uses variables already defined in forceNetwork function (not variables from a data frame)
                          linkWidth = networkD3::JS("function(d) { return d.value; }"),# Function to determine link/edge thickness, uses variables already defined in forceNetwork function (not variables from a data frame)
                          opacity = opacity, # opacity
                          zoom = TRUE, # ability to zoom when click on the node
                          bounded = TRUE,
                          opacityNoHover = 1) # opacity of labels when static
}
