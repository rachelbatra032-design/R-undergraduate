# Figure 6 — incarceration by education and race (NLSY79)

plot_figure6 <- function() {
  ggplot(load_figure6(), aes(education, incarcerated_pct, fill = year)) +
    geom_col(position = position_dodge(width = 0.85), width = 0.8) +
    facet_wrap(~ race, nrow = 1) +
    scale_fill_manual(values = year_cols) +
    scale_y_continuous(
      limits = c(0, 16),
      breaks = seq(0, 16, 2),
      expand = expansion(mult = c(0, 0.03))
    ) +
    labs(
      title = "Figure 6. Incarceration rate by education and race",
      y = "Incarcerated (%) in sample",
      x = NULL,
      caption = "Source: Authors' calculations based on NLSY79."
    ) +
    theme_paper() +
    theme(axis.text.x = element_text(size = 8, lineheight = 0.95))
}
