# This function is to plot the HIGH Pi nucleosome Occupancy score against the position of a promoter of a gene

Promoter_ggplot_HighPi <- function(data = S288cAnnotation_sacCer2, gene = "YBR093C"){
  line2 <- data[which(data$gene == gene),]
  
  # Target the promoter region based on the strand information
  if (line2$strand == "-"){
    random_ggplot(data= WT_HighPi_NucOccupancy, chromosome = line2$chromosome, start = line2$end, end = line2$end + 800)+ labs(title =paste(gene, "in High Pi")) + scale_x_reverse(breaks = seq(line2$end + 800, line2$end, -100),labels = seq(-800, 0, 100))
  }else{
    random_ggplot(data= WT_HighPi_NucOccupancy, chromosome = line2$chromosome, start = line2$start - 800, end = line2$start)+ labs(title =paste(gene, "in High Pi")) + scale_x_continuous(breaks = seq(line2$start - 800, line2$start, 100),labels = seq(-800, 0, 100))
  }()
}