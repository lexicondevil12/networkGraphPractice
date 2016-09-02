library(visNetwork)
library(RColorBrewer)
library(igraph)
library(dplyr)

nodes <- read.csv("scott-nodes.csv", header = T, as.is = T)
links <- read.csv("scott-edges-no-id.csv", header = T, as.is = T)

head(nodes)
head(links)

str(nodes)
str(links)

glimpse(nodes)
glimpse(links)

length(unique(nodes$id))
unique(nodes$Attribute)
nrow(links)
nrow(unique(links[,c("source", "target")]))
