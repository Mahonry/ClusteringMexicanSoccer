library(dplyr)

data <- read.csv("./data/clean_jugadores.csv")

data <- select(data, -X.1,-X,-Nombre,-Equipo...Posicion,-Nacionalidad )
write.csv(data, file = "./data/data.csv")

data <- scale(data)

mycluster<-kmeans(data, 3, nstart=5, iter.max = 30)

#Vemos el elbow para optimizar el numero de clusters
wss<-(nrow(data)-1)*sum(apply(data,2,var))

for(i in 2:20) wss[i]<-sum(kmeans(data,centers=i)$withinss)

wss

plot(1:20, wss, type="b", xlab="Numero de clusters", ylab= "withinss groups") 

# Creamos otra clusterizacion optimizando el numero de clusters ( = 7 )

mycluster<-kmeans(data, 7, nstart=5, iter.max = 30)

library(fmsb)
par(mfrow = c(2,4))

dat <- as.data.frame(t(mycluster$centers[1,]))
dat 
dat <- rbind(rep(.5,8),rep(-.3,8),dat)

radarchart(dat)

dat<-as.data.frame(t(mycluster$centers[2, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(mycluster$centers[3, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(mycluster$centers[4, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(mycluster$centers[5, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(mycluster$centers[6, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
dat<-as.data.frame(t(mycluster$centers[7, ]))
dat
dat<-rbind(rep(5,10), rep(-1.5,10), dat)
dat
radarchart(dat)
