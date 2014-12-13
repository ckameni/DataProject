library(shiny)
shinyServer(function(input, output) {
            
      output$invest <- renderPrint({input$invest})
      
      
      output$view <- renderTable({
            input$goButton
            Repayment<-c(0) 
            Interest<-c(0) 
            balance<-input$invest;
            i<-input$rate;
            n <- input$n
            
                  #==============================================================
                  e<-0
            tilg<-balance / n
            time<-"year_0"
                  for(a in 2:(n+1)) {
                        #tilg<-balance / n
                        Repayment[a] <- tilg
                        #==============================================================
                        b<-a-1
                        balance[a] <- balance[b] - Repayment[a]
                        #==============================================================
                        Interest[a] <- i * balance[b]
                        c<-b-1
                        time[a]<-paste("year_",b)
                  }
                 Payment <- Interest+ Repayment
                  #amortization<-Repayment  #je l'ai supprimé de l'objet table()
                  balance<-abs(balance)
                  table<- cbind(Payment,Interest,Repayment,balance)
                  Names<-c("Payment","Interest Paid","Principal Paid","Remaining Balance")
                  colnames(table)<-Names;  rownames(table)<-time
            table
                  
            
      })
})


