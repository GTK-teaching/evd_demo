
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

heights <- function(nstudents,mu,s) { 
  rnorm(mean=mu,sd=s,nstudents)
}


shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
  par(mfrow=c(1,1))
    # generate students based on input$students from ui.R
    
    h <- sapply(1:input$classes,function(x) heights(input$students,input$mean_height,input$sd_height))
    max_heights <- apply(h,1,max)
    #max_heights <- rev(sort(h))[1:100]
    mean_heights <- apply(h,1,mean)
    if (input$statistic %in% c("mean","max")){
      par(mfrow=c(2,1))  
    } else if (input$statistic == "both") { 
      par(mfrow=c(3,1))  
      }
    # all students
    plot(density(h), col = 'black', border = 'white',xlim=c(120,200),
         main=paste0("All ",input$sex," student heights"),xlab=NA)
    polygon(density(h), col="red", border="black")
    
    if (input$statistic %in% c("mean","both")) {
      plot(density(mean_heights), col = 'black', xlim=c(120,200),main="Average heights in each classroom",xlab=NA)
      polygon(density(mean_heights), col="red", border="black")
    } 
    if (input$statistic %in% c("max","both")) {
      plot(density(max_heights), col = 'black', border = 'white',xlim=c(120,200),main="Maximum heights in each classroom",xlab=NA)
      polygon(density(max_heights), col="red", border="black")
    }
  })

})
