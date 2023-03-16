# installare il pacchetto raster
install.packages("raster")
library(raster)

# settaggio cartella di lavoro: bisogna invertire la barretta
setwd(C:/Users/chiara/Desktop/landsat 2011)
getwd()

# import
l2011 <- brick("p224r63_2011_masked.grd")
l2011

# plot, vediamo graficamente i dati
plot(l2011)

# cambiamo la scala di colori: riflettanza degli oggetti secondo una differente lunghezza d'onda
cl <- colorRampPalette(c("red", "orange", "yellow"))(100)
plot(l2011, col=cl)

# vogliamo visualizzare solo la prima banda
plot(l2011$B1_sre)
plot(l2011[[1]], col=cl)

# cambiamo scala di colori nella banda selezionata
plot(l2011$B1_sre, col=cl)
plot(l2011[[1]], col=cl) 

# posso assegnare la banda dell'infrarosso ad un oggetto 
nir <- l2011$B1_sre

# il codice che risulta è molto più snello
plot(nir, col=cl)
