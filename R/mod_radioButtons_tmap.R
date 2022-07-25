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

    h2("Map of origin and destination for the selected mode of transport"),
    tags$p("The choropleth maps show counts of origins and destinations from each Hanoi commune."),

    radioButtons(inputId=ns("vehicle"),label= NULL,inline=TRUE,
                 choices = c("Motorbike"="moto","Walk"="walk","Bus"="bus",
                             "E-Bike"="ebike","Bike"="bike","Car"="car","Taxi"="taxi")),
    fluidRow(
  column(6,h3("Origin"),tmapOutput(outputId = ns("Operveh"))),
  column(6,h3("Destination"),tmapOutput(outputId = ns("Dperveh"))))
  )
}

#' radioButtons_tmap Server Functions
#'
#' @noRd
mod_radioButtons_tmap_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$Operveh <- renderTmap({
      tmap_options(basemaps = "OpenStreetMap")
      tm_shape(origin) +
        tm_polygons(col= input$vehicle,palette=viridis(n=7),alpha = 0.5,title=paste0("Mode of transport: ",input$vehicle))

    }) # end of renderTmap
    output$Dperveh <- renderTmap({
      tmap_options(basemaps = "OpenStreetMap")
      tm_shape(origin) +
        tm_polygons(col= input$vehicle,palette=viridis(n=7),alpha = 0.5,title=paste0("Mode of transport: ",input$vehicle))
    }) # end of renderTmap
  })
}

## To be copied in the UI
# mod_radioButtons_tmap_ui("radioButtons_tmap_1")

## To be copied in the server
# mod_radioButtons_tmap_server("radioButtons_tmap_1")
