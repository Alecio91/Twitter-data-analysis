library(rtweet)
library(httpuv)
library(dplyr)

#per iniziare è necessario abilitare l'account Twitter per accedere alle APIs della piattaforma


## PRIMA PARTE - ESTRAZIONE DATI/ DATA RETRIVING ##

#estrazione dati da account leader europei

leaderEurop <- lookup_users(c("GiuseppeConteIT", "EmmanuelMacron", "BorisJohnson"))

head(leaderEurop)

#creaimo un dataframe con le colonne screen_name e follower_count

leaderEuropCount <- leaderEurop[,c("screen_name", "followers_count")]

head(leaderEuropCount)

leaderEurFollow <- sort(leaderEuropCount$followers_count, decreasing =TRUE)

leaderEurFollow <- leaderEuropCount %>%
  arrange(desc(followers_count))

head(leaderEurFollow)

#creiamo un dataframe con le colonne text e retweet counts

EurleadTxtRt <- leaderEurop[, c("text", "retweet_count")]

#ordiniamo i retweet

EurleadTxRtSort <- EurleadTxtRt %>%
  arrange(desc(retweet_count))
