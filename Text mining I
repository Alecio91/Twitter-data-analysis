## TEXT MINING E WORDCLOUD ##

library(qdapRegex)
library(tm)
library(qdap)
library(rjava) #installarlo e caricarlo solo se si riscontrano problemi con la versione di Java in utilizzo
library(RColorBrewer)
library(ggplot2)
library(topicmodels)

covid19 <- search_tweets("#covid19", n = 1000, include_rts = F, lang = "en")

#preleviamo la colonna text e la salviamo come dataframe

covid19text <- covid19$text

head(covid19text)

#rimuoviamo gli url dal testo

covid19noUrl <- rm_twitter_url(covid19text)

head(covid19noUrl,5)

#rimuovere i caratteri speciali, punteggiatura e numeri

covid19noSp <- gsub("[^A-Za-z]", " ", covid19noUrl)

head(covid19noSp, 5)

#convertire il testo in corpus


covidcrp <- covid19noSp %>%
  VectorSource() %>%
  Corpus()


head(covidcrp, 10)

#estraggo il terzo elemento della colonna content del corpus

covidcrp[[3]]$content

#convertiamo tutto il testo in minuscolo

covid19min <- tm_map(covidcrp, tolower)

covid19min[[3]]$content


#controlliamo le stopwords in inglese

stopwords("en")

#controlliamo le stopwords in italiano

stopwords("it")

#rimuoviamo stop words dal corpus

covid19stpwrd <- tm_map(covid19min, removeWords, stopwords("en"))

covid19stpwrd[[3]]$content

#rimuoviamo spazi dal corpus pulito

covid19final <- tm_map(covid19stpwrd, stripWhitespace)

covid19final[[3]]$content

#estraggo la frequenza delle parole


frequenzacovid <- freq_terms(covid19final, 40)

head(frequenzacovid, 10)


#creiamo vettore con parole personalizzate da usare come stop words

parolepers <- c("s", "amp", "t", "can", "now")

#applichiamolo al nostro corpus

freq_Coviddef <- tm_map(covid19final, removeWords, parolepers) 

frequenzacovid_def <- freq_terms(freq_Coviddef, 10)

head(frequenzacovid_def, 10)

#creiamo un dataframe con i termini che hanno una frequenza superiore a 50

top25term <- subset(frequenzacovid_def, FREQ > 50)

head(top25term)


#visutalizziamo i termini con frequenza >50

ggplot(top25term, aes(x = reorder(WORD, -FREQ), y = FREQ)) +
  geom_bar(stat = "identity", fill = "cadetblue3") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  xlab("Termini") + ylab("Frequenza")+ 
  labs(title = "Termini con frequenza maggiore di 50")


#creiamo una wordcloud con i termini più utilizzati nella ricerca precedente


wordcloud(freq_Coviddef, min.freq = 50, colors = "blue", scale = c(3, 0.5), 
          random.order = FALSE)


wordcloud(freq_Coviddef, max.words = 25, colors = brewer.pal(5, "Dark2"),
          scale = c(2.5, 1), random.order = FALSE)


