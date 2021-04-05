# Promoter Nucleosome Occupancy Plot of a gene
Nucleosome_Occupancy_PromoterPlot <- function(data = S288cAnnotation_sacCer1, gene = "YBR093C"){
  line2 <- data[which(data$gene == gene),]
  if (line2$strand == "-"){
    random_plot(chromosome = paste("chr", line2$chromosome), start = line2$end + 1, end = line2$end + 800)
    title(main = gene, sub = paste("chr", line2$chromosome))
    axis(1, at = seq(0,-800,-100))
  }else{
    random_plot(chromosome = paste("chr", line2$chromosome), start = line2$start - 800, end = line2$start - 1)
    title(main = gene, sub = paste("chr", line2$chromosome))
    axis(1, at = seq(-800,0,100))
  }
}