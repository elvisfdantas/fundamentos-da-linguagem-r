setwd("C:/dadosR/aula")

getwd()
dados<-read.table("aula.txt", header=T)
head(dados)

library(ggplot2)



ggplot(dados, aes(x = as.factor(EstadoCivil))) + 
geom_bar(fill=c("red", "blue", "green")))


ggplot(data = dados, aes(x = Idade, y = TerminoGraduacao)) + geom_point()

ggplot(dados, aes(x = as.factor(EstadoCivil))) + 
  geom_bar(fill=c("red", "blue", "green"))

ggplot(dados, aes(x = as.factor(EstadoCivil), fill = as.factor(EstadoCivil))) +   
geom_bar() +  labs(fill = "Estado Civil")


dados<-read.csv("universidade.csv", header=T, sep=";")

head(dados)

total_docentes <- sum(dados$Total) # Total de docentes
 prop_especialistas <- dados$Especialistas / total_docentes
 prop_mestres <- dados$Mestres / total_docentes
 prop_doutores <- dados$Doutores / total_docentes
 
 barplot(
   height = c(prop_especialistas, prop_mestres, prop_doutores),
   beside = TRUE, 
   col = c("blue", "green", "red"), 
   legend.text = c("Especialistas", "Mestres", "Doutores"), 
   names.arg = dados$Ano, 
   xlab = "Ano", 
   ylab = "Proporção", 
   main = "Proporção de Especialistas, Mestres e Doutores por Ano" )


dados<-read.csv("atividades.csv", header=T, sep=";")
ggplot(data = dados, aes(x = Aluno, y = Internet)) + geom_point() 


ggplot(data = dados, aes(x = Aluno, y = At.Físicas)) + geom_point() 
