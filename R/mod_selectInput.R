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
    h2("Travel time per occupation"),
    tags$p("The histogram shows counts of survey respondents in each bin of travel time of the trips recorded."),
    fluidRow(column(4,
                    selectInput(ns("occupation"), label = "Occupation:",
                                choices=c("FDI","Private","Retired","State","Student"),
                                selected = "FDI"),
                    hr(),
                    helpText("Travel time counts for a given occupation.
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

    #specify R functioning to create the plot from the input$occupation
    output$travtimePlot <- renderPlot({
      df1 <- switch(input$occupation,
                    "FDI" = survey[survey$occup=="fdi",],
                    "Private" = survey[survey$occup=="private",],
                    "Student" = survey[survey$occup=="student",],
                    "Retired" = survey[survey$occup=="retired",],
                    "State" = survey[survey$occup=="state",])
      bincolour <- switch(input$occupation,
                          "FDI" =pal_futurama("planetexpress")(5)[1],
                          "Private" = pal_futurama("planetexpress")(5)[2],
                          "Student" = pal_futurama("planetexpress")(5)[3],
                          "Retired" = pal_futurama("planetexpress")(5)[4],
                          "State" = pal_futurama("planetexpress")(5)[5])
      outline <- switch(input$occupation,
                        "FDI" =pal_rickandmorty("schwifty")(5)[1],
                        "Private" = pal_rickandmorty("schwifty")(5)[2],
                        "Student" = pal_rickandmorty("schwifty")(5)[3],
                        "Retired" = pal_rickandmorty("schwifty")(5)[4],
                        "State" = pal_rickandmorty("schwifty")(5)[5])
      ggplot(data = df1,
             aes(x = travtime)) + geom_histogram(bins = 20,col=outline,fill=bincolour)+

        xlab("Travel time")+
        ylab("Counts")+
        ggtitle(paste0("Traveltime per Occupation: ",input$occupation))+
        xlim(0,120) +
        theme(legend.position="none") +
        theme(
          #        panel.background = element_rect(fill = "transparent"), # bg of the panel
          plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
          #    panel.grid.major = element_blank(), # get rid of major grid
          #     panel.grid.minor = element_blank(), # get rid of minor grid
          legend.background = element_rect(fill = "transparent"), # get rid of legend bg
          legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
        )
    },bg="transparent") #end of renderPlot
  })
}

## To be copied in the UI
# mod_selectInput_ui("selectInput_1")

## To be copied in the server
# mod_selectInput_server("selectInput_1")
