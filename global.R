# Librerias
library(shiny)
library(tidyverse)


##hOLA

# Preguntas
preguntas <- readxl::read_xlsx("www/Libro1.xlsx")

# Categorias
cats <- preguntas$categoria %>% unique() %>% sort()

# Obtención de preguntas 
op <- function(catego){
  # catego = cats[1]
  (pregunta_pantalla <- preguntas %>% 
    filter(categoria == catego) %>% 
    pull(pregunta) %>% 
    sample(1))
  
  return(pregunta_pantalla)

}

