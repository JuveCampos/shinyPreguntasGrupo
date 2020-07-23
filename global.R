# Librerias
library(shiny)
library(tidyverse)
library(readxl)


##hOLA

# Preguntas
preguntas <- read_xlsx("www/Libro1.xlsx")

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

# Funcion para obtener preguntas del usuario
op_prueba <- function(data, catego){
  (pregunta_pantalla <- data %>% 
     filter(categoria == catego) %>% 
     pull(pregunta) %>% 
     sample(1))
  
  return(pregunta_pantalla)
  
}
