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
    h2("Distance to public transport and vehicle ownership")

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
