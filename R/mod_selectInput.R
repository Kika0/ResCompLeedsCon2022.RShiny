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
    h2("Traveltime per occupation")
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
