library(shiny)
shinyUI(
  pageWithSidebar(
    # Application Title
    headerPanel("Vehicle Fuel Consumpion Prediction"),
    # Sidebar with date, horsepower(numeric) and weight(slider) inputs
    sidebarPanel(
          dateInput("date", "Date:"),
          numericInput("id1","Horsepower:",52,min=52,max=335,step=1),
          sliderInput("id2","Weight:", min = 1.6,max = 5.0, value = 3.0),
          actionButton("goButton", "Submit")
    ),
    mainPanel(
      # Documentation so that a novice user could use the application
      h4("This application predicts fuel consumption for vehicle
         of certain horsepower and weight. To use the application, simply select
         your vehicle horsepower and weight on the left hand side of this page,
        click the submit button and the predicted fuel consumption will be shown 
         below. You will also see how your vehicle fuel consumption compares with
         the fuel consumption distribution across the State."),
      h5("Date of Report"), verbatimTextOutput("odate"),
      h5("Horsepower Selected"),verbatimTextOutput("hp"),
      h5("Weight Selected"),verbatimTextOutput("wt"),
      h3("Predicted Consumption(mpg)"),verbatimTextOutput("prediction"),
      # # A plot to show where the predicted consumption lies admist the consumption
      # distribution
      plotOutput('displot')
    )
))
