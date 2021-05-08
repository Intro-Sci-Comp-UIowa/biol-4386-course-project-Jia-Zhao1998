# This function is to plot the nucleosome occupancy score aginst the promoter region of a gene and also to plot
# the Pho4 consensus motif and 1-bp off motif of Pho4 along with the genomic position. 

Promoter_motif_ggplot_HighPi <- function(Annotation_data = S288cAnnotation_sacCer2, motif = sacCer2Motif, motif_rev = sacCer2REVMotif, gene = "YBR093C"){
  line <- Annotation_data[which(Annotation_data$gene == gene),]
  if (line$strand == "-"){
    motifs <- motif[which(motif$chromosome == line$chromosome & as.numeric(motif$start) 
                          >= line$end & as.numeric(motif$end) <= line$end + 800),]
    Promoter_ggplot_HighPi(data = Annotation_data, gene = gene) + geom_segment(aes(x = as.numeric(start), y = 0, xend = as.numeric(end), yend = 0), 
                                          data = motifs, size = 5, col = ifelse(motifs$motif=="CACGTG", "red","blue"))
  }else{
    motifs <- motif[which(motif$chromosome == line$chromosome & as.numeric(motif$start)
                          >= line$start - 800 & as.numeric(motif$end) <= line$start),]
    Promoter_ggplot_HighPi(data = Annotation_data, gene = gene) + geom_segment(aes(x = as.numeric(start), y = 0, xend = as.numeric(end), yend = 0), 
                                          data = motifs, size = 5, col = ifelse(motifs$motif=="CACGTG", "red","blue"))
  }()
}

