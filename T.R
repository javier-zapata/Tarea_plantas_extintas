
library(tidyverse)
library(kableExtra)
library(knitr)

plants <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/plants.csv")
actions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/actions.csv")
threats <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/threats.csv")


### Plantas por continente

plants %>% dplyr::filter(continent == "South America") %>% nrow()
plants %>% dplyr::filter(continent == "North America") %>% nrow()
plants %>% dplyr::filter(continent == "Africa") %>% nrow()
plants %>% dplyr::filter(continent == "Asia") %>% nrow() 
plants %>% dplyr::filter(continent == "Oceania") %>% nrow()
plants %>% dplyr::filter(continent == "Europe") %>% nrow()

## Hay que crear una tabla

Continentes = c("South America", "North America", "Africa", "Asia", "Oceania", "Europe")
Especies_por_continente = c(83,89,218,59,38,13)

Tabbla_one = data.frame(cbind(Continentes, Especies_por_continente))

## Ordenare la tabla ## (no me resulto el orden)### 

Tabla_two <- Tabbla_one %>% arrange(desc(Especies_por_continente))

#### Numero de especies  por categoria red_list_category  

plants %>% dplyr::filter(red_list_category == "Extinct in the Wild") %>% nrow()
plants %>% dplyr::filter(red_list_category == "Extinct") %>% nrow()

categoria_de_la_lista_roja = c("Extinct in the Wild", "Extinct")
Numero_de_Especies = c(65, 435)

Tabbla_tres = data.frame(cbind(categoria_de_la_lista_roja, Numero_de_Especies))

## Cuantas especies estan extintas in wild y extintas por continente 


Tabla_cuatro <- group_by(plants, continent, red_list_category)
Tabla_cinco <- summarize(Tabla_cuatro)

