library(shinydashboard)
library(shiny)
library(shinycssloaders)

dbHeader <- dashboardHeader(title = "Preguntas 😊", 
                            titleWidth = 180)

sidebar <- dashboardSidebar(width = 0)

body <- dashboardBody(
  br(), 
  fluidPage(
    tags$head(includeCSS("www/index.css")),
    fluidRow(
      column(4, offset = 4, 
             selectizeInput(inputId = "selCat", 
                            label = "Categoría",
                            choices = cats, 
                            selected = cats[2]))),
    fluidRow(
      column(4, offset = 4, 
             fileInput("file1", "Elige un archivo Excel",
                       accept = c(".xlsx")))),
    fluidRow(
      column(4, offset = 4, 
             actionButton(inputId = "btnAccion_prueba", 
                          label = "Obtener pregunta de la base ingresada"))),
    fluidRow(
      column(4, offset = 4, 
             actionButton(inputId = "btnAccion", 
                          label = "Obtener pregunta"))),
  br(),  
  fluidRow(
    column(10, offset = 1, 
      withSpinner(textOutput("texto"))
      )
    ),
  br(),
  fluidRow(
    column(10, offset = 1,
           withSpinner(textOutput("texto_prueba")
                       
           )))
  )
) 

# Generar la Interfaz de Usuario
ui <- dashboardPage(skin = "black", dbHeader, sidebar, body) 
 