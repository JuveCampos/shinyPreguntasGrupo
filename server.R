library(shiny)

shinyServer(function(input, output) {
  
  pregunta_pantalla <- eventReactive(input$btnAccion,{
    op(catego = input$selCat)
  })
  
  output$texto <- renderText({
    Sys.sleep(time = 1)
    pregunta_pantalla()
  })
  
})
