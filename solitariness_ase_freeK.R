library(RevGadgets)
library(ggplot2)
library(ggtree)
##plot the ancestral state reconstruction result on the tree stomata
setwd("C:/Users/User/Downloads/")
windowsFonts(Arial = windowsFont("Arial"))


file <- "C:/Users/User/Downloads/solitariness_ase_freeK.tree"

# process the ancestral states
freeK <- processAncStates(file,
                          # Specify state labels. 
                          # These numbers correspond to 
                          # your input data file.
                          state_labels = c("1" = "1", 
                                           "0" = "0"))


# produce the plot object
p <- plotAncStatesPie(t = freeK, 
                            layout = "roundrect", 
                            open.angle = 10, 
                            tip_labels_states = FALSE, 
                            tip_labels_size = 3, 
                            tip_labels_offset = 0.001, 
                            tip_labels_italics = TRUE, 
                            pie_colors = c("#E16B8C", "#1B813E"), 
                            tip_pie_size = 0.25, 
                            node_pie_size = 0.5) + 
  theme(legend.position = c(0.1, 0.9), 
        legend.key.height = unit(1, "cm"), 
        legend.key.width = unit(1, "cm"), 
        legend.text = element_text(size = 12), 
        legend.title = element_text(size = 14), 
        text = element_text(family = "Arial"))

p <- p + theme_tree2()
p.re <- revts(p)
p.re + scale_x_continuous(labels = abs)
