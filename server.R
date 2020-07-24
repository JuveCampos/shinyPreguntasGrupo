library(shiny)
library(knitr)
library(kableExtra)

shinyServer(function(input, output) {
  
  mydata <- reactive({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    tbl <- read_excel(inFile$datapath)
    
    return(tbl)
  })
  
  pregunta_prueba <- eventReactive(input$btnAccion_prueba,{
    op_prueba(data = mydata(),
              catego = input$selCat)
  })
  
  output$texto_prueba <- renderText({
    Sys.sleep(time = 1)
    pregunta_prueba()
  })
  
  pregunta_pantalla <- eventReactive(input$btnAccion,{
    op(catego = input$selCat)
  })
  
  output$texto <- renderText({
    Sys.sleep(time = 1)
    pregunta_pantalla()
  })
  
  
  output$tabla_instrucciones <- renderTable({ preguntas %>% 
      filter(pregunta == "¿Qué tipo de música te gusta?" | pregunta == "¿En qué tema o temas te gustaría trabajar?" | pregunta == "¿Qué tipo de actividades sugieres que realicemos para mejorar el trabajo realizado durante las prácticas profesionales?")
  })
  
  rv <- reactiveValues(data = preguntas)
  
  observeEvent(input$file1,{
    rv$data <- mydata()
  })
  
  output$tabla_muestra <- function(){
    
    rv$data %>% 
      kable("html") %>% 
      kable_styling("striped", full_width = F)
  }
  
})
