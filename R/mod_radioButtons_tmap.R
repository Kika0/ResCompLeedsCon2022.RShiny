#' radioButtons_tmap UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_radioButtons_tmap_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Map of origin and destination")
  )
}

#' radioButtons_tmap Server Functions
#'
#' @noRd
mod_radioButtons_tmap_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_radioButtons_tmap_ui("radioButtons_tmap_1")

## To be copied in the server
# mod_radioButtons_tmap_server("radioButtons_tmap_1")
