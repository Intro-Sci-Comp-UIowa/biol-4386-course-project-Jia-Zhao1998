This folder includes scripts for this project.
# Motif search
## MotifSearch.py
 - A python script that includes Python codes about searching motifs (consensus and 1-bp off motifs of transcription factor CgPho4 and ScPho4)and export the information as csv in Python.

# Plot Position vs Nuclesome Occupancy
## random_plot.R
- The old root function
- Basic plotting system
- Plot the nucleosome occupancy by calling any start and end coordiinate position of a chromosome
## random-ggplot.R
- The new root function
- ggplot2 plotting system
- Plot the nucleosome occupancy by calling any start and end coordiinate position of a chromosome
## Nucleosome_Occupancy_PromoterPlot.R
- Based on random_plot.R. Old
- Basic plotting system
- Plot the nucleosome occupancy in the promoter region (upstream 800 bp the start codon ATG) of a gene
## Promoter_ggplot_NoPi.R
- Based on random_ggplot
- ggplot2 plotting system
- Plot the nucleosome occupancy in No Pi in the promoter region (upstream 800 bp from the start codon ATG) of a gene
## Promoter_ggplot_HighPi.R
- Based on random_ggplot
- ggplot2 plotting system
- Plot the nucleosome occupancy in High Pi in the promoter region (upstream 800 bp from the start codon ATG) of a gene
## Promoter_motif_ggplot_NoPi.R
- Based on random_ggplot and Promoter_ggplot_NoPi.R
- ggplot2 plotting system
- Plot the nucleosome occupancy in No Pi in the promoter region (upstream 800 bp from the start codon ATG) of a gene AND motifs
## Promoter__motif_ggplot_HighPi.R
- Based on random_ggplot and Promoter_ggplot_HighPi.R
- ggplot2 plotting system
- Plot the nucleosome occupancy in High Pi in the promoter region (upstream 800 bp from the start codon ATG) of a gene AND motifs

Note: for this project, I use ggplot2 plotting system to produce all figures. 
