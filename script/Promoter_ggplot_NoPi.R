# This function is to plot the NO Pi nucleosome Occupancy score against the position of a promoter of a gene

Promoter_ggplot_NoPi <- function(data = S288cAnnotation_sacCer1, gene = "YBR093C"){
  line2 <- data[which(data$gene == gene),]
  chr <- line2$chromosome # extract the chromosome information, ignore if we specify the chr number
  # extract the chromosome number from chr
  chr_num <- strsplit(chr, "chr")
  chr_num <- unlist(chr_num)
  chr_num <- chr_num[-1]
  
  # Target the promoter region based on the strand information
  if (line2$strand == "-"){
    random_ggplot(chromosome = paste("chr", chr_num), start = line2$end, end = line2$end + 800)+ labs(title =paste(gene, "in No Pi")) + 
      ylim(0, 1000) + scale_x_reverse(breaks = seq(line2$end + 800, line2$end, -100),labels = seq(-800, 0, 100))
  }else{
    random_ggplot(chromosome = paste("chr", chr_num), start = line2$start - 800, end = line2$start)+ labs(title =paste(gene, "in No Pi")) + 
      ylim(0, 1000) + scale_x_continuous(breaks = seq(line2$start - 800, line2$start, 100),labels = seq(-800, 0, 100))
  }()
}