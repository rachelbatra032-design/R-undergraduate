# Figure 5 — incarceration by gender and race (NLSY79)

plot_figure5 <- function() {
  ggplot(load_figure5(), aes(gender, incarcerated_pct, fill = year)) +
    geom_col(position = position_dodge(width = 0.85), width = 0.8) +
    facet_wrap(~ race, nrow = 1) +
    scale_fill_manual(values = year_cols) +
    scale_y_continuous(limits = c(0, 8), breaks = 0:8, expand = expansion(mult = c(0, 0.03))) +
    labs(
      title = "Figure 5. Incarceration rate by gender and race",
      y = "Incarcerated (%) in sample",
      x = NULL,
      caption = "Source: Authors' calculations based on NLSY79."
    ) +
    theme_paper()
}
