# Questo è il primo script che useremo a lezione

# install.packages("raster")
library(raster)

# Settaggio cartella di lavoro
setwd("~/lab/") # Linux
# setwd("/Users/emma/desktop/lab") #mac
# setwd("C:/lab/") # windows

# import
l2011 <- brick("p224r63_2011.grd")
l2011

# plot
plot(l2011)

# https://www.r-graph-gallery.com/42-colors-names.html
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

# dev.off()

# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# plot della banda del blu - B1_sre
plot(l2011$B1_sre) # trinity
# or
plot(l2011[[1]]) # neo

plot(l2011$B1_sre)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre, col=cl)

# plot b1 from dark blue to blue to light blue
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col=clb)

# let's export the image and let it appear in the lab folder: kind of magic!
pdf("banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

png("banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# plot b2 from dark green to green to light green
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg)

# multiframe
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# export multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()

# exercise: revert the multiframe
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# let's plot the first four bands
par(mfrow=c(2,2))
# blue
plot(l2011$B1_sre, col=clb)
# green
plot(l2011$B2_sre, col=clg)
# red
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col=clr)
# NIR
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)

# Day #3

# Plot of l2011 in the NIR channel (NIR band)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)
# or:
plot(l2011[[4]])

# Landsat ETM+
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# plot RGB layers
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")

plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: build a multiframe with visible RGB
# (linear stretch) on top of false colours
# (histogram stretch)
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Exercise: upload the image from 1988
l1988 <- brick("p224r63_1988.grd")
l1988

par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")




# chiara inizia le lezioni
# il mio primo codice in Git Hub
# installare il raster package che si trova su virtuale
# abbiamo creato una cartella lab (su D: o su AC: o su dove vuoi, il percorso deve essere rapido) in cui ci abbiamo piazzato i dati del 2011

library(raster)

# Settaggio cartella di lavoro
# setwd("~/lab/") # Linux
# setwd("/Users/emma/desktop/lab") #mac
# setwd("C:/lab/") # windows

setwd("C:/lab/")

# nel mio caso sarà la scrittura per windows, e si aggiunge 
# le virgolette possono essere sostituite dalla ' al posto della doppia virgoletta "
# la cartella contiene foto di un'area di studio in Brasile, l'area di Parakanà, foresta che che nel tempo è stata ridotta incredibilmente per coltivazioni di banane, da foresta fluviale a land grabbing devastante
# cosa è successo nel tempo in questo ecosistema? lo vediamo da un mondo telerilevato
# lavoreremo con dati landsat (satellite): su virtuale c'è l'immagine del path di landsat (diverse orbite e strisciate effettuate dal satellite che vengono numerate)
# facciamo riferimento al reticolato rosso (path e row)
# i puntini invece sono i centri di ogni immagine, la terra viene divisa in raws (righe) in stile battaglia navale
# possiamo fare delle valutazioni comparative tra le immagini del 1998 e del 2011 considerando le stesse coordinate


# importare le immagine landsat su R 
# import dei dati attraverso una funzione all'interno del pacchetto raster: brick function
# questa funzione ci serve per compattare le rilevazioni dei diversi 7 sensori (7 bande)
# se usciamo da R come in questo caso (file raster fuori da R) devo segnare il nome del file che voglio importare tra virgolette "p224r63_2011_unmasked" estensione grd (grid)
# f2 (apre il file??) non ho capito
# premendo ctrl A seleziona l'intero testo

l2011 <- brick("nome file")
# segnando l2011 prima della funzione associamo a tutta la fase di importazione questo nome: l2011, in futuro potremo usare il nome invece che tutta la funzione

# andiamo a vedere graficamente i dati utilizzando la funzione: plot
plot(l2011)
# abbiamo la plottizzazione delle immagini
# la legenda accanto va di default dal bianco al verde (orrida), ogni grafico sta per la diversa banda considerata
# tutti gli oggetti che assorbono il blu: bianchi
# tutti gli oggetti che lo riflettono invece saranno: verdi
# utilizzeremo un sacco il grafico risultante dalla banda 4 near infrared, il grafico che risulta verdino
#cambiamo la scala di colori
