getwd()
prova<-read.csv("prova.csv", header=T, sep=";")
head(prova)
library(tm) 
library(reshape2)
library(ggplot2)
library(SnowballC)
library(wordcloud)


#Primeiro eu carrego os dados em um Corpus (uma coleção de documentos) que é a estrutura de dados principal usada pelo tm.

library(tm) 
createCorpus <- function(filepath) {
  conn <- file(filepath, "r")
  fulltext <- readLines(conn)
  close(conn)
  
  vs <- VectorSource(fulltext)
  Corpus(vs, readerControl=list(readPlain, language="en", load=TRUE))
}

news_corpus <- createCorpus("C:/dadosR/mineracao/prova.csv")

# criar uma matriz de termo-documento a partir de um corpus: os elementos dessa 
#matriz representam a ocorrência de um termo (uma palavra ou um n-grama) em um documento do corpus.

dtm <- DocumentTermMatrix(news_corpus)   
dtm.matrix <- as.matrix(dtm)
wordcount <- colSums(dtm.matrix)
topten <- head(sort(wordcount, decreasing=TRUE), 6)

library(reshape2)
library(ggplot2)

# O gráfico abaixo mostra um histograma das dez palavras mais frequentes no corpus.
 dfplot <- as.data.frame(melt(topten))
 dfplot$word <- dimnames(dfplot)[[1]]
 dfplot$word <- factor(dfplot$word,
                       levels=dfplot$word[order(dfplot$value,
                                                decreasing=TRUE)])
 
 fig <- ggplot(dfplot, aes(x=word, y=value)) + geom_bar(stat="identity")
 fig <- fig + xlab("Palavras")
 fig <- fig + ylab("Frequência")
print(fig)


#Criando uma núvem de palavras

install.packages("wordcloud")
library(wordcloud)

set.seed(142) # O comando set.seed garante que os resultados obtidos possam ser reproduzidos em qualquer computador.
wordcloud(names(wordcount), wordcount, min.freq=25)
wordcloud(names(wordcount), wordcount, min.freq=25, colors=brewer.pal(6, "Dark2"))
wordcloud(names(wordcount), wordcount, max.words=100, rot.per=0.2, colors=brewer.pal(6, "Dark2"))

