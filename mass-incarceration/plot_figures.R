# Visualise mass incarceration data in R (ggplot2).
# Taneja, Batra and Singh, Economic and Political Weekly, 10 May 2025.
# Figure 4 is omitted (no data in the workbook).

options(repos = c(CRAN = "https://cloud.r-project.org"))

need <- c("ggplot2", "dplyr", "tidyr", "scales")
missing <- need[!need %in% rownames(installed.packages())]
if (length(missing) && !nzchar(Sys.getenv("CONDA_PREFIX"))) {
  install.packages(missing, dependencies = TRUE)
}

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

args <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args[grep("^--file=", args)])
root <- if (length(file_arg)) {
  dirname(normalizePath(file_arg))
} else if (sys.nframe() > 0L && !is.null(sys.frame(1)$ofile)) {
  dirname(normalizePath(sys.frame(1)$ofile))
} else {
  getwd()
}

data_dir <- file.path(root, "data")
fig_dir <- file.path(root, "figures")
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

source(file.path(root, "R", "helpers.R"), local = FALSE)
source(file.path(root, "R", "load-data.R"), local = FALSE)
source(file.path(root, "R", "figure-02.R"), local = FALSE)
source(file.path(root, "R", "figure-03.R"), local = FALSE)
source(file.path(root, "R", "figure-05.R"), local = FALSE)
source(file.path(root, "R", "figure-06.R"), local = FALSE)
source(file.path(root, "R", "figure-07.R"), local = FALSE)

save_figure(plot_figure2(), "figure2", width = 9, height = 5.2)
save_figure(plot_figure3(), "figure3", width = 7.2, height = 4.8)
save_figure(plot_figure5(), "figure5", width = 8, height = 5)
save_figure(plot_figure6(), "figure6", width = 9, height = 5.2)
save_figure(plot_figure7(), "figure7", width = 8, height = 5)

message("Wrote figures to ", fig_dir)
