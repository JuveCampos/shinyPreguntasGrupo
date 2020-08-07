library(shinydashboard)
library(shiny)
library(shinycssloaders)

dbHeader <- dashboardHeader(title = "Preguntas 🤔", 
                            titleWidth = 180,
                            tags$li(a(href = 'https://www.cide.edu',
                                      img(src = 'https://www.cide.edu/wp-content/themes/cide_general/img/logo_cide.png',
                                          title = "CIDE", height = "30px", id = "optionalstuff"),
                                      style = "padding-top:10px; padding-bottom:10px;" 
                            ),
                            class = "dropdown"),
                            
                            tags$li(a(href = 'http://lnpp.cide.edu',
                                      img(src = 'http://lnpp.cide.edu/wp-content/themes/lnpp/images/logo.svg',
                                          title = "LNPP", height = "30px", id = "optionalstuff3"),
                                      style = "padding-top:10px; padding-bottom:10px;"),
                                    class = "dropdown"))

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Preguntas", tabName = "Preguntas", icon = icon("question")),
    menuItem("Instrucciones", tabName = "Instrucciones", icon = icon("book")),
    menuItem("Cargar archivo", tabName = "upload", icon = icon("upload")))
)

body <- dashboardBody(
  br(), 
  fluidPage(
    tags$head(includeCSS("www/index.css")),
    tabItems(
      tabItem(tabName = "Preguntas", ### Panel de las preguntas
              fluidRow(tags$h1("Preguntas")),
              fluidRow(
                column(6, offset = 4, 
                       selectizeInput(inputId = "selCat", 
                                      label = "Categoría",
                                      choices = cats, 
                                      selected = cats[2]))),
              # fluidRow(
              #   column(4, offset = 4, 
              #          actionButton(inputId = "btnAccion_prueba", 
              #                       label = "Obtener pregunta de la base ingresada"))),
              fluidRow(
                column(4, offset = 4,
                       actionButton(inputId = "btnAccion",
                                    label = "Obtener pregunta"))),
              br(),  
              fluidRow(
                column(8, offset = 2, 
                       withSpinner(textOutput("texto"))
                )
              ),
              br(),
              fluidRow(
                column(10, offset = 1,
                       withSpinner(textOutput("texto_prueba")
                                   
                       )))),
      tabItem(tabName =  "Instrucciones", ## Panel de las instrucciones
              tags$h1("Instrucciones"),
              HTML("<p style = 'text-align: center;color:#c95b00;'>Bienvenido.</p>
                    <p style = 'text-align: justify;'>Esta es una aplicación web elaborada por el LNPP para realizar dinámicas de hacer preguntas y conversaciones en grupo.
                    <br>Esta aplicación selecciona preguntas al azar de un conjunto de preguntas para generar temas de conversación entre grupos de asistentes. 
                    Para este fin, se recomienda usar la aplicación en conjunto con las <a href = 'https://support.zoom.us/hc/es/articles/206476093-Introducción-a-las-salas-para-grupos-pequeños'>Sesiones para Grupos Pequeños de Zoom</a>
                    <p style = 'text-align: justify;'>Para personalizar la dinámica, se puede subir un archivo excel con preguntas propias y hacer la selección aleatoria a partir de estas.</p>"),
              
              HTML("<p>Para que esto funcione, el archivo debe tener el formato de columnas de la tabla que se muestra a continuación:</p>"),
              
              fluidRow(
                column(11, offset = 1,
                       tableOutput(outputId = "tabla_instrucciones"))
              ),
              fluidRow(
                tags$p("Como puedes ver, el archivo excel debe tener dos columnas:", code("categoria"), "y", code("pregunta"), "Además, debes mantener las categorias correspondientes."), 
                HTML("<p style = 'text-align:center; color:#c95b00;'>Diviertete, y suerte con la dinámica</p>")
              )),
      tabItem(tabName = "upload", ### Panel para cargar el archivo
              fluidRow(
                tags$h1("Cargar archivo")),
              fluidRow(
                tags$p("En esta sección puedes subir tu archivo excel")),
              wellPanel(fileInput("file1", "Elige un archivo Excel",
                                  buttonLabel = "Seleccionar Archivo...",
                                  placeholder = "No hay archivo seleccionado",
                                  accept = c(".xlsx"))),
              fluidRow(
                tags$p("A continuación se muestra una tabla con las preguntas que se encuentran en el sistema. 
                       Una vez que ingrese su archivo excel, 
                       la tabla mostrará sus propias preguntas. 
                       De esta forma puede visualizar si hay algún error 
                       antes de comenzar la dinámica grupal.")),
              fluidRow(tableOutput("tabla_muestra"))
      ))
  )) 

# Generar la Interfaz de Usuario
ui <- dashboardPage(skin = "black", dbHeader, sidebar, body) 
 