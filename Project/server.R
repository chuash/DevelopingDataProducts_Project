library(shiny)
library(datasets)

# linear regression of miles per gallon (mpg) against horsepower (hp) and weight 
# (wt) variables within the mtcars dataset
fit<-lm(mpg~hp+wt,data = mtcars)
# function to predict fuel consumption given hp (x=hp) and wt (y=wt).
consumption<-function(x,y){
    z<-fit$coefficients[2]*x + fit$coefficients[3]*y + fit$coefficients[1]
    z
}

shinyServer(function(input,output){
  output$odate <- renderPrint({input$date})
  output$hp <- renderPrint({input$id1})
  output$wt <- renderPrint({input$id2})
  # executing the prediction code upon hitting the submit button
  output$prediction <-renderPrint({
            input$goButton
            isolate(consumption(input$id1,input$id2)[[1]])
            })
  # A plot to show where the predicted consumption lies admist the consumption
  # distribution
  output$displot <- renderPlot({
    hist(mtcars$mpg,xlab="Miles/(US)gallon,mpg",
         ylab="Qty/thousands",main="Distribution of mpg")
    input$goButton
    x <- isolate(consumption(input$id1,input$id2)[[1]])
    lines(c(x,x),c(0,12),col="red",lwd=6)
  })
})
