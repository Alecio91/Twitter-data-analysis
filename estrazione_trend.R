trends_disp <- trends_available()

head(trends_disp)

#estraiamo trends da Berlino

trend_Berlin <- get_trends("Berlin")

head(trend_Berlin$trend)

#aggreghiamo trends e tweet_volume

TopicTrendsIt <- trend_IT %>%
  select(trend, tweet_volume) %>%
  arrange(desc(tweet_volume))
