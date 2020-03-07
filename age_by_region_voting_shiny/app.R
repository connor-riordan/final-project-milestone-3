#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

shinyApp(ui <- fluidPage(
    titlePanel("Voting Statistics"),
    selectInput("age_by_region_voting_2016.xlsx", 
                "age_characteristics_voting_2018.xlsx",
                "civic_education_requirements_by_state.csv",
                "recorded_voting_by_age_2016.xlsx",
                "votes_cast_voting_age_2018.xlsx"),
    mainPanel(
        plotOutput("distPlot")
        )
),
server = function(input, output) {
    output$result <- renderText({
        paste("You chose", input$state)
    })
}
)
