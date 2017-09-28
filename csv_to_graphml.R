library(igraph)

#Set working directory for file import with eg. /Users/name/Documents/PowerGrids
setwd("directory you want to work in")

#Import Edge Data in .csv format and export in Graphml Format
csv_to_graphml <- function(filename){
  "Take a CSV edge list, convert it to graphml format
  and export in graphml form"
  f = file(filename, open = "r")
  edge_list = as.matrix(read.csv(f, header = FALSE))
  close(f)
  graph = graph_from_edgelist(edge_list)
  export_filename = paste(unlist(strsplit(filename, ".", fixed = TRUE)), 
                          "graphml", sep = ".")
  write_graph(graph, export_filename, format = "graphml")
}
