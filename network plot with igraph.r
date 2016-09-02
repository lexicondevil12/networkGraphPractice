library(igraph)
library(network)
library(sna)
library(ndtv)
library(visNetwork)
library(networkD3)
library(RColorBrewer)

nodes <- read.csv("scott-nodes.csv", header=T, as.is=T)
links <- read.csv("scott-edges-no-id.csv", header=T, as.is=T)

head(nodes)
head(links)
nrow(nodes)
length(unique(nodes$Id))
unique(nodes$Attribute)
nrow(links)
nrow(unique(links[,c("source", "target")]))

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T)
E(net)
V(net)$Label
net[5,7]
net[1,]
plot(net)

# plot 1
plot(net, edge.arrow.size=.4, edge.curved=.1)

# plot 2 with vertex.label=V(net)$Label
plot(net, edge.arrow.size=.2, edge.color="orange",
     vertex.color="orange", vertex.frame.color="#ffffff",
     vertex.label=V(net)$Label, vertex.label.color="black")

# plot 3 - colors determined by entity type
pal3 <- brewer.pal(6, "Set3")
colrs <- pal3
V(net)$color <- colrs[V(net)$Attribute]

# edge width based on relationship value
E(net)$width <- E(net)$Value

# change arrow size and edge color
E(net)$arrow.size <- 0.2
plot(net, vertex.label=V(net)$Label, vertex.label.color="black")

#change for the sake of change

