# Figure 2 — incarceration rate and growth, 1979–2019 (BJS)

plot_figure2 <- function() {
  left_lim <- c(0, 600)
  right_lim <- c(-4, 14)
  to_left <- function(x) rescale_to(x, from = right_lim, to = left_lim)
  to_right <- function(x) rescale_to(x, from = left_lim, to = right_lim)

  fig2 <- load_figure2()

  fig2_long <- bind_rows(
    fig2 %>%
      transmute(
        year,
        series = "Total incarceration rate",
        value = incarceration_rate
      ),
    fig2 %>%
      filter(!is.na(change_incarceration_pct)) %>%
      transmute(
        year,
        series = "Change in incarceration rate (%)",
        value = to_left(change_incarceration_pct)
      ),
    fig2 %>%
      transmute(
        year,
        series = "Rate of growth of population",
        value = to_left(pop_growth_pct)
      )
  ) %>%
    mutate(series = factor(
      series,
      levels = c(
        "Total incarceration rate",
        "Change in incarceration rate (%)",
        "Rate of growth of population"
      )
    ))

  ggplot(fig2_long, aes(year, value, colour = series, linetype = series)) +
    geom_hline(yintercept = to_left(0), colour = "grey80", linewidth = 0.3) +
    geom_line(linewidth = 0.7) +
    scale_colour_manual(values = c(
      "Total incarceration rate" = "#111111",
      "Change in incarceration rate (%)" = "#666666",
      "Rate of growth of population" = "#111111"
    )) +
    scale_linetype_manual(values = c(
      "Total incarceration rate" = "solid",
      "Change in incarceration rate (%)" = "solid",
      "Rate of growth of population" = "22"
    )) +
    scale_x_continuous(
      name = NULL,
      breaks = seq(1979, 2019, 4),
      expand = expansion(mult = c(0.01, 0.02))
    ) +
    scale_y_continuous(
      name = "Incarcerated per 100,000 individuals",
      limits = left_lim,
      breaks = seq(0, 600, 100),
      sec.axis = sec_axis(to_right, name = "Rate of growth", breaks = seq(-4, 14, 2))
    ) +
    labs(
      title = "Figure 2. Change in level and growth of incarceration rate, 1979–2019",
      caption = "Source: Authors' calculations based on Bureau of Justice Statistics."
    ) +
    theme_paper() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 7))
}
