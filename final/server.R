source("map.R")
source("chart 2.R")
library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)
options(stringsAsFactors = FALSE)

map.world$suicide_rate_per_100000_population <- as.numeric(
    map.world$suicide_rate_per_100000_population)

sr_range <- range(map.world$suicide_rate_per_100000_population, na.rm = T)

server <- function(input, output) {
    
#map  
    
    output$plot_data <- renderPlotly({
        p <- map.world %>%
            filter(suicide_rate_per_100000_population > input$suicide[1], 
                   suicide_rate_per_100000_population < input$suicide[2])
        map <- ggplot(p) + 
            geom_polygon(aes(x = long, y = lat, group = group,
                             fill = suicide_rate_per_100000_population,
                             location = Country), 
                         color = "black", size = 0.05) +
            labs(title = "Global Suicide rates", 
                 subtitle = "sources:https://www.kaggle.com/utkarshxy/who-worldhealth-statistics-2020-complete?select=crudeSuicideRates.csv",
                 fill = "suicide rate per 100,000 pop") +
            theme(
                axis.title.x = element_blank(),
                axis.title.y = element_blank(),
                panel.background = element_rect(fill = "azure"), 
                panel.border = element_rect(fill = NA))
        
        ggplotly(map)
    })
    
#scatterplot 
    
    output$scatter <- renderPlotly({
        
        x_choices <<- input$x_var
        
        y_choices <<- input$y_var
        
        my_plot <- ggplot(suicide_2016) +
            geom_point(mapping = aes_string(x = x_choices, y = y_choices)) +
            labs(title = "The relationship between beer consumption, suicide rate and happiness score")
        ggplotly(my_plot)
    })
    

#bar chart
    
    
        
}
