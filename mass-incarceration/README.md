# mass-incarceration

R (`ggplot2`) to visualise mass incarceration data from Taneja, Batra and Singh (2025), *Economic and Political Weekly*.

| Path | What it is |
| --- | --- |
| [data/Prison_Graphs_Editable_EPW2025.xlsx](data/Prison_Graphs_Editable_EPW2025.xlsx) | Excel workbook (BJS and NLSY79 tables) |
| [data/](data/) | Tidy CSV extracts used by the script |
| [R/](R/) | One file per figure, plus helpers and data loaders |
| [plot_figures.R](plot_figures.R) | Runs all five figures |
| [figures/](figures/) | PNG and PDF output |

Figure 4 is omitted (no data in the workbook).

```r
Rscript plot_figures.R
```
