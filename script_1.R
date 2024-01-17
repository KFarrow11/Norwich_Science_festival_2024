# PACKAGES ----
library(tidyverse)
library(janitor)
library(RColorBrewer)
library(colorBlindness)
library(readr)
library(ggpattern)

# IMPORT DATA ----
science <- read.csv("C:/R_files/norwich_sci_fest_2024norwich_sci_fest_2024/data/nsf_2024_r_data.csv")


head(science) 
glimpse(science)
 
science <- rename(science,
                  "subject"="choice")  # use rename from the dplyr package 

colnames(science) # quickly check the new variable names

# PLOT 1 / original view with Excel ----
sub_colours <- s <-c("lightskyblue4", "goldenrod", "darkorchid4")


science_plot <- science %>%
    ggplot(aes(x=subject))+
    geom_bar(fill = sub_colours, width = 0.8)+
    scale_fill_manual(values = sub_colours)+
    theme_void()+
  labs(x = "Subject",
       y = "Popularity",
       title = "Favorite science subject",
       caption = "Data Detectives Norwich Science Festival 2024")+
  theme(legend.position = "none", plot.margin=unit (c (0,1,1,1), 'cm'),
    axis.text.x = element_text(face = "bold", color = "black", size = 16, margin = margin(10, 10, 10, 10)),
    axis.text.y = element_text(face = "bold", color = "black", size = 16, margin = margin(10, 10, 10, 10)),
    axis.title.y  = element_text(face = "bold", color = "black", size = 20, angle = 90, margin = margin(20, 20, 20, 20)),
    axis.title.x  = element_text(face = "bold", color = "black", size = 20, margin = margin(10, 10, 10, 10)),
    plot.title = element_text(face = "bold", color = "black", size = 30, margin = margin(20, 20, 20, 20)),
    plot.caption = element_text(face = "bold", color = "darkorchid4", size = 16, margin = margin(1, 5, 1, 1)),
    plot.title.position = "plot")

science_plot

# PLOT 2 / coord_flip----
sci_plot_surprise <- science %>%
    ggplot(aes(x=subject))+
    geom_bar(fill = sub_colours, width = 0.7, size = 0.6)+
    theme_classic()+
    coord_flip()+
  labs(x = "Subject",
       y = "Popularity",
       title = "Favorite science subject",
       caption = "Data Detectives Norwich Science Festival 2024")+
  theme(
    legend.position = "none", plot.margin=unit (c (0,1,1,1), 'cm'),
    axis.text.x = element_text(face = "bold", color = "black", size = 16, margin = margin(10, 10, 10, 10)),
    axis.text.y = element_text(face = "bold", color = "black", size = 16, margin = margin(10, 10, 10, 10)),
    axis.title.y  = element_text(face = "bold", color = "black", size = 20, angle = 90, margin = margin(20, 20, 20, 20)),
    axis.title.x  = element_text(face = "bold", color = "black", size = 20, margin = margin(10, 10, 10, 10)),
    plot.title = element_text(face = "bold", color = "black", size = 30, margin = margin(20, 20, 20, 20)),
    plot.caption = element_text(face = "bold", color = "darkorchid4", size = 16, margin = margin(1, 5, 1, 1)),
    plot.title.position = "plot")

sci_plot_surprise

#plot = data, aes, geom + themes ....

plot <- ggplot(science, aes(x=subject, fill = subject)) +
  geom_bar() # basic plot with colour

ggplotly(plot) # see plot in viewer


plot_2 <- ggplot(science, aes(x=subject, fill = subject)) +
  geom_bar()+
  transition_states(subject)
plot_2






