###################
# global.R
#
# Anything you want shared between your ui and server, define here.
###################

# clear workspace
# rm(list = ls())

#load libraries
library(shiny)
library(shinydashboard)
library(igraph)
library(plyr)
library(dplyr)
library(ggplot2)
library(reshape)
library(reshape2)
library(Cairo)
library(RColorBrewer)
library(networkD3)
library(roxygen2)

# load data and functions
load('./data/toydata.rda')
load('./data/toynetwork.rda')
load('./data/egonets.rda')
load('./data/egonets_attrs.rda')
load('./data/smallnets.rda')
load('./data/smallnets_attrs.rda')

# set options
# usecairo - for smooth graphics
# stringsAsFactors - to create data frames withOUT factors
options(shiny.usecairo = TRUE, stringsAsFactors = FALSE)

# set defaults
# column of users passwords
userPassword <- toydata$ID

# set global variables
utils::globalVariables("userPassword")

# load all functions
source('./R/functions.R')
