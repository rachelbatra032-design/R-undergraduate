# Figure 3 — age profile, all men vs Black men, 2019 (BJS)

plot_figure3 <- function() {
  ggplot(load_figure3(), aes(age, rate, colour = series, shape = series)) +
    geom_line(linewidth = 0.7) +
    geom_point(size = 2) +
    scale_colour_manual(values = c(Total = "#111111", Black = "#777777")) +
    scale_shape_manual(values = c(Total = 16, Black = 17)) +
    scale_x_continuous(breaks = c(18, 28, 38, 48, 58, 68), limits = c(18, 68)) +
    scale_y_continuous(limits = c(0, 6), breaks = 0:6, labels = label_number(accuracy = 1)) +
    labs(
      title = "Figure 3. Incarceration rate of African-American men across age groups",
      y = "%",
      x = NULL,
      caption = "Source: Authors' calculations based on Bureau of Justice Statistics, 2019."
    ) +
    theme_paper()
}
