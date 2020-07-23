library(shiny)

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
  
})

