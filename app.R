library(shiny)
library(DT)
library(lme4)
library(tidyverse)
library(curl)

f <- curl("https://raw.githubusercontent.com/CelesteW/Williams-Celeste-Shiny-App/master/Sifaka_Group_Values.csv")
sifaka <- read.csv(f, header = TRUE, sep = ",", stringsAsFactors = TRUE)
v <- names(sifaka)

ui <- fluidPage(
  titlePanel("Verreaux's sifaka data") ,
  sidebarLayout(
    sidebarPanel(

      
      checkboxGroupInput("show_vars", "Columns in sifaka data to show:",
                           names(sifaka), selected = names(sifaka))
    
    ),
    mainPanel(
         dataTableOutput("table1"))
  
  
   )
)

    




server <- function(input, output) {
  output$table1<- renderDataTable({datatable(sifaka[,input$show_vars, drop=FALSE])
  })

}

shinyApp(ui = ui, server = server)

