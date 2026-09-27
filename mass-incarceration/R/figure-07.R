# Figure 7 — average family income, in jail vs not (NLSY79)

plot_figure7 <- function() {
  ggplot(load_figure7(), aes(race, income, fill = status)) +
    geom_col(position = position_dodge(width = 0.8), width = 0.75) +
    facet_wrap(~ year, nrow = 1) +
    scale_fill_manual(values = c("In jail" = "#2b2b2b", "Not in jail" = "#b0b0b0")) +
    scale_y_continuous(
      labels = label_number(big.mark = ","),
      limits = c(0, 60000),
      breaks = seq(0, 60000, 10000),
      expand = expansion(mult = c(0, 0.03))
    ) +
    labs(
      title = "Figure 7. Incarceration and average family income",
      y = "Average family income (in $/year)",
      x = NULL,
      caption = "Source: Authors' calculations based on NLSY79."
    ) +
    theme_paper()
}
