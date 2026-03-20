# Load required packages, if required

# Load required library
library(ggplot2)
library(readr)
library(dplyr)

# Read the CSV file
# Make sure your CSV has columns: Bacterial_isolate, Study_no
df <- read_csv("Bacterial_isolates.csv", show_col_types = FALSE)

# Ensure correct factor ordering (optional: sorts by count)
df <- df %>%
  arrange(Study_no) %>%
  mutate(Bacterial_isolate = factor(Bacterial_isolate, levels = Bacterial_isolate))

# Bubble plot
p <- ggplot(df, aes(x = Study_no, 
                    y = Bacterial_isolate, 
                    size = Study_no)) +
  geom_point(color = "black") +
  scale_size_continuous(
    range = c(4, 12),          # bubble size range
    name = "Studies (n)" # legend title
  ) +
  scale_x_continuous(
    breaks = seq(0, max(df$Study_no), by = 1)   # scale by 1
  ) +
  labs(
    x = "Studies (n)",
    y = "Bacterial isolates",
    title = NULL
  ) +
  theme_classic(base_size = 24) +
  theme(
    axis.text = element_text(color = "black"),
    axis.title = element_text(face = "bold"),
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "right", legend.title = element_text(face = "bold") 
  )

# Print plot
print(p)

# Save high‑resolution TIFF
ggsave(
  filename = "Bacterial_isolates.tiff",
  plot = p,
  width = 11, height = 5, units = "in", dpi = 600, compression = "lzw")
