source("server.R")

#map input
map.world$suicide_rate_per_100000_population <- as.numeric(
    map.world$suicide_rate_per_100000_population)

sr_range <- range(map.world$suicide_rate_per_100000_population, na.rm = T)

sr_input <- sliderInput(
    inputId = "suicide",
    label = "Suicide Rate",
    min = sr_range[1],
    max = sr_range[2],
    value = sr_range
)

#Scatterplot input

x_input <- selectInput(
    inputId = "x_var",
    label = h3("Choose an x variable"),
    choices = c("Beer_PerCapita", "suicide_rate_per_100000_population", "Happiness.Score")
)

y_input <- selectInput(
    inputId = "y_var",
    label = h3("Choose an y variable"),
    choices = c("Beer_PerCapita", "suicide_rate_per_100000_population", "Happiness.Score")
)

#bar chart input 

bar_y_input <- selectInput(
    inputId = "top20",
    label = h3("Choose an x variable"),
    choices = c("Beer PerCapita",
                "Suicide Rate per 100000 Population",
                "Happiness Score")
)

# introduction panel
intro_panel <- tabPanel("Introduction",
        h3("The purpose of the project"),
        p("The data of this project is from three datasets: The happiness score and ranking, suicide rate and beer consumption in 2016."),
        p("We want to see how the suciuide rate shows depends on different countries."),
        p("Also, to find the relation between those three variables.")
)                      

#map_panel 
map_panel <- tabPanel("Global Suicide rate",
    sidebarLayout(
        sidebarPanel(
            h3("Adjustable Graphical Parameters"),
            sr_input
        ),
        ### Main panel displays the map
        mainPanel(
            h3("Map"),
            plotlyOutput(outputId = "plot_data"),
            p("This map shows country with their suicide rates.")
        )
    )
)


#plot_panel
plot_panel <- tabPanel("Relation Between Variables",
    sidebarLayout(
        sidebarPanel(
            h3("Choose x and y variable"),
            x_input,
            y_input
        ),
        mainPanel(
            h3("Scatterplot"),
            plotlyOutput(outputId = "scatter"),
            p("This scatterplot can show the relationship between three variable.")
        )
    )
)

#bar_panel
bar_panel <- tabPanel("Countries with Top20 Beer Consumption",
                      sidebarLayout(
                          sidebarPanel(
                              h3("Adjustable Graphic Parameter"),
                              bar_y_input
                          ),
                          mainPanel(
                              h3("Bar Chart"),
                              plotlyOutput(outputId = "bar_chart"),
                              p("This bar chart shows...")
                )
        )
)
    
    
#summary panel    
summ_panel <-  tabPanel("Conslusion",
        h3("Three speicific takeaways from this project"),
        p("First, ..."),
        p("Then, ..."),
        p("Moreover, ...")

)

#ui
ui<- navbarPage(
    "Final Project",
    intro_panel,
    map_panel,
    plot_panel,
    bar_panel,
    summ_panel
)

