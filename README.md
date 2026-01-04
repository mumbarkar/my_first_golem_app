
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{histogramApp}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/mumbarkar/my_first_golem_app/graph/badge.svg)](https://app.codecov.io/gh/mumbarkar/my_first_golem_app)
[![R-CMD-check](https://github.com/mumbarkar/my_first_golem_app/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mumbarkar/my_first_golem_app/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Installation

You can install the development version of `{histogramApp}` like so:

``` r
# Install from GitHub (after you upload the repo)
# install.packages("devtools")
devtools::install_github("mumbarkar/my_first_golem_app")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo mumbarkar/my_first_golem_app@HEAD
#> 
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\lenovo\AppData\Local\Temp\Rtmp0oXYwu\remotes4cac37ea19f8\mumbarkar-my_first_golem_app-a67ca0d/DESCRIPTION' ...  ✔  checking for file 'C:\Users\lenovo\AppData\Local\Temp\Rtmp0oXYwu\remotes4cac37ea19f8\mumbarkar-my_first_golem_app-a67ca0d/DESCRIPTION' (652ms)
#>       ─  preparing 'histogramApp': (604ms)
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts (646ms)
#>   ─  checking for empty or unneeded directories
#>      Omitted 'LazyData' from DESCRIPTION
#>       ─  building 'histogramApp_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/lenovo/AppData/Local/R/win-library/4.5'
#> (as 'lib' is unspecified)

# install.packages("pak")
pak::pak("mumbarkar/my_first_golem_app")
#> 
#> ✔ Updated metadata database: 4.52 MB in 3 files.
#> ℹ Updating metadata database✔ Updating metadata database ... done
#>  
#> ℹ No downloads are needed
#> ✔ 1 pkg + 36 deps: kept 36 [37.3s]
```

## Run

You can launch the application by running:

``` r
histogramApp::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2026-01-04 19:27:45 IST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading histogramApp
#> ── R CMD check results ──────────────────────────── histogramApp 0.0.0.9000 ────
#> Duration: 1m 12s
#> 
#> ❯ checking tests ...
#>   See below...
#> 
#> ❯ checking code files for non-ASCII characters ... WARNING
#>   Found the following file with non-ASCII characters:
#>     R/mod_poisson_hist.R
#>   Portable packages must use only ASCII characters in their R code and
#>   NAMESPACE directives, except perhaps in comments.
#>   Use \uxxxx escapes for other characters.
#>   Function 'tools::showNonASCIIfile' can help in finding non-ASCII
#>   characters in files.
#> 
#> ❯ checking dependencies in R code ... WARNING
#>   '::' or ':::' import not declared from: 'ggplot2'
#> 
#> ❯ checking top-level files ... NOTE
#>   Non-standard file/directory found at top level:
#>     'Shiny_Engineering_Prototype_to_Production_with_golem.pdf'
#> 
#> ❯ checking package subdirectories ... NOTE
#>   Problems with news in 'NEWS.md':
#>   No news entries found.
#> 
#> ❯ checking R code for possible problems ... [10s] NOTE
#>   mod_poisson_hist_server : <anonymous>: no visible global function
#>     definition for 'rpois'
#>   mod_poisson_hist_server : <anonymous>: no visible global function
#>     definition for 'dpois'
#>   mod_poisson_hist_server : <anonymous>: no visible binding for global
#>     variable 'value'
#>   mod_poisson_hist_server : <anonymous>: no visible binding for global
#>     variable 'x'
#>   mod_poisson_hist_server : <anonymous>: no visible binding for global
#>     variable 'density'
#>   mod_poisson_hist_server : <anonymous>: no visible global function
#>     definition for 'var'
#>   mod_poisson_hist_server : <anonymous>: no visible global function
#>     definition for 'sd'
#>   Undefined global functions or variables:
#>     density dpois rpois sd value var x
#>   Consider adding
#>     importFrom("stats", "density", "dpois", "rpois", "sd", "var")
#>   to your NAMESPACE file.
#> 
#> ── Test failures ───────────────────────────────────────────────── testthat ────
#> 
#> > # This file is part of the standard setup for testthat.
#> > # It is recommended that you do not modify it.
#> > #
#> > # Where should you do additional test configuration?
#> > # Learn more about the roles of various files in:
#> > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
#> > # * https://testthat.r-lib.org/articles/special-files.html
#> > 
#> > library(testthat)
#> Warning message:
#> package 'testthat' was built under R version 4.5.1 
#> > library(histogramApp)
#> > 
#> > test_check("histogramApp")
#> Loading required package: shiny
#> [ FAIL 3 | WARN 1 | SKIP 1 | PASS 88 ]
#> 
#> ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
#> • rlang_is_interactive() is not TRUE (1): 'test-golem-recommended.R:72:5'
#> 
#> ══ Warnings ════════════════════════════════════════════════════════════════════
#> ── Warning ('test-golem-recommended.R:55:1'): (code run outside of `test_that()`) ──
#> package 'shiny' was built under R version 4.5.2
#> Backtrace:
#>     ▆
#>  1. └─shiny::testServer(...) at test-golem-recommended.R:55:1
#>  2.   └─base::require(shiny)
#>  3.     ├─base::tryCatch(...)
#>  4.     │ └─base (local) tryCatchList(expr, classes, parentenv, handlers)
#>  5.     │   └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
#>  6.     │     └─base (local) doTryCatch(return(expr), name, parentenv, handler)
#>  7.     └─base::library(...)
#>  8.       └─base (local) testRversion(pkgInfo, package, pkgpath)
#> 
#> ══ Failed tests ════════════════════════════════════════════════════════════════
#> ── Failure ('test-golem_utils_ui.R:96:3'): Test undisplay works ────────────────
#> as.character(b) (`actual`) not equal to "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\">go</button>" (`expected`).
#> 
#> lines(actual) vs lines(expected)
#> - "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\">"
#> - "  <span class=\"action-label\">go</span>"
#> - "</button>"
#> + "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\">go</button>"
#> ── Failure ('test-golem_utils_ui.R:102:3'): Test undisplay works ───────────────
#> as.character(b_undisplay) (`actual`) not equal to "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\" style=\"display: none;\">go</button>" (`expected`).
#> 
#> lines(actual) vs lines(expected)
#> - "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\" style=\"display: none;\">"
#> - "  <span class=\"action-label\">go</span>"
#> - "</button>"
#> + "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\" style=\"display: none;\">go</button>"
#> ── Failure ('test-mod_poisson_hist.R:32:3'): module ui works ───────────────────
#> `ui` has class 'bslib_fragment, shiny.tag', not class 'shiny.tag.list'.
#> 
#> [ FAIL 3 | WARN 1 | SKIP 1 | PASS 88 ]
#> Error: Test failures
#> Execution halted
#> 
#> 1 error ✖ | 2 warnings ✖ | 3 notes ✖
#> Error:
#> ! R CMD check found ERRORs
```

``` r
covr::package_coverage()
#> Error:
#> ! Failure in `C:/Users/lenovo/AppData/Local/Temp/Rtmp0oXYwu/R_LIBS4cac36282bf7/histogramApp/histogramApp-tests/testthat.Rout.fail`
#>  type=\"button\" class=\"btn btn-default action-button\" style=\"display: none;\">"
#> - "  <span class=\"action-label\">go</span>"
#> - "</button>"
#> + "<button id=\"go_filter\" type=\"button\" class=\"btn btn-default action-button\" style=\"display: none;\">go</button>"
#> ── Failure ('test-mod_poisson_hist.R:32:3'): module ui works ───────────────────
#> `ui` has class 'bslib_fragment, shiny.tag', not class 'shiny.tag.list'.
#> 
#> [ FAIL 3 | WARN 1 | SKIP 1 | PASS 88 ]
#> Error: Test failures
#> Execution halted
```
