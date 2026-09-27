# R-undergraduate

R scripts from undergraduate work at St Stephen's College, University of Delhi.

## Contents

| Folder | Focus |
| --- | --- |
| [mass-incarceration](mass-incarceration/) | Visualising mass incarceration data (`ggplot2`) |

The first project draws figures 2, 3, 5, 6 and 7 from Taneja, Batra and Singh (2025), *Mass Incarceration in the US Unveiled: Trends, Disparities, Implications, and Beyond*, *Economic and Political Weekly*. The tables are Bureau of Justice Statistics and NLSY79. Figure 4 is omitted (no data in the workbook).

`mass-incarceration/data/` holds the Excel workbook and tidy CSV extracts. `mass-incarceration/figures/` is the plotted output — click a PNG on GitHub to preview it.

## Run the mass-incarceration figures

1. Install [R](https://cran.r-project.org/).
2. Install packages: `ggplot2`, `dplyr`, `tidyr`, `scales`.
3. From this folder:

```r
Rscript mass-incarceration/plot_figures.R
```
