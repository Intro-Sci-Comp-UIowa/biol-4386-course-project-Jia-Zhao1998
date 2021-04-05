# Analyze Transcription Factor Pho4 Binding Sites and Nucleosome Occupancy in _Saccharomyces cerevisiae_
This is for the course BIOL:4386: Intro to scientific computing in Spring 2021. This repository aims at following up C16 Nucleosome Occupancy Project (Bin He Lab) and adapted from Bin He's repository [C016-Pho4-binding_difference.](https://github.com/binhe-lab/C016-Pho4-binding-difference) 


## Introduction
*Sacchromyces cerevisiae* or *S. cerevisiae*, the baker's yeast, is closely related to the second-most common yeast pathogen *Candida glabrata* or *C. glabrata*. More than 90% of their genes are 1-to-1 orthologs and yet the two species occupy different ecological niches: *S. cerevisiae* is primarily associated with plants and soil, and has been domesticated by human to ferment and leven food. While _C. glabrata_ is also found in soil and on plants, what distinguishes it from the former is its ability to colonize human hosts and cause infections in patients whose immune system is compromised. One of the key challenges for _C. glabrata_ to survive in the host environment is to adapt to the unique patterns of stress, e.g. host immune cell attacks. Given the similarity in their gene content, we hypothesize that rewiring of the stress response networks play a major role in this adaptation. To better understand how gene regulatory networks for stress responses evolve, we study the phosphate starvation stress (PHO) response, whose regulation has been well studied in _S. cerevisiae_, allowing us to dissect changes in its structure and the functional consequences in _C. glabrata_.

The main transcription factor (TF) involved in PHO is named Pho4. *S. cerevisiae* Pho4 (ScPho4) binds 74 promoter sites under phosphate starvation conditions; in contrast, *C. glabrata* Pho4 (CgPho4) binds to 115 promoter sites, which include all 74 bound by ScPho4, when assayed in the same genomic background ([*He et al, 2017*](https://elifesciences.org/articles/25157)). This difference is not due to their motif preference: ScPho4 and CgPho4 both recognize the DNA motif CACGTG; all but four promoters they bind to contain this consensus motif, while the remaining four contain a one-bp-off variant. Not all motifs, however, are equally accessible. Notably, in eukaryotes chromosomes consists of DNA wrapped around nucleosomes, which serve as a barrier for proteins to bind to the DNA. We therefore hypothesize that CgPho4 is more capable of binding to nucleosome-occluded promoter sites compared with ScPho4. Under this hypothesis, I expect that CgPHO4-specific binding sites show a higher nucleosome occupancy compared with the 74 sites that ScPho4 also binds to.

This hypothesis is motivated by a previous study by [*Lam et al. 2008*]((https://doi.org/10.1038/nature06867)). In that study, the authors comprehensively dissected the promoter *PHO5*, which encodes a secreted phosphatase and whose expression is induced by ScPho4 with the help of ScPho2. What they found is that the consensus motif CACGTG is occluded by the -2 nucleosome and not accessible to ScPho4. An exposed (not nucleosome-occluded) non-consensus motif CACGTT plays a crucial role to allow ScPho4-ScPho2 to bind and remodel the -2 nucleosome, which in turn exposes the consensus motif and leads to the induction of *PHO5* (Figure 1). Notice that when one compares the WT and A2 mutant, in which the exposed weak motif is mutationally removed, the mutant promoter has an expression level close to zero. This observation provides a potential mechanism to explain why not all consensus motifs in the _S. cerevisiae_ genomes are bound by ScPho4. In turn, we hypothesize that CgPho4 is more capable of binding at CACGTG motifs that are occluded by nucleosomes, and when there are no exposed weak motif(s) nearby to allow ScPho4 and ScPho2 to use.

![Fig 1](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_3.png)
**Figure 1. *PHO5pr-GFP* construct variants and expression under PHO**. Pay attention to WT and A2 mutant. Grey circles are representative of nucleosomes. Red triangles stands for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACTTG). GFP is a reporter of gene expression. (adapted from Figure 3 from Lam et al 2008)

To test this hypothesis, I will combine publicly available nucleosome occupancy data for _S. cerevisiae_ with Chromatin-Immunoprecipitation (ChIP) determined ScPho4 and CgPho4 binding sites to determine whether the CgPho4-only binding sites are more likely to be nucleosome-occluded and have no exposed weak motif next to them, compared with the 74 motifs accessible to both ScPho4 and CgPho4 in *S. cerevisiae* background. 

## Reference

Lam, F., Steger, D. & O’Shea, E. Chromatin decouples promoter threshold from dynamic range. Nature 453, 246–250 (2008). [https://doi.org/10.1038/nature06867](https://doi.org/10.1038/nature06867)

## Expected Figure
The expected figure would look like this. I plan to produce similar figures to cover all binding sites of CgPho4 and ScPho4 under PHO to answer my biological question. There are 115 binding sites for CgPho4, while 74 for ScPho4.

![](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_2a.png)

**Figure 2. Nucleosome occupancy at the _PHO5_ promoter.** X axis is genomic coordinates of *S. cerevisiae PHO5* with respect to translation start (ATG = 1). Red triangles stand for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACGTT). Solid colors (blue and red) indicate that the motif sequences are conserved in closely related species, while sesmi-transparent colors indicate non-conserved motifs. The Y axis measures nucleosome occupancy with normalized qPCR* fold changes. Higher Y values correspond to higher nucleosome occupancy. Notice that the non-consensus motif (blue circle at -400) has a low nucleosome occupancy while the consensus (red triangle at -250) site is nucleosome occluded.\

##### Peer reviewer's question: How is nucleosome occupany measured in Lam's study?
- They used an enzyme called micrococcal nuclease or MNase to digest the genome of *S. cerevisiae*, and they purified the product with mononucleosome-size. In theory, DNA region in the nucleosomes are protected from digestion, which will produce a higher qPCR readout. A peak in Figure 2 mean a higher readout and is more likely to be the place where nucleosome is. Therefore, the nucleosome occupancy is interpreted by the qPCR results (High qPCR reads mean higher nucleosome occupancy).
- Here is more information about this method in Supplementary figure S1 in Lam et al paper: [link to the figure in page 29](https://static-content.springer.com/esm/art%3A10.1038%2Fnature06867/MediaObjects/41586_2008_BFnature06867_MOESM207_ESM.pdf).
 
## Materials and Methods
### Data
For more information about the data, please visit the **data** folder. 
Data|Citation|Purpose
-----|------|--------
Nucleosome Occupancy No Pi|[Zhou & O'Shea 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3127084/)|To get the nucleosome occupany No Pi data; wig file through the [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM730535) datasets or raw [FASTQ](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA141451&o=acc_s%3Aa) files through the SRA Run selector
Nucleosome Occupancy High Pi|[Hu, 2015](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4793274/)|To get the nucleosome occupancy High Pi data; BedGraph file from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1849297) datasets. 
Binding sites of Pho4|[He et al 2017](https://elifesciences.org/articles/25157)| 115 sites for CgPho4; 74 sites for ScPho4
Genome Sequence and Annotation|[NCBI Website](https://www.ncbi.nlm.nih.gov/genome/15)|the genome is based on S. cerevisiae genome version R64

### Methods
The end goal is to plot nucleosome occupancy for all 115 promoters that CgPho4 binds to in _S. cerevisiae_ and annotate the locations of the consensus motif(s) relative to the occupancy. To achieve that, we need to have the nucleosome occupancy values and the binding motif locations mapped to the same genome coordinates.

1. Deal with y axis. Nucleosome occupancy values in No Pi and High Pi can be taken directly from WIG file and BedGraph file from Xu and Oberbeckmann, respectively. These two files include the information about the genomic position and the nucleosome occupancy score in integer format. Therefore, the nucleosome occupancy information could be processes by terminal or R. Another way of producing the nucleosome occupancy data is to map the raw reads into genomic sequence and count the reads as an output for nuleosome occupancy. This would involve downloading the fastq files, mapping to the _S. cerevisiae_ genome (Not _C. glabrata_ genome because the binding sites from He are identified in _S. cerevisiae_ background) and computing the normalized occupancy at each genomic position.

2. Deal with x axis. To construct the full information of x axis comparable to Fig 2, I need the information of genomic postion, gene annotation, and binding motifs. Data about genomic position and gene annotation can be downloaded from NCBI website. Binding motif coordinates can be (not) easily calculated by a pattern matching script in Python (I wrote one script last summer which uses any DNA sequence as input and binding site locations and motif information as output. The result will be a csv file that contain the motif and its information of coordinates).

## Results
I reviewed my previous codes and wrote a detailed summary of the steps I took for analyzing data. Please check file:///Users/zhaojia/Desktop/C16%20Nucleosome%20Occupancy/Rmd/Biol4386_Nucleosome_Occupancy_JiaZhao.html. It summarizes how I downloaded the two nucleosome occupancy data, manipulate the data, do the motif search, deal with gene annotation file, and make a draft plot. I also updated data, script, analysis, and this file for HW3. 

### Overview of the file above

- Goal
- Steps
  - Data manipulation (WT high Pi, WT no Pi,  download and clean)
  - Binding motif search (Take genomic sequence sacCer1-3 and output motif and its coordinates in csv files)
  - Plot (Load the binding sites of Pho4 in R. Plot the nucleosome occupancy data)
- Conclusion
- Acknowledgment 

### Draft plot: *PHO5*
![Image](https://github.com/Intro-Sci-Comp-UIowa/biol-4386-course-project-Jia-Zhao1998/blob/main/output/PHO5_draft1.png)
This figure is to plot the nucleosome occupancy of the promoter region of a gene PHO5 in WT no Pi condition. x axis is the genomic coordinate based on genome assembly version sacCer1 genomic coordinates (because the nucleosome occupancy dataset was alligned to sacCer1). Notice that the gene *PHO5* is located on sacCer1: chr2:429504-430907 and on "-" strand, so the promoter region coordinate is 430908-431708 (800 bp is commonly considered as the promoter region in yeast). y axis is the data value to represent nucleosome occupancy produced from a method called MNase-seq. High y value means high nucleosome occupancy. 
### Future direction
- Translate genomic coordinates. The nucleosome occupancy data in WT high Pi and No Pi were alligned to different versions of genomic sequence, so the cooridates are not consistent. I plan to use a package/UCSC online tool liftOver to make the convertion. 
- Allign the motif information to the x coordinates. I produced motif and its positions for three versions of genomic sequences sacCer1, sacCer2, and sacCer3, but didn't put the information to the plot yet. Could be done in R and use ggplot2. 
- Plot the nucleosome occupancy data under WT high Pi condition for *PHO5*. I processed the WT high Pi nucleosome occupancy data from Hu, 2015. I will plot it and compare with no Pi condition. 
- Produce a more comprehensive figure and compare with the reference figure.
- Include more binding sites of CgPho4 and ScPho4. I downloaded He, 2017 spreadsheet in a csv in R that stores all necessary information of the binding sites. I also divided the binding sites to shared binding sites of both Pho4 and CgPho4-bound only sites. The next step is to plot those target genes and compared between these two groups. 
### Problems I encountered
- Translate the coordinates in the nucleosome occupancy file to the sacCer3 version. I plan to try LiftOver
- Identify the correct gene annotation files for sacCer1-3
- Identify the promoter region based on strand information. Now, I got a message error: "infinite x value..." in my function. Plan to read more about ggplot2

