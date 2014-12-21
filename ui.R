shinyUI(fluidPage(
  titlePanel("Registered Deaths in Toronto (January 2011 - November 2014)"),
  
  sidebarLayout(position = "right",
    sidebarPanel( 
      h2("Documentation"),
      p("This simple Shiny applicaiton will chart the monthly number of deaths registered by the City of Toronto.  The data is a modified version of the one found at Toronto Open Data.
      The graph will indicate the number of deaths per month in Toronto (light grey), outside city limits (dark grey), or both, based on the selection below.
      In addition, the server will calculate the total number of deaths for the location of interest."),
                  
      radioButtons("deathlocation", label = h3("Place of death"),
          choices = list("Outside City Limits", "In Toronto", "In Total"), 
          selected = c("In Toronto")
      )          
    ),
                
    mainPanel(
      h1("Barplot"),
      textOutput("summaryinput"),
      plotOutput("deathhist")
    )
  )
))