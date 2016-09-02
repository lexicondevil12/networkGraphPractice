library(visNetwork)
library(RColorBrewer)




nodes <- read.csv("scott-nodes.csv", header=T, as.is=T)
links <- read.csv("scott-edges-no-id - Copy.csv", header=T, as.is=T)

head(nodes)
head(links)
nrow(nodes)
length(unique(nodes$Id))
unique(nodes$Attribute)
nrow(links)
nrow(unique(links[,c("from", "to")]))

pal3 <- brewer.pal(6, "Set1")

visNetwork(nodes, links) %>%
  visNodes(shape = "dot",
           title = "Label",
           color.border = "black",
           color.background = Apal3) %>%
  visEdges(width = "Value",
           color = c("green", "purple", "grey"))


#change for the sake of change