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

# load data and functions
load('./data/toydata.rda')
load('./data/toynetwork.rda')

#set options
options(shiny.usecairo = TRUE)

# set defaults
# column of users passwords
userPassword <- toydata$ID

# set global variables
utils::globalVariables("userPassword")

source('./R/functions.R')
