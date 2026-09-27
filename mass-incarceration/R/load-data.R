# Tidy extracts from data/Prison_Graphs_Editable_EPW2025.xlsx.
# Figure 4 has no data in the workbook.

load_csv <- function(name) {
  read.csv(file.path(data_dir, name), stringsAsFactors = FALSE)
}

load_figure2 <- function() {
  load_csv("figure2.csv") %>%
    filter(year >= 1979, year <= 2019)
}

load_figure3 <- function() {
  load_csv("figure3.csv") %>%
    pivot_longer(c(total_pct, black_pct), names_to = "series", values_to = "rate") %>%
    mutate(series = recode(series, total_pct = "Total", black_pct = "Black"))
}

load_figure5 <- function() {
  load_csv("figure5.csv") %>%
    mutate(
      year = factor(year),
      gender = factor(gender, levels = c("Male", "Female")),
      race = factor(race, levels = c("Black", "Hispanic", "White"))
    )
}

load_figure6 <- function() {
  load_csv("figure6.csv") %>%
    mutate(
      year = factor(year),
      race = factor(race, levels = c("Black", "Hispanic", "White")),
      education = factor(
        recode(
          education,
          "High School Dropout" = "High school\ndropout",
          "Middle School" = "Middle school",
          "College" = "College"
        ),
        levels = c("College", "High school\ndropout", "Middle school")
      )
    )
}

load_figure7 <- function() {
  load_csv("figure7.csv") %>%
    pivot_longer(c(in_jail, not_in_jail), names_to = "status", values_to = "income") %>%
    mutate(
      status = recode(status, in_jail = "In jail", not_in_jail = "Not in jail"),
      race = factor(race, levels = c("Black", "Hispanic", "White")),
      year = factor(year)
    )
}
