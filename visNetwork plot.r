library(visNetwork)
library(RColorBrewer)
library(ggplot2)
library(devtools)




nodes <- read.csv("C:/Users/Daniel/Desktop/network plot tutorial/scott-nodes.csv", header=T, as.is=T)
links <- read.csv("C:/Users/Daniel/Desktop/network plot tutorial/scott-edges-no-id - Copy.csv", header=T, as.is=T)

head(nodes)
head(links)
nrow(nodes)
length(unique(nodes$Id))
unique(nodes$Attribute)
nrow(links)
nrow(unique(links[,c("from", "to")]))

pal3 <- brewer.pal(6, "Set1")


nodes$shape <- "dot"
nodes$title <- nodes$Label
nodes$color.border <- "black"
nodes$color.background <- pal3[nodes$Attribute]

links$width <- links$Value*2
links$color <- c("green", "purple", "black")

visNetwork(nodes, links)

#change for the sake of change