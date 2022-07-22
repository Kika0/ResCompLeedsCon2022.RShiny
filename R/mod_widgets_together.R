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
                    #              h5("This plot shows boxplots of the distance
                    # to public transport for households that
                    # own the selected number(s) of the selected vehicle type."),
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

  })
}

## To be copied in the UI
# mod_widgets_together_ui("widgets_together_1")

## To be copied in the server
# mod_widgets_together_server("widgets_together_1")
