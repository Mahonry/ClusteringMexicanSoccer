library(stringr)
jugadores <- read.csv("./data/Jugadores_mexico.csv")
class(jugadores)

class(jugadores$Juegos.Jugados)

#Quitamos los registros que no contengan nombres

jugadores <-subset(jugadores, Nombre != is.na(jugadores$Nombre))

#Procesado de Peso
jugadores$Peso <- as.character(jugadores$Peso)
jugadores$Peso <- gsub("[ kg]","",jugadores$Peso)
jugadores$Peso <- as.numeric(jugadores$Peso)
pesomedio <- mean(jugadores$Peso, na.rm = TRUE)
jugadores$Peso[is.na(jugadores$Peso)] <- pesomedio
hist(jugadores$Peso)
summary(jugadores$Peso)

#Procesado de Altura
jugadores$Altura <- as.numeric(jugadores$Altura)
alturamedia <- mean(jugadores$Altura, na.rm = TRUE)
jugadores$Altura[is.na(jugadores$Altura)] <- alturamedia

#Procesado de Juegos Jugados, remplazamos por 0 tomado de la pagina oficial
jugadores$Juegos.Jugados[is.na(jugadores$Juegos.Jugados)] <- 0

#Procesado de juegos titular, si no ha tenido Juegos Jugados no puede ser titular
jugadores$Juegos.Titular[is.na(jugadores$Juegos.Titular)] <- 0

#Eliminamos la columna autogoles
jugadores <- jugadores[,-10]

#Procesado de minutos jugados, ya que todos aquellos que tienen NA en minutos jugados tienen 0 partidos jugados
#Rellamos con 0

jugadores$Minutos.Jugados[is.na(jugadores$Minutos.Jugados)] <- 0

#Procesado de Tarjetas amarillas
jugadores$Tarjetas.Amarillas[is.na(jugadores$Tarjetas.Amarillas)] <- 0

#Procesado de goles
jugadores$Goles[is.na(jugadores$Goles)] <- 0

#Procesado Tarjetas Rojas
jugadores$Tarjetas.Rojas[is.na(jugadores$Tarjetas.Rojas)] <- 0

#Procesado de los equipos
jugadores$Equipo...Posicion <- gsub("^\\w*\\sen\\s", "", jugadores$Equipo...Posicion)
jugadores$Equipo...Posicion <- gsub("^\\w*\\s\\w*\\sen\\s", "", jugadores$Equipo...Posicion)
jugadores$Equipo...Posicion <- gsub("\\(\\w*\\s\\w*\\)", "", jugadores$Equipo...Posicion)
jugadores$Equipo...Posicion <- gsub("\\spara\\s\\w*\\s\\d*\\s\\-\\s\\w*\\s\\d*", "", jugadores$Equipo...Posicion)
jugadores$Equipo...Posicion <- gsub("\\spara\\s\\w*\\s\\d*", "", jugadores$Equipo...Posicion)

write.csv(jugadores, file = "./data/clean_jugadores.csv")


