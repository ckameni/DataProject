library(shiny)

shinyUI(fluidPage(
      
      # Application title
      titlePanel("Annual Payment Loan Calculator"),
      
      # Sidebar with  sliders input for the number of years and interest rate
      sidebarLayout(
            sidebarPanel(
                  sliderInput("rate","Input rate",value=.1, min = 0.01, max = .15,step = .001),
                  sliderInput("n","Number of years:",min = 2,max = 10,value = 5,step = 1),
                  numericInput(inputId="invest", label = "Input investment",value=20000, min = 1000, max = 10000000, step=1000),
                  submitButton('Submit')
                  #actionButton("goButton", "Go!"),
                  
                  
                  
            ),
            
            
            # Show a payment plan
            mainPanel(
                  h4('credit sum'),
                  verbatimTextOutput("invest"),
                  h4('financial plan'),
                  tableOutput("view")
            )
      )
))


