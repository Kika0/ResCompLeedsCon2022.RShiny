#' selectInput UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_selectInput_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Traveltime per occupation"),
    tags$p("The histogram shows counts of survey respondents in each bin of travel-time of the trips recorded."),
    fluidRow(column(4,
                    selectInput(ns("occupation"), label = "Occupation:",
                                choices=c("FDI","Private","Retired","State","Student"),
                                selected = "FDI"),
                    hr(),
                    helpText("Travel-time counts for a given occupation.
                     Limits of x-axis are 0-120.")),
             column(8,plotOutput(outputId=ns("travtimePlot")))
    ) #end of traveltime per occupation fluidRow
  )
}

#' selectInput Server Functions
#'
#' @noRd
mod_selectInput_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_selectInput_ui("selectInput_1")

## To be copied in the server
# mod_selectInput_server("selectInput_1")
