library(visNetwork)
library(RColorBrewer)
library(igraph)
library(dplyr)

nodes <- read.csv("scott-nodes.csv", header = T, as.is = T)
links <- read.csv("scott-edges-no-id.csv", header = T, as.is = T)

#visNetwork requires source and target columns to be named 'from' and 'to'
colnames(links) <- c("from", "to", "value")

head(nodes)
head(links)
nrow(nodes)
length(unique(nodes$Id)) # attribute corresponds to the type of entity
unique(nodes$Attribute)
nrow(links)
nrow(unique(links[,c("from", "to")]))

pal3 <- brewer.pal(6, "Set1")


nodes$shape <- "dot"
nodes$title <- nodes$Label
nodes$color.border <- "black"
nodes$color.background <- pal3[nodes$Attribute]

# links$width <- links$Value*2
links$color <- c("green", "purple", "black")

visNetwork(nodes, links)
