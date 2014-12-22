library(shiny)

shinyUI(fluidPage(
      
      # Application title
      titlePanel("Annual Payment Loan Calculator"),
      
      # Sidebar with  sliders input for the number of years and interest rate
      sidebarLayout(
            sidebarPanel(
                  sliderInput("rate","Interest rate(0.01=1%)",value=.1, min = 0.01, max = .15,step = .001),
                  sliderInput("n","Number of years:",min = 2,max = 10,value = 5,step = 1),
                  numericInput(inputId="invest", label = "Amount",value=20000, min = 1000, max = 10000000, step=1000),
                  submitButton('Submit')
            ),
            
            
            # Show a payment plan
            mainPanel(
                  h3('Documentation'),
                  p("This mortgage loan calculator - also known as an amortization schedule calculator - lets you estimate your yearly loan repayments. It also determines out how much of your repayments will
                    go towards the principal and how much will go towards interest. Simply input the Loan Amount [$] or change  the Interest rate [%] and the Loan Term[years] through the appropiate slidebar and click the submit button to  dsiplay the amortization plan."),
                  br(),
                  
                  h3('credit sum'),
                  verbatimTextOutput("invest"),
                  h3('financial plan'),
                  tableOutput("view")
                  )
      )
))

