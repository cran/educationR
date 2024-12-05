## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 10,  
  fig.height = 6 
)

## ----setup--------------------------------------------------------------------
library(educationR)

library(ggplot2)

library(dplyr)


## ----ggplot2_001--------------------------------------------------------------

# Example: Visualizing math achievement by gender
Achieve_tbl_df %>%
  ggplot(aes(x = gender, y = score)) +
  geom_boxplot() +
  labs(title = "Math Achievement by Gender",
       x = "Gender",
       y = "Achievement Score") +
  theme_minimal()


## ----ggplot2_002--------------------------------------------------------------

# Example: Visualizing the relationship between quiz scores and lecture pulse rates
QuizPulse10_df %>%
  ggplot(aes(x = Quiz, y = Lecture)) +
  geom_point(alpha = 0.6) +
  labs(title = "Quiz Scores vs. Lecture Pulse Rates",
       x = "Quiz Score",
       y = "Pulse Rate (beats per minute)") +
  theme_minimal()


