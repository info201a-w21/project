source("server.R")

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

ui <- tabPanel(
    titlePanel("Global Suicide rate"),
    sidebarLayout(
        sidebarPanel(
            h3("Adjustable Graphical Parameters"),
            sr_input
        ),
        ### Main panel displays the scatterplot
        mainPanel(
            h3("Map"),
            plotlyOutput(outputId = "plot_data"),
            p("This map shows country with their suicide rates.")
        )
    )
)