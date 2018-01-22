#The ui file

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Task4. Exploring more risky natural events. By: JPR"),
  
  h4("This app presents an example of exploratory analysis for a Coursera course. 
It is a teaching - learning exercise, it does not correspond to official statistics."),
  
  h4(a("See the documentation",href="http://rpubs.com/jiprave/351131", 
       target="_blank")),
  br(),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       
        #Selecting the variable in study
        selectInput("my.variab", label = h3("Choose the variable to analyze"), 
                    choices = names(Z[,-c(1:3)]), 
                    selected = "tot.fatal.year"),
    
        #Selecting the fill colors
        radioButtons("colorin", label = h3("Choose the bar color"),
                 choices = list("Blue" = "lightskyblue2", "Red" = "indianred1",
                                "Yellow" = "gold1"), 
                 selected = "lightskyblue2"),
        
        #Selecting the options for plotting: horizontal or not.
        checkboxInput("horiz", label = h5("¿Horizontal bars?"), value = TRUE),
        
        
        #Source of the dataset
        h4("More risky events based on the", a("U.S. National Oceanic and 
            Atmospheric Administration's (NOAA) storm database",
href="https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",target="_blank")),
        
br(),

#Important note about the dataset used in this app
h4("The datasets were prepared previously ", 
a("see the clean process", href="http://rpubs.com/jiprave/project2_exploring-data",
  target="_blank"))
        
    ),
    
    
    mainPanel(
  
        #Analytical question
        h3("Which types of events are most harmful to population health?"),
        
         h4(strong("Description of the chosen variable:")), textOutput("descri"),
        br(),
        #Result
            plotOutput("bars")
    )
  
)
)
)