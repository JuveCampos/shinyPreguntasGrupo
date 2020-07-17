library(shinydashboard)
library(shiny)
library(shinycssloaders)

dbHeader <- dashboardHeader(title = "Preguntas 😊", 
                            titleWidth = 360)

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

# Generar la Interfaz de Usuario
ui <- dashboardPage(skin = "black", dbHeader, sidebar, body) 
 