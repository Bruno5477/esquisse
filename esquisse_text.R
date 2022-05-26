# pacote Esquisse

#instalando o pacote
#install.packages("esquisse")
#carregando o pacote
library(esquisse)

#carregando uma base de dados
base = dados::dados_gapminder


# O argumento viewer = "browser", muda a forma como o painel do esquisser é exibido
# o default desse argumento é "dialiog

esquisser(base, viewer = "browser") 


library(dplyr) # Ele carrega automáticamente o pacote necessário para fazer as altereções no gráfico
library(ggplot2)

# gráfico 1
base %>%
 filter(!(continente %in% "África")) %>%
 filter(ano >= 1978L & ano <= 2007L) %>%
 ggplot() +
 aes(x = expectativa_de_vida, y = pib_per_capita, colour = continente) +
 geom_point(shape = "circle", 
 size = 1.7) +
 geom_smooth(span = 0.17) +
 scale_color_manual(values = c(África = "#67001F", Américas = "#E58267", 
Ásia = "#F7F7F7", Europa = "#6AACD0", Oceania = "#053061")) +
 labs(x = "Renda per capita", y = "Expectativa de vida", 
 title = "Expectativa de vida por renda per capita", color = "Continente") +
 theme_bw() +
 theme(plot.title = element_text(size = 17L, 
 face = "bold", hjust = 0.5), axis.title.y = element_text(size = 15L), axis.title.x = element_text(size = 15L)) +
 xlim(50, 80)

#gráfico2
base %>%
 filter(!(continente %in% "África")) %>%
 ggplot() +
 aes(x = expectativa_de_vida, y = continente, fill = continente) +
 geom_boxplot() +
 scale_fill_viridis_d(option = "inferno", 
 direction = 1) +
 labs(x = "Expectativa de vida", y = "Continente", title = "Expectativa de Vida por continente") +
 coord_flip() +
 theme_bw() +
 theme(plot.title = element_text(size = 17L, face = "bold", hjust = 0.5), 
 axis.title.y = element_text(size = 15L), axis.title.x = element_text(size = 15L)) +
 xlim(50, 80)

#gráfico 3
base %>%
 filter(!(continente %in% "África")) %>%
 filter(ano >= 1978L & ano <= 2007L) %>%
 filter(populacao >= 
 0L & populacao <= 570000000L) %>%
 ggplot() +
 aes(x = continente, y = populacao, fill = continente) +
 geom_boxplot() +
 scale_fill_manual(values = c(África = "#00204D", 
Américas = "#404D6B", Ásia = "#7D7C76", Europa = "#BCAF6E", Oceania = "#FFEA46")) +
 labs(x = "Continente", 
 y = "População", title = "População por continente", fill = "Continente") +
 coord_flip() +
 theme_bw() +
 theme(plot.title = element_text(size = 17L, face = "bold", hjust = 0.5), axis.title.y = element_text(size = 15L), 
 axis.title.x = element_text(size = 15L))

#importando uma nova base 
base2 = dados::pinguins

esquisser(base2, viewer = "browser") 

library(ggplot2)

#gráfico 3
ggplot(base2) +
 aes(x = especie, y = massa_corporal, fill = especie) +
 geom_boxplot() +
 scale_fill_viridis_d(option = "viridis", 
 direction = -1) +
 labs(title = "Espécie de pinguim em cada ilha") +
 coord_flip() +
 theme_bw() +
 theme(legend.position = "bottom", 
 plot.title = element_text(size = 15L, face = "bold", hjust = 0.5)) +
 facet_wrap(vars(ilha), nrow = 2L)

#gráfico 4
base2 %>%
 filter(!is.na(sexo)) %>%
 ggplot() +
 aes(x = especie, y = massa_corporal, fill = ilha) +
 geom_col() +
 scale_fill_manual(values = c(Biscoe = "#00204D", 
Dream = "#7D7C76", Torgersen = "#FFEA46")) +
 labs(x = "Espécie", y = "Massa corporal", title = "Massa corporal de cada espécie por sexo em cada ilha", 
 caption = "sexo", fill = "Ilhas") +
 theme_bw() +
 theme(plot.title = element_text(size = 15L, face = "bold", 
 hjust = 0.5)) +
 facet_wrap(vars(sexo), scales = "free", nrow = 1L) +
 ylim(0, 6000)
