#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

if(FALSE) {
      library(dplyr)
      library(ggplot2)
      library(plyr)
}


#Get the data
datOthersAGG <- read.csv("datOthersAGG.csv")


#Build the models
fit.WORTHY <- lm(datOthersAGG$WORTHY_68 ~ ., data=datOthersAGG[,c(4:13,15)])
fit.PERF <- lm(datOthersAGG$PERF_65 ~ ., data=datOthersAGG[,c(4:14)])


# Define server logic required to draw a histogram
shinyServer <- function(input, output) {
  
  
  
  
  #Make the prediction
  pred.PERF <- reactive ({
    CRMGDinput <- input$CRMGDinput
    CCIinput1 <- input$CCIinput1
    CCIinput2 <- input$CCIinput2
    CPAinput <- input$CPAinput
    CPRinput <- input$CPRinput
    CLPGinput1 <- input$CLPGinput1
    CLPGinput2 <- input$CLPGinput2
    PIEinput <- input$PIEinput
    HGFinput1 <- input$HGFinput1
    HGFinput2 <- input$HGFinput2
    predict(fit.PERF, newdata=data.frame(CRMGD_2=CRMGDinput,
                                         CCI_14=CCIinput1,
                                         CCI_16=CCIinput2,
                                         CPA_21=CPAinput,
                                         CPR_31=CPRinput,
                                         CLPG_37=CLPGinput1,
                                         CLPG_39=CLPGinput2,
                                         PIE_47=PIEinput,
                                         HGF_62=HGFinput1,
                                         HGF_63=HGFinput2))
  })
    
    pred.WORTHY <- reactive ({
      CRMGDinput <- input$CRMGDinput
      CCIinput1 <- input$CCIinput1
      CCIinput2 <- input$CCIinput2
      CPAinput <- input$CPAinput
      CPRinput <- input$CPRinput
      CLPGinput1 <- input$CLPGinput1
      CLPGinput2 <- input$CLPGinput2
      PIEinput <- input$PIEinput
      HGFinput1 <- input$HGFinput1
      HGFinput2 <- input$HGFinput2
      predict(fit.WORTHY, newdata=data.frame(CRMGD_2=CRMGDinput,
                                           CCI_14=CCIinput1,
                                           CCI_16=CCIinput2,
                                           CPA_21=CPAinput,
                                           CPR_31=CPRinput,
                                           CLPG_37=CLPGinput1,
                                           CLPG_39=CLPGinput2,
                                           PIE_47=PIEinput,
                                           HGF_62=HGFinput1,
                                           HGF_63=HGFinput2))
  })
   
  output$plot <- renderPlot({
    
    CRMGDinput <- input$CRMGDinput
    CCIinput1 <- input$CCIinput1
    CCIinput2 <- input$CCIinput2
    CPAinput <- input$CPAinput
    CPRinput <- input$CPRinput
    CLPGinput1 <- input$CLPGinput1
    CLPGinput2 <- input$CLPGinput2
    PIEinput <- input$PIEinput
    HGFinput1 <- input$HGFinput1
    HGFinput2 <- input$HGFinput2
   
   plot(predict(fit.PERF,newdata=datOthersAGG),datOthersAGG$PERF_65,
        xlab="Predicted Performance",
        ylab="Performance",
        bty="n",pch=16,xlim=c(3.5,6),ylim=c(3.5,6))
   abline(lm(datOthersAGG$PERF_65~predict(fit.PERF,newdata=datOthersAGG)),col="red",lwd=2)
   points(pred.PERF(),pred.PERF(),col="red",pch=16,cex=2)
    
    
  })
  
  output$plot2 <- renderPlot({
    
    CRMGDinput <- input$CRMGDinput
    CCIinput1 <- input$CCIinput1
    CCIinput2 <- input$CCIinput2
    CPAinput <- input$CPAinput
    CPRinput <- input$CPRinput
    CLPGinput1 <- input$CLPGinput1
    CLPGinput2 <- input$CLPGinput2
    PIEinput <- input$PIEinput
    HGFinput1 <- input$HGFinput1
    HGFinput2 <- input$HGFinput2
    
    plot(predict(fit.WORTHY,newdata=datOthersAGG),datOthersAGG$WORTHY_68,
         xlab="Predicted Worthy Leadership",
         ylab="Worthy Leadership",
         bty="n",pch=16,xlim=c(3.5,6),ylim=c(3.5,6))
    abline(lm(datOthersAGG$WORTHY_68~predict(fit.WORTHY,newdata=datOthersAGG)),col="red",lwd=2)
    points(pred.WORTHY(),pred.WORTHY(),col="red",pch=16,cex=2)
    
    
  })
  
}
