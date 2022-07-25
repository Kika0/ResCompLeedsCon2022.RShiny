#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  mod_selectInput_server("selectInput_1")
  mod_widgets_together_server("widgets_together_1")
  mod_radioButtons_tmap_server("radioButtons_tmap_1")
}
