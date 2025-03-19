
# `{iomquarto}`

<!-- badges: start -->
<!-- badges: end -->

The [International Organisation for Migration](http://iom.int) is part of the United Nations System. The organisation supports three main strategic objectives:   

  1. Saving lives and protecting people on the move,  
  
  2. Driving solutions to displacement,  
  
  3. Facilitating pathways for regular migration.  

`{iomquarto}` R package aims at simplifying the creation of data stories, data presentations and data report.

## Installation

This package is not yet available on CRAN.

For now, you can retrieve the development version from Github using the `{pak}` package:

``` r
install.packages("pak")
pak::pkg_install("iom/iomquarto")


## A template for power-point like presentation based on reveal.js
iomquarto::create_from_template(template = "prez")

## A regular template for articles
iomquarto::create_from_template(template = "article")

```

## Acknowledgements

This package build on the recent [presentation at Posit Conference](https://meghan.rbind.io/blog/2024-08-14-quarto-templates/).  
