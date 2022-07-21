#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    dashboardPage(
      dashboardHeader(title =tags$a("Hanoi Transport Survey", href="https://urban-analytics.github.io/UTM-Hanoi/",target="_blank")),
      dashboardSidebar(
        sidebarMenu(

          menuItem("selectInput example",tabName = "selectInput"),
        menuItem("Widgets together",tabName = "widgets_together"),
      menuItem("radioButtons tmap",tabName = "radioButtons_tmap"))
        ),
      dashboardBody(
        shinyDashboardThemes(
          theme = "blue_gradient"),
        tabItems(
          tabItem(tabName = "selectInput",
                  mod_selectInput_ui("selectInput_1")),
          tabItem(tabName = "widgets_together",
                  mod_widgets_together_ui("widgets_together_1")),
          tabItem(tabName = "radioButtons_tmap",
                  mod_radioButtons_tmap_ui("radioButtons_tmap_1"))
        )))
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ResCompLeedsCon2022.RShiny"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
