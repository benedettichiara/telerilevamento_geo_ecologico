# Questo è il primo script che useremo a lezione

# install.packages("raster")
library(raster)
#selezionare Italy (milano) poiché molto stabile

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

# sarebbe meglio un path più corto tipo setwd("C:/lab/")
setwd("C:/Users/chiara/Desktop/landsat 2011")
getwd()

# nel mio caso sarà la scrittura per windows, e si aggiunge 
# le virgolette possono essere sostituite dalla ' al posto della doppia virgoletta "
# la cartella contiene foto di un'area di studio in Brasile, l'area di Parakanà, foresta che che nel tempo è stata ridotta incredibilmente per coltivazioni di banane, da foresta fluviale a land grabbing devastante
# cosa è successo nel tempo in questo ecosistema? lo vediamo da un mondo telerilevato
# lavoreremo con dati landsat (satellite): su virtuale c'è l'immagine del path di landsat (diverse orbite e strisciate effettuate dal satellite che vengono numerate)
# facciamo riferimento al reticolato rosso (path e row)
# i puntini invece sono i centri di ogni immagine, la terra viene divisa in raws (righe) in stile battaglia navale
# possiamo fare delle valutazioni comparative tra le immagini del 1998 e del 2011 considerando le stesse coordinate
# bisogna invertire le barre, da \ nel codice devono essere tutte /
# getwd ci serve per verificare se va tutto bene

# importare le immagine landsat su R 
# import dei dati attraverso una funzione all'interno del pacchetto raster: brick function
# questa funzione ci serve per compattare le rilevazioni dei diversi 7 sensori (7 bande)
# se usciamo da R come in questo caso (file raster fuori da R) devo segnare il nome del file che voglio importare tra virgolette "p224r63_2011_unmasked" estensione grd (grid)
# f2 (apre il file??) non ho capito
# premendo ctrl A seleziona l'intero testo

# l2011 <- brick("nome file")
l2011 <- brick("p224r63_2011_masked.grd")
# segnando l2011 prima della funzione associamo a tutta la fase di importazione questo nome: l2011, in futuro potremo usare il nome invece che tutta la funzione
# nel nome del file p sta per path e r sta per riga e ci da le "coordinate" dell'immagine
#class: raster brick
#dimension e resolution information
#info sulle coordinate
#sistema di riferimento (WGS84). proiezione utm e fuso (22), nel nostro caso
#source, nome dell'immagine
#names sta per i nomi delle varie bande dell'immagine: banda 1 blu, 2 verde, 3 del rosso e 4 dell'infrarosso vicino
#valori minimi e massimi di riflettanza

# andiamo a vedere graficamente i dati utilizzando la funzione: plot
plot(l2011)
# abbiamo la plottizzazione delle immagini
# la legenda accanto va di default dal bianco al verde (orrida), ogni grafico sta per la diversa banda considerata
# tutti gli oggetti che assorbono il blu: bianchi
# tutti gli oggetti che lo riflettono invece saranno: verdi
# utilizzeremo un sacco il grafico risultante dalla banda 4 near infrared, il grafico che risulta verdino

#cambiamo la scala di colori: riflettanza degli oggetti secondo una differente lunghezza d'onda
# per cambiare colori usiamo la funzione: colorRampPalette(), non usare rosso-verde perché i daltonici non saprebbero riconoscerli (leggi articolo "scientific maps should reach everyone)
cl <- colorRampPalette(c("red", "orange", "yellow"))(100) #100 sono le fumature 
# ("red", "orange", "yellow") si tratta di tre elementi vettore: abbiamo bisogno di una funzione che li combini (c)
# tra questi tre colori posso avere un sacco di diverse gradazioni, fuori dalle parentesi metto il numero delle gradazioni/sfumature che voglio
# metto le virgolette per segnare i colori poiché questi in R sono immagazzinati direttamente con le virgolette
# R software che è sensibile al minuscolo o maiuscolo
# cl <- assegnazione della funzione coloretc ad un oggetto

#vediamo graficamente i dati secondo la nostra nuova colorazione
plot(l2011, col=cl)
# per aggiungere argomenti (aggiungere color and palet ad l2011) si mette la virgola
# serve mettere anche col=, ci serve per aggiungere un argomento

# plottare una sola banda, un solo elemento (l'immagine è formata dai 7 elementi (7 bande), ongi banda segna un elemento)
# ci sono due modalità

# nome file l2011, scegliamo l'elemento 4 
# in R gli elementi si identificano con parentesi quadra
# ma siamo in due dimensioni (stiamo usando matrici) per cui dobbiamo usare doppia parentesi quadra
plot(l2011[[4]], col=cl) 

# scrittura alternativa
# per avere informazioni sull'immagine basta scrivere il nome dell'oggetto (es l2011) e premere invio (facendolo troviamo segnati i nomi delle diverse bande) 
# a noi interessa la B4_sre
# dollaro è il sibolo per legare i pezzi fra loro, lo utilizziamo anche noi per legare il codice alla singola banda
plot(l2011$B4_sre, col=cl)

# posso assegnare la banda dell'infrarosso ad un oggetto 
nir <- l2011[[4]] #or:nir <- l2011$B4_sre

plot(nir, col=cl)
# il codice che risulta è molto più snello

# R non salva i dati raster che sono sempre temporanei per cui non serve salvare anche li
# bisogna rifare tutto ogni volta

#seconda lezione
#oggi andiamo a cambiare la gamma dei colori delle nostre immagini considerando tutta la gamma dei colori che R prevede 
# andiamo a creare una nuova colorRampPalette(c("xxx)
cl <- colorRampPalette(c("cyan", "azure", "darkorchid", "aquamarine") (100)

# plottiamo un solo elemento con questa maledetta colorazione
#plot(l2011$b4_sre, col=cl)
dev.off()
#comando che serve a chiudere le finestre (tipo il grafico appena aperto)

#come esportare grafici da R: funzione pdf
pdf("myfirstgraph.pdf")
plot(l2011$B4_sre, col=cl)
dev.off()
#mettiamo un nome a piacere tra virgolette del pdf che vogliamo ottenere, poi sotto scriviamo ciò che cogliamo esportare
                      
