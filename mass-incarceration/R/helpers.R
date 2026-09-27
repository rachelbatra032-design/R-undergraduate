year_cols <- c(
  "1980" = "#1b1b1b",
  "1990" = "#5a5a5a",
  "2000" = "#8f8f8f",
  "2010" = "#c4c4c4"
)

theme_paper <- function() {
  theme_minimal(base_size = 11, base_family = "Helvetica") +
    theme(
      plot.title = element_text(face = "bold", size = 12, margin = margin(b = 8)),
      plot.caption = element_text(size = 8, colour = "grey40", hjust = 0, margin = margin(t = 8)),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(size = 9),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      axis.title = element_text(size = 9),
      axis.text = element_text(size = 8, colour = "grey20"),
      strip.text = element_text(face = "bold", size = 10),
      plot.margin = margin(10, 14, 10, 10)
    )
}

# Map a secondary-axis series onto the primary scale (and back).
rescale_to <- function(x, from, to) {
  (x - from[1]) / diff(from) * diff(to) + to[1]
}

save_figure <- function(plot, name, width = 8, height = 5) {
  ggsave(file.path(fig_dir, paste0(name, ".pdf")), plot, width = width, height = height)
  ggsave(file.path(fig_dir, paste0(name, ".png")), plot, width = width, height = height, dpi = 200)
}
