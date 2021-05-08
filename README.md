# Analyze Transcription Factor Pho4 Binding Sites and Nucleosome Occupancy in _Saccharomyces cerevisiae_
**Link to** [this project Github](https://github.com/Intro-Sci-Comp-UIowa/biol-4386-course-project-Jia-Zhao1998)

This is for the course BIOL:4386: Intro to scientific computing in Spring 2021. This repository aims at following up C16 Nucleosome Occupancy Project (Bin He Lab) and adapted from Bin He's repository [C016-Pho4-binding_difference.](https://github.com/binhe-lab/C016-Pho4-binding-difference) 


## Introduction
In eukaryotes chromosomes, nucleosome is a natural barrier to limit the acessibility of transcription factor (TF) to DNA. Without nucleosome, TF can freely and preferencially bind to its motif located on the bare DNA. This broad goal of this project is to understand how the promoter architecture (nucleosome position, and relevant motif position) plays a role in regulating transcription through the the interaction with the TF. 

The main transcription factor (TF) I study in this project is named Pho4, the main TF responsible for phosphate starvation stress response. *S. cerevisiae* Pho4 (ScPho4) binds to 74 promoter sites under the phosphate starvation conditions. In contrast, its ortholog *C. glabrata* Pho4 (CgPho4) binds to 115 promoter sites, which include all 74 bound by ScPho4 and also 41 CgPho4-specific binding sites, when assayed in the same genomic background or in *S. cerevisiae* ([*He et al, 2017*](https://elifesciences.org/articles/25157)). This difference is not due to their motif preference: ScPho4 and CgPho4 both recognize the same DNA consensus motif CACGTG; all but four promoters they bind to contain this consensus motif, while the remaining four contain a one-bp-off variant. Not all motifs, however, are equally accessible. Notably, in eukaryotes chromosomes consists of DNA wrapped around nucleosomes, which serve as a barrier for proteins to bind to the DNA. We therefore hypothesize that CgPho4 is more capable of binding to nucleosome-occluded promoter sites compared with ScPho4. Under this hypothesis, I expect that CgPHO4-specific binding sites show a different promoter architecture compared with the shared 74 sites.

To understand how promoter architecture influences transcription, here is a published example from [*Lam et al. 2008*]((https://doi.org/10.1038/nature06867)). In that study, the authors comprehensively dissected the promoter *PHO5*, which encodes a secreted phosphatase and whose expression is induced by ScPho4 with the help of ScPho2. What they found is that the consensus motif CACGTG is occluded by the -2 nucleosome and not accessible to ScPho4. An exposed (not nucleosome-occluded) non-consensus motif CACGTT plays a crucial role to allow ScPho4-ScPho2 to bind and remodel the -2 nucleosome, which in turn exposes the consensus motif and leads to the induction of *PHO5* (Figure 1). Notice that when one compares the WT and A2 mutant, in which the exposed weak motif is mutationally removed, the mutant promoter has an expression level close to zero. This observation provides a potential mechanism to explain why not all consensus motifs in the _S. cerevisiae_ genomes are bound by ScPho4. In turn, we hypothesize that CgPho4 is more capable of binding at CACGTG motifs that are occluded by nucleosomes, and when there are no exposed weak motif(s) nearby to allow ScPho4 and ScPho2 to use.

![Fig 1](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_3.png)
**Figure 1. *PHO5pr-GFP* construct variants and expression under PHO**. Pay attention to WT and A2 mutant. Grey circles are representative of nucleosomes. Red triangles stands for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACTTG). GFP is a reporter of gene expression. (adapted from Figure 3 from Lam et al 2008)

## Reference

Lam, F., Steger, D. & O’Shea, E. Chromatin decouples promoter threshold from dynamic range. Nature 453, 246–250 (2008). [https://doi.org/10.1038/nature06867](https://doi.org/10.1038/nature06867)

## Expected Figure (Conceptually)
The expected figure would be similar to this. However, the original data associated to this figure is not avaible online, so I choose different datasets from other papers (see Methods section).\

![](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_2a.png)

**Figure 2. Nucleosome occupancy at the _PHO5_ promoter under 10mM Pi: High Pi/repressed condition.** X axis is genomic coordinates of *S. cerevisiae PHO5* with respect to translation start (ATG = 1). Red triangles stand for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACGTT). Solid colors (blue and red) indicate that the motif sequences are conserved in closely related species, while sesmi-transparent colors indicate non-conserved motifs. The Y axis measures nucleosome occupancy with normalized qPCR* fold changes. Higher Y values correspond to higher nucleosome occupancy. Notice that the non-consensus motif (blue circle at -400) has a low nucleosome occupancy while the consensus (red triangle at -250) site is nucleosome occluded.\

---
##### Peer reviewer's question: How is nucleosome occupany measured in Lam's study?
- They used an enzyme called micrococcal nuclease or MNase to digest the genome of *S. cerevisiae*, and they purified the product with mononucleosome-size. In theory, DNA region in the nucleosomes are protected from digestion, which will produce a higher qPCR readout. A peak in Figure 2 mean a higher readout and is more likely to be the place where nucleosome is. Therefore, the nucleosome occupancy is interpreted by the qPCR results (High qPCR reads mean higher nucleosome occupancy).
- Here is more information about this method in Supplementary figure S1 in Lam et al paper: [link to the figure in page 29](https://static-content.springer.com/esm/art%3A10.1038%2Fnature06867/MediaObjects/41586_2008_BFnature06867_MOESM207_ESM.pdf).

---

## Materials and Methods
For a super detailed data analysis file: [please check this Rpubs link as my supplentary file.](https://rpubs.com/jzhao66/766776) I also put the same content but in **Biol4386_Nucleosome_Occupancy_JiaZhao.Rmd** file in the **analysis** folder. 

Overall, to produce a figure like the expected one, I need several pieces of information: the first is the nucleosome occupancy data in High Pi and No Pi condition for _S. cerevisiae_ to see the nuclesome occupancy data in both repressed state and activated state to make the analysis more comphrehensive. Secondly, I need the bindings sites information for CgPho4 and ScPho4 to identify the shared sites and CgPho4-specific sites. Previous study shows that Chromatin-Immunoprecipitation sequencing (ChIP-seq) was performed to determine the ScPho4 and CgPho4 binding sites (He et al, 2017). The third information I need is the genomic position and annotation of genes or those binding sites. Those come from Saccharomyces Genome Database. Based on the genomic sequence, I can predict the positions of consensus and all 18 1-bp off motifs in Python as the fourth piece of information. 

### Nucleosome Occupancy Data

#### Nucleosome Occupancy No Pi

The data is from [Zhou & O'Shea 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3127084/). To download the data, I went to this [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM730535) website to access the wiggle file or WIG file. I then process the WIG file to a short format in R. There are three columns: chromosome, position, and score. See the supplentary file for more detail. The file is also in the data folder named GSM730535_WT_NoPi_Nucleosome.wig.gz

#### Nucleosome Occupancy High Pi

This data is from [Hu, 2015](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4793274/). To get the nucleosome occupancy High Pi data, bigWig or bw file was downloaded from this [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1849297) website. I then process the WIG file to a short format in R. There are four columns in bw file: chromosome, start position, end position, and score. I added a fifth column called position, which equals the value in start position. See the supplentary file for more detail. The file is also in the data folder named GSM1849297_MNase-seq.WT.YPD.R1.bw


### Binding Sites of ScPho4 and CgPho4

There is a xlsx file that summarizes the binding sites of ScPho4 and CgPho4 that can be downloaded from the Figure 4 source data 1 in  [(He et al 2017)](https://elifesciences.org/articles/25157). I downloaded it and loaded it in R. The file is also in the data folder named elife-25157-fig4-data1-v2.xlsx.  

### Genomic Sequence and Annotation

The Genome Sequence and Annotation files come from [Saccaromyces Genome Database Website](https://www.yeastgenome.org/). I downloaded three versions of genomic sequences: sacCer1, sacCer2, and sacCer 3 in 2bit file. The files for genomic sequences are in the data folder named sacCer1.2bit, sacCer2.2bit, and sacCer3.2bit. The annotation files are called sgdGene.txt, sacCer2.txt, and sacCer3.txt for the genomic sequence sacCer1, sacCer2, and sacCer3, respectively. I processed and loaded those files in R for futher analysis. Check the supplementary file for more detail. 

### Motif Search

After I have the genomic sequence loaded and processed in R, I used the sequence file to look for motif CACGTG and its 18 1-bp off motifs in Python by self-written Python script that is available in script called MotifSearch.py. The output is a csv file with four columns: chromosome, motif, start, and end (position). The output motif position files are saved as sacCer1.csv, sacCer2.csv, and sacCer3.csv in the data folder. Check the supplementary file for more detail. 

### Plotting
#### No Pi 
I wrote a R script called Promoter_motif_ggplot_NoPi.R based on a self-written root script random_ggplot in the script folder to plot the nucleosome occupancy in No Pi against the promoter position of a specific gene such as a shared binding site *PHO5*. Here we define the upstream 800 bp from the start codon is the promoter region. The motifs are also mapped and colored based on whether they are consensus or not (red vs blue). This plot is ggplot2-based.Check the supplementary file for more detail. 

#### High Pi
I also wrote a R script called Promoter_motif_ggplot_HighPi.R based on a self-written root script random_ggplot in the script folder to plot the nucleosome occupancy in High Pi against the promoter position of a specific gene such as a shared binding site *PHO5*. Here we define the upstream 800 bp from the start codon is the promoter region. The motifs are also mapped and colored based on whether they are consensus or not (red vs blue). This plot is ggplot2-based.Check the supplementary file for more detail. 
 

## Results and Discussion

The long-term goal of this project is to plot nucleosome occupancy for all shared and CgPho4-specific binding sites in _S. cerevisiae_ and compare the promoter architecture to determine if there is a difference. For this report, I will focus on the short-term goal, which is to establish a working pipeline to plot nucleosome occupancy data against the genomic position and motifs.


### *PHO5* in No Pi: *PHO5_02.png* in the output folder

![Image](https://raw.githubusercontent.com/Intro-Sci-Comp-UIowa/biol-4386-course-project-Jia-Zhao1998/main/output/PHO5_02.png)

This figure is to plot the nucleosome occupancy of the promoter region of a gene *PHO5* in no Pi condition. It is a ggplot2-based line and point plot. Every point is an individual data point from the Nucleosome Occupancy No Pi file. The x axis is the genomic coordinate based on genome assembly version sacCer1 genomic coordinates. It is because the nucleosome occupancy dataset in WIG file was alligned to the genomic version sacCer1. Notice that the gene *PHO5* is located on sacCer1: chr2:429504-430907 and on "-" strand, so the promoter region coordinate is 430908-431708. The promoter length is 800 bp , which is commonly considered as the promoter region in yeast. I re-lable the position to -800 to 0 to indicate the upstream 800 bp from the start codon ATG, which is 0 on the x axis. The blue and read ticks or segments on the x axis are motifs. The blue are 1-bp off motifs, while the red is the consensus motif CACGTG. The y axis is score to represent nucleosome occupancy data produced from a method called MNase-seq. High y value means high nucleosome occupancy, suggesting this position is more likely covered by nucleosome.  

To compare this figure with the published one, they agree with each other in terms of line trend and the promoter architecture. Specifically, the 1-bp off motif in the blue circle is in nucleosome free region with a low y value; while the consensus motif is covered by the nucleosome with a high y value. However, there are some discrepancies present including the y value, the number of data points, and the number of motifs. These can be explained by using a totally different dataset from Lam et al 2008, and I did not normalize the y value or the nucleosome occupancy data. As for the motif, the difference could be that we used different motif prediction programs or different versions of genomic sequence for motif prediction. Potential solution could be using the motif prediction program used in the paper. However, this paper did not specify which genomic sequence version they used, which makes it difficult to reproduce its figure. It is important to specify all metadata in the published paper to increase the robustness and reprocibility of the work. Lastly, I did not analyze whether motifs are conserved or not that are indicated in transparency of the motifs in the expected figure. This analysis could be done in future study. 

### *PHO5* in High Pi: *PHO5_03.png* in the output folder

![Image](https://raw.githubusercontent.com/Intro-Sci-Comp-UIowa/biol-4386-course-project-Jia-Zhao1998/main/output/PHO5_03.png)

The legend is the same as the figure in No Pi while it is from the Nucleosome Occupancy High Pi file. 

The expected figure can be found in this [SGD link](https://browse.yeastgenome.org/?loc=chrII%3A430129..432094&tracks=DNA%2CAll%20Annotated%20Sequence%20Features%2CHu_2015_MNase-seq_WT-YPD&highlight=), which shows the genome browser of the nucleosome occupancy data under High Pi from Hu 2015. My data agree perfectly with the published one. I also customized my figure by change the tick label on the x axis and mapped motifs. I don not see obvious discrepancy.  



## Conclusion

In conclusion, the long-term goal of this project aims to answer why CgPho4 could bind more targets than ScPho4 from the prospective of promoter architecture. Short-term goal is to establish a pipeline for data analysis. I achieved this goal by sucessfully reproducing published figures and show that the pipeline works. 

Future studies could focus on including more binding sites of CgPho4 and ScPho4 to make a comphrehensive comparison between the shared and CgPho4-specific binding sites in terms of their promoter architecture. 

## Reflection 

In general, this project teaches me the importance of robustness and reproducibility in publishing work and documenting data. During producing my figrues, I have struggled with deficient metadata and missing data to be published. For example, I had problem finding the matched genome version the authors used for every dataset. 

The most rewarding part is that I learned how to mapping different layers of information from scratch and how to use ggolot to customize setting in R. I am super excited to find my figures agree with the published ones and the pipeline worked well. This computational project motivates me to do some computational work in my graduate studies.   



## Supplementary
[please check this Rpubs link as my supplentary file.](https://rpubs.com/jzhao66/766776) 



