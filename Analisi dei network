## ANALISI DEI NETWORK IN ENTRATA (IN-DEGREE) E USCITA (OUT-DEGREE)

library(igraph)

TwtMicr <- search_tweets("#Microsoft", n = 1500, include_rts = TRUE)

#creiamo un dataframe contentente screen_name e retweet_screen_name

MicrDf <- TwtMicr[,c("screen_name", "retweet_screen_name")]

head(MicrDf, 10)

#rimuoviamo i valori NA

MicrNa <- MicrDf[complete.cases(MicrDf),]

head(MicrNa, 10)

#trasformiamo l'oggetto in matrice

MicrMatrx <- as.matrix(MicrNa)

#creiamo il network dei retweet


MicrNetRet <- graph_from_edgelist(el = MicrMatrx, directed = TRUE)

#visualizziamo il network

print.igraph(MicrNetRet)


MuskOutDegreeOut <- degree(MicrNetRet, mode = c("out"))

MuskOutDegree

out_degreesc <- sort(MuskOutDegree, decreasing = TRUE)

out_degreesc[1:3]

#calcoliamo il betwenness scores del network e ordiniamoli

MicrBetw <- betweenness(MicrNetRet, directed = TRUE)

MicrBetWSort <- MicrBetw %>%
  sort(decreasing = TRUE) %>%
  round()

MicrBetWSort[1:5]

#visualizziamo il network

set.seed(1234)

plot(MicrNetRet, vertex.size = 13, vertex.color = "darkslategray1", 
     edge.arrow.size = 0.3,
     edge.color = "black", 
     vertex.label.cex = 0.3, 
     vertex.label.color = "darkviolet")


#impostiamo la dimensione dei vertici in base al livello di out-degree

outDeg <- degree(MicrNetRet, mode = c("out"))

#assegnamo un valore superiore a 0 per la dimensione dei vertici

dim_vert <- (outDeg * 2) + 10

#assegnamo dim_vert all'argomento della funzione plot

plot(MicrNetRet, vertex.size = dim_vert, vertex.color = "darkslategray1", 
     edge.arrow.size = 0.2,
     edge.color = "black", 
     vertex.label.cex = 0.1, 
     vertex.label.color = "darkviolet")
