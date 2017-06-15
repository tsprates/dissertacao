grafico <- function(arquivo, titulo){
	library(ggplot2)
	library(ggthemes)	
	
	base.dados <- read.csv(arquivo)
	
	dados <- stack(base.dados)
	
	names(dados) <- c('Sensibilidade x Especificidade', 'Algoritmos')
	
	dados$Algoritmos <- factor(dados$Algoritmos, levels=colnames(base.dados))

	ggplot(dados, aes(x=Algoritmos, y=`Sensibilidade x Especificidade`, fill=Algoritmos)) + stat_boxplot(geom = "errorbar", width = 0.5) + geom_boxplot() + theme_gdocs() + labs(title=titulo, x = NULL, y = "Sensibilidade x Especificidade") + theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold", hjust = 0.5),
	legend.position = 'none',
	plot.background = element_blank(),
	axis.title = element_text(face="bold", size = 9),
	axis.text.x = element_text(colour="black", size = 9, face='bold'))
}
