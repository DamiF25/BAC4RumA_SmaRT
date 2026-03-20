# Load required packages (if required)

# Load libraries
library(ggplot2)
library(readr)
library(dplyr)

# Import data
# If your CSV is saved locally, adjust the path:
data <- read_csv("Publication_no_year.csv", show_col_types = FALSE)

# Basic data check
print(data)

# Create bar chart with trend line
p <- ggplot(data, aes(x = factor(Year), y = Publication)) +
    geom_col(fill = "#06948E", width = 0.7) +
    geom_smooth(aes(group = 1), 
            method = "loess",
            se = FALSE,
            color = "#E4DC61", 
            linewidth = 1.2) +
    labs(x = "Year",
       y = "Number of publications",
       title = NULL) +
  theme_classic(base_size = 28) +
  theme(
    axis.text = element_text(color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold"),
    plot.title = element_text(face = "bold", size = 20)
  )


# Display plot
print(p)

# Save high-resolution plot
ggsave(
  filename = "publication_trend.png",
  plot = p,
  width = 8, height = 6, units = "in",
  dpi = 600)
