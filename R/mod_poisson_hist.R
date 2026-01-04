#' poisson_hist UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_poisson_hist_ui <- function(id) {
  ns <- NS(id)

  bslib::card(
    bslib::card_header("CLT Simulation using Poisson Distribution"),
    bslib::card_body(
      bslib::layout_columns(
        col_widths = c(3, 9),

        # Add control panels
        bslib::card(
          bslib::card_header("Input Controls"),
          bslib::card_body(
            shiny::sliderInput(
              inputId = ns("lambda"),
              label = "Lambda (λ):",
              min = 0.5,
              max = 20,
              value = 5,
              step = 0.5
            ),
            shiny::sliderInput(
              inputId = ns("sample_size"),
              label = "Sample Size (n):",
              min = 10,
              max = 1000,
              value = 100,
              step = 90
            ),
            shiny::sliderInput(
              inputId = ns("bins"),
              label = "Number of Bins :",
              min = 5,
              max = 50,
              value = 30,
              step = 1
            ),
            shiny::actionButton(
              ns("generate"),
              "Generate New Sample",
              class = "btn-primary w-100"
            )
          )
        ),
        # Plot panel
        bslib::card(
          bslib::card_header("Plot Output"),
          bslib::card_body(
            shiny::plotOutput(ns("histogram"), height = "500px")
          )
        )
      ),
      bslib::card(
        bslib::card_header("Summary Statistics"),
        bslib::card_body(
          bslib::layout_columns(
            col_widths = c(3, 3, 3, 3),
            bslib::value_box(
              title = "Mean",
              value = textOutput(ns("mean")),
              theme = "primary"
            ),
            bslib::value_box(
              title = "Variance",
              value = textOutput(ns("variance")),
              theme = "info"
            ),
            bslib::value_box(
              title = "Std Dev",
              value = textOutput(ns("sd")),
              theme = "success"
            ),
            bslib::value_box(
              title = "Sample Size",
              value = textOutput(ns("n")),
              theme = "warning"
            )
          )
        )
      )
    )
  )
}

#' poisson_hist Server Functions
#' @import shiny
#'
#' @noRd
mod_poisson_hist_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Reactive value to trigger data regeneration
    data_version <- reactiveVal(0)

    # Generate button triggers new data
    observeEvent(input$generate, {
      data_version(data_version() + 1)
    })

    # Generate Poisson data (memoized with reactive)
    poisson_data <- reactive({
      # Depend on lambda, sample_size, and data_version
      input$lambda
      input$sample_size
      data_version()

      rpois(input$sample_size, lambda = input$lambda)
    })

    # Render histogram
    output$histogram <- renderPlot({
      data <- poisson_data()

      # Create data frame for ggplot
      df <- data.frame(value = data)

      # Calculate theoretical Poisson probabilities
      x_range <- seq(0, max(data), by = 1)
      theoretical <- data.frame(
        x = x_range,
        density = dpois(x_range, lambda = input$lambda) * input$sample_size
      )

      ggplot2::ggplot(df, ggplot2::aes(x = value)) +
        ggplot2::geom_histogram(
          bins = input$bins,
          fill = "#2C3E50",
          color = "white",
          alpha = 0.7
        ) +
        ggplot2::geom_line(
          data = theoretical,
          ggplot2::aes(x = x, y = density),
          color = "#E74C3C",
          linewidth = 1.2,
          linetype = "dashed"
        ) +
        ggplot2::labs(
          title = paste0("Poisson Distribution (λ = ", input$lambda, ")"),
          subtitle = paste0("Sample size: ", input$sample_size, " | Bins: ", input$bins),
          x = "Value",
          y = "Frequency",
          caption = "Red dashed line shows theoretical Poisson distribution"
        ) +
        ggplot2::theme_minimal(base_size = 14) +
        ggplot2::theme(
          plot.title = ggplot2::element_text(face = "bold", size = 16),
          plot.subtitle = ggplot2::element_text(color = "gray40"),
          panel.grid.minor = ggplot2::element_blank()
        )
    })

    # Statistics outputs
    output$mean <- renderText({
      sprintf("%.2f", mean(poisson_data()))
    })

    output$variance <- renderText({
      sprintf("%.2f", var(poisson_data()))
    })

    output$sd <- renderText({
      sprintf("%.2f", sd(poisson_data()))
    })

    output$n <- renderText({
      format(length(poisson_data()), big.mark = ",")
    })
  })
}
