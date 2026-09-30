# Load packages
library(tidyverse)

# Load data
penguins <- read.table("data/penguin_data.txt",header = T)

# Inspect data
glimpse(penguins)

# Linear regression
model1 <- lm(body_mass_g ~ flipper_length_mm,data = penguins)
summary(model1)

# Plot relationship between flipper length and body mass
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = 
                       species)) +
  geom_point() +
  stat_smooth(method = "lm")

# Save plot
ggsave("figs/1_flipper_bodymass_regression.png")

# Select female penguins
penguins_female <- subset(penguins,sex == "female")

# Save processed dataset
write_tsv(penguins_female,"results/1_penguin_female_only.txt")

# Second version for Git practice111222