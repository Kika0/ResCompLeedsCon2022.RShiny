# ResCompLeedsCon2022.RShiny

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of ResCompLeedsCon2022.RShiny is to provide an example Shiny dashboard that can be used to share academic findings, which was created for [ResCompLeedsCon2022](https://rescompleedscon.github.io/conference2022/). The dashboard tabs include interactive plots and maps with HTML widgets.

## Installation

You can install and run the development version of ResCompLeedsCon2022.RShiny like so:

``` r
install_github("Kika0/ResCompLeedsCon2022.RShiny")
library(ResCompLeedsCon2022.RShiny)
run_app()
```

## Hanoi Transport survey

The original dashboard was created as a part of a wider project: [Urban Transport Modelling for Sustainable Well-Being in Hanoi](https://urban-analytics.github.io/UTM-Hanoi/intro.html). The interactive widgets update plots and maps to communicate survey findings. The dataset was created by randomizing the rows of the survey hence the values demonstate the functionality but do not show the survey findings.

## Useful Resources

- [Shiny Learning Resources](https://shiny.rstudio.com/tutorial/) 
- [Mastering Shiny book](https://mastering-shiny.org/)
- {golem} package documentation(https://thinkr-open.github.io/golem/index.html)
- [Demonstration of the {golem} package](https://www.youtube.com/watch?v=3-p9XLvoJV0&t=622s)
- [Engineering Production-Grade Shiny Apps book](https://engineering-shiny.org/)

## Acknowledgments

Acknowledgements to [Eric Wanjau](https://github.com/R-icntay) for helping with randomizing the survey responses and [Lex Comber](https://github.com/lexcomber) for the exploratory data analysis scripts that served as a starting point for the plots in the dashboard.



