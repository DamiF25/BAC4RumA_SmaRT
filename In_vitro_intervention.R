library(tidyverse)
library(grid)   # for unit()

# Read the CSV
df <- read.csv("In_vitro_intervention.csv", stringsAsFactors = FALSE)

# Reshape to long format
df_long <- df %>%
  pivot_longer(cols = c(Goat, Sheep),
               names_to = "Ruminant",
               values_to = "Count")

# Plot grouped bar chart
p <- ggplot(df_long, aes(x = Intervention, y = Count, fill = Ruminant)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(values = c("Goat" = "#06948E", "Sheep" = "#E4DC61")) +
  ggtitle("In vitro") +
  labs(
    x = "Intervention model",
    y = "Studies (n)",
    fill = "Ruminant"
  ) +
  theme_classic(base_size = 28) +
  theme(
    legend.key.height = unit(1.0, "cm"),
    legend.spacing.y  = unit(0.6, "cm"),
    axis.text = element_text(color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title.x = element_text(face = "bold", size = 24),
    axis.title.y = element_text(face = "bold", size = 24),
    legend.title = element_text(face = "bold", size = 24),
    plot.title = element_text(face = "bold", size = 24, hjust = 0.5)
  )
# Print plot
print(p)

# Save high-resolution plot
ggsave(
  filename = "in_vitro_intervention.png",
  plot = p,
  width = 6.8, height = 6.5, units = "in",
  dpi = 600)
