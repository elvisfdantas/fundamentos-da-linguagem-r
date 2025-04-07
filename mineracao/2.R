dados = read.table("clipboard", header=T)
head(dados)
tipos <- sapply(dados, class)
print(tipos)


dias_na_uti <- c(4, 10, 7, 12, 8, 5, 1)
dados <- cbind(dados, Dias_na_UTI = dias_na_uti)
print(dados)



dados <- dados[order(-dados$Idade), ]
print(dados)

dados$Peso[5] <- 67
print(dados)





media_idade <- mean(dados$Idade)
media_peso <- mean(dados$Peso)
media_imc <- mean(dados$IMC)
maior_media <- max(media_idade, media_peso, media_imc)
print(maior_media)





head(dados)
dados$Dias_na_UTI=NULL

library(ggplot2)
ggplot(data = dados, aes(x = Peso, y = IMC)) + geom_point()


library(ggplot2)
grafico <- ggplot(dados, aes(x = Sexo, fill = Sexo)) + geom_bar() + 
labs(x = "Sexo", y = "Frequencia") + 
scale_fill_manual(values = ("Masculino" = "blue", "Feminino" = "pink"))
print(grafico)

leituras <- c(9839, 10149, 10486, 10746, 11264, 11684, 12082, 12599, 13004, 13350, 13717, 14052)
luz <- data.frame(Mês = month.abb, Leituras = leituras)
print(luz)

consumo <- c(diff(luz$Leituras), NA)  
luz.cons <- data.frame(Mês = month.abb, Consumo = consumo)
print(luz.cons)


consumo.media <- function(consumo) {
   media <- mean(consumo, na.rm = TRUE)
  return(media)
}
media_consumo <- consumo.media(luz.cons$Consumo)
print(media_consumo)

grafico_consumo <- ggplot(luz.cons, aes(x = Mês, y = Consumo)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Consumo Mensal de Energia", x = "Mês", y = "Consumo") +
  theme_minimal()
print(grafico_consumo)

