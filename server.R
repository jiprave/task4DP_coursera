#The server file

shinyServer(function(input, output) {
  
    
    #Reactive function
    graficar<-reactive({
        
        my.variab=input$my.variab
        
        Zp<-data.frame(Z[order(Z[my.variab], decreasing = T),][1:5,])
        
        g<-ggplot(Zp, aes(x = reorder(Zp$event, Zp[,my.variab]), 
                          y = Zp[,my.variab], fill = NULL,
                          label=Zp[,my.variab]))
        
        g
        
    })
    
    #Bar plot
    
  output$bars <- renderPlot({
    
      g<<-graficar()
      my.variab<<-input$my.variab
      horiz<<-input$horiz
      colorin<<-input$colorin
      
      my.plot.top(g,my.variab,horiz,colorin)
      
    })
  
  output$descri <- renderText({
      
      
      my.variab<<-input$my.variab
      W<-which(names(Z)==my.variab)
      descri0[W-3]
      
      
  })
  
})
