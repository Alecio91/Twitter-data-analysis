## MAPPATURA TWEET ##

library(rtweet)
library(httpuv)
library(maps)

ElSh <- search_tweets("#ElShaarawy", n = 15000, lang = "it", include_rts = F)

head(ElSh$coords_coords)

#estrazione dati sulla geolocalizzazione tweet

ElShGeo <- lat_lng(ElSh)

ElShGeo$coords_coords

#escludiamo le righe che non hanno valori lat e lng

ElShGeodef <- na.omit(ElshGeo[,c("lat","lng")])

head(ElShGeodef$lat, 10)


