#' widgets_together UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_widgets_together_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Distance to public transport and vehicle ownership"),
    fluidRow(column(4,
                    h5("This plot shows boxplots of the distance
                    to public transport for households that
                    own the selected number(s) of the selected vehicle type."),
                    selectInput(inputId=ns("veh_type"),label="Vehicle Type",
                                choices=c("Car"="own_car","E-bike"="own_ebike","Bike"="own_bike","Motorbike"="own_motob")
                    ),
                    checkboxGroupInput(inputId=ns("no_of_veh"),label="Number of vehicles considered:",
                                       choiceNames=c("0","1","2","3","4","5 and more"),
                                       choiceValues=c("0","1","2","3","4","more_5"),
                                       selected = c("0","1")),
                    sliderInput(inputId =ns("distminmax"),
                                label="Minimum and maximum distance considered (in meters)",
                                min=0,max=2000,value=c(0,1500))),
             column(8,plotOutput(outputId=ns("veh")))
    )

  )
}

#' widgets_together Server Functions
#'
#' @noRd
mod_widgets_together_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$veh <- renderPlot({
      veh <- switch(input$veh_type,
                    "own_car"="cars",
                    "own_ebike"="electronic bikes",
                    "own_bike"="bikes",
                    "own_motob"="motorbikes")
      df3 <- reactive({ survey %>%
          filter(!!sym(input$veh_type) %in% input$no_of_veh) %>% filter((dist_to_pub > input$distminmax[1])&(dist_to_pub < input$distminmax[2]))  })
      ggplot(data=df3(),aes(x=dist_to_pub,y=!!sym(input$veh_type),fill=!!sym(input$veh_type))) +
        geom_boxplot() +
        xlim(input$distminmax[1],input$distminmax[2]) +
        #add reactive title
        ggtitle(paste("Ownership of",veh,sep=" ")) +
        #specify colours (rick and morty palette)
        scale_fill_rickandmorty(palette="schwifty") +
        xlab("Distance to public transport") +
        ylab(paste0("Number of ",veh)) +
        theme_bw() +
        theme(legend.position="none") +
        theme(
          panel.background = element_rect(fill = "transparent"), # bg of the panel
          plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
          #    panel.grid.major = element_blank(), # get rid of major grid
          #     panel.grid.minor = element_blank(), # get rid of minor grid
          legend.background = element_rect(fill = "transparent"), # get rid of legend bg
          legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
        )
    },bg="transparent") # end of renderPlot
  })
}

## To be copied in the UI
# mod_widgets_together_ui("widgets_together_1")

## To be copied in the server
# mod_widgets_together_server("widgets_together_1")
