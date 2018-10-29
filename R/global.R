###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

# clear workspace
rm(list = ls())

#load libraries
library(shiny)
library(shinyjs)
library(shinydashboard)
library(shinythemes)
library(networkD3)
library(igraph)
library(htmltools)
library(dplyr)
library(ggplot2)
library(fmsb)
library(reshape)
library(reshape2)
library(Cairo)
library(RColorBrewer)
library(roxygen2)

# load data and functions
load('./R/toydata_full.RData')
source('./R/functions.R')

#set options
options(shiny.usecairo = TRUE)

# set defaults

# column of users passwords
userPassword <- toydata$ID