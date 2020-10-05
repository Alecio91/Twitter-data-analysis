#esempio alternativo utilizzando il topic #Dark

DarkRetweet <- search_tweets("#Dark", n = 1000)

DarkTxtRt <- DarkRetweet[,c("text", "retweet_count")]

DartkTxtRtSort <- DarkTxtRt %>%
  arrange(desc(retweet_count))

#escludi tweet duplicati

DarkTwUnici <- unique(DartkTxtRtSort, by = "text")

head(DarkTwUnici, 10)


#tweet sul topic #Dark in lingua inglese

DarkTwEn <- search_tweets("#Dark", n = 1000, lang = "en")

DarkTxEnDf <- DarkTwEn[,c("text", "retweet_count")]

DarkTxEnSort <- DarkTxEnDf %>%
  arrange(desc(retweet_count))

DartkTwEnUnici <- unique(DarkTxEnSort, by = "text")

head(DartkTwEnUnici, 10)
