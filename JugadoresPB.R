#*@param Peso
#*@param Altura
#*@param Juegos_jugados
#*@param Juegos_titular
#*@param Goles
#*@param Minutos_jugados
#*@param Tarjetas_amarillas
#*@param Tarjetas_rojas
#*@get /getCluster

function(Peso,Altura,Juegos_jugados,Juegos_titular,Goles,Minutos_jugados,Tarjetas_amarillas,Tarjetas_rojas){
  campos<-c(Peso,Altura,Juegos_jugados,Juegos_titular,Goles,Minutos_jugados,Tarjetas_amarillas,Tarjetas_rojas)
  campos<-as.numeric(campos)
  midist<-matrix(0, ncol=7, nrow=8)
  for(i in 1:8){
    a<-dist(x=c(campos[i],mycluster$centers[,i])) #Calculamos  la distancia del valor a cada centro
    b<-as.matrix(a) #Lo convertimos a matriz para poder acceder a los vlaores
    distancia<-b[-1,1] #Eliminamos la distancia consigo mismo
    midist[i,]<-distancia
    }

  rownames(midist)<-c("Peso" , "Altura","Juegos Jugados" ,"Juegos Titular", "Goles", "Minutos Jugados" ,"Tarjeta Amarilla","Tarjeta Roja")
  dist_total<-apply(midist, 2, sum)#Sumamos las distancias
  num_clus<-which.min(dist_total) #Identificamos el cluster de menor distancia
  num_clus

}
