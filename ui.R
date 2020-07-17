
library(shiny)
library(shinycssloaders)

shinyUI(
  fluidPage(
    
    tags$head(includeCSS("www/index.css")),
    
#     HTML('<!doctype html>
# <html lang="en">
# 
#   <!-- Configuracion -->
#   <head>
#     <!-- Required meta tags -->
#     <!-- Caracteres -->
#     <meta charset="utf-8">
#     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
# 
#     <!-- Bootstrap CSS -->
#     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
#     <link rel="stylesheet" href="index.css">
#     <title>PlatziConf Hawaii</title>
#   </head>'), 

    fluidRow(
      column(4, offset = 4, 
             selectizeInput(inputId = "selCat", 
                            label = "Categoría",
                            choices = cats, 
                            selected = cats[2]))),
    fluidRow(
      column(4, offset = 4, 
             actionButton(inputId = "btnAccion", 
                          label = "Obtener pregunta"))),
  br(),  
  fluidRow(
    column(10, offset = 1, 
      withSpinner(textOutput("texto"))
    )
  )
 
)
) 
    
 