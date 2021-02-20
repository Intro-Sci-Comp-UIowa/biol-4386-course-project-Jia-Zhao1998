# Title: Analyze Transcription Factor Pho4 Binding Sites and Nucleosome Occupancy in _Saccharomyces cerevisiae_
This is for the course BIOL:4386: Intro to scientific computing in Spring 2021. This repository aims at following up C16 Nucleosome Occupancy Project (Bin He Lab) and adapted from Bin He's repository [C016-Pho4-binding_difference.](https://github.com/binhe-lab/C016-Pho4-binding-difference) 

This project is unpublished and is originally from Dr. Bin He. Here is **Introduction, the biological question, goal,reference, and the type of analyses I plan to perform.**

## Introduction/Background
***Sacchromyces cerevisiae* or *S. cerevisiae***, the baker's yeast, is closely related to the second-most common yeast pathogen ***Candida glabrata* or *C. glabrata***. These two yeast species share over **90% 1-to-1 orthologs but occupy different ecological niches**. This phenotypic difference is contributed tremendously by their distint gene regulatory networks. To get a better understanding of gene regulatory networks and how they evolve, we study phosphate starvation stress response (PHO), which is a well-established and typical model for studying stress responses. The main transcription factor involved in PHO is named Pho4. *S. cerevisiae* Pho4 or ScPho4 binds **74** promoter sites under phosphate starvation conditions; in contrast, *C. glabrata* Pho4 or CgPho4 binds to **115** promoter sites in the same genomic background ([*He et al, 2017*](https://elifesciences.org/articles/25157)). This difference is not due to the presence of the concensus motif **CACGTG**, because ScPho4 and CgPho4 bind to the same motifs and all promoter sites except four contain this consensus motif. Among these four targets, two of them are shared by ScPho4 and CgPho4. Therefore, the presence of consensus motif is not a reason to explain the binding difference between ScPho4 and CgPho4. **Our hypothesis is CgPho4 is more capable of binding to nucleosome-occluded promoter sites compared with ScPho4. Therefore, I expect to see CgPHO4-specific binding sites are covered by nucleosomes, which limits the accessibility of ScPho4**

This hypothesis is mainly motivated by a figure below. WHen deleting the non-consensus motif in the nucleosome-free region but keeping the consensus motif in the nucleosome-occluded site, it abolishes the expression of a target gene of Pho4, named *PHO5*. Pay attention to the two variants **WT and A2**. This observation provides a strong evidence of the importance of non-consensus motifs, and the huge impact of relative positioning of nucleosome occupancy and motifs on gene expression. CgPho4-specific sites (*total of 115-74 = 41 sites*) could show the similiar structual pattern like A2, in which only CgPho4 could access to the promoter while ScPho4 can not. 

![x](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_3.png)
*PHO5pr-GFP* construct variants and expression under PHO. Grey circles are representative of nucleosomes. Red triangles stands for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACTTG). GFP is a reporter of gene expression. 

## Biological Question

Why are some genomic sites only bound by *C. glabrata( Pho4 but not *S. cerevisiae( Pho4, in the same genetic background?

## Goal
Determine if there are structural differences between the sites bound by both ScPho4 and CgPho4, vs those only accessible to CgPho4, in *S. cerevisiae* background. 

## Reference

Lam, F., Steger, D. & O’Shea, E. Chromatin decouples promoter threshold from dynamic range. Nature 453, 246–250 (2008). [https://doi.org/10.1038/nature06867](https://doi.org/10.1038/nature06867)

## Expected Figure
The expected figure would look like this. I plan to produce similar figures to cover all binding sites of CgPho4 and ScPho4 under PHO to answer my biological question. There are 115 binding sites for CgPho4, while 74 for ScPho4.

![x](https://github.com/binhe-lab/C016-Pho4-binding-difference/blob/master/docs/images/Lam_et_al_2008_fig_2a.png)

x axis is genomic coordinates of *S. cerevisiae PHO5*. Red triangles stands for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACTTG). The transparency is the conservity of motifs. Less transparent means more conserve. y axis measures the nucleosome occupancy. Higer y value means the higher nucleosome occupancy. The non-consensus motif (blue circle at -400) corresponses to a low nucleosome occupancy; in contrast, the red triangle (consensus motif) is under a nucleosome occupancy peak. This indicates this consensus motif is covered by a nucleosome. 
## Materials and Methods
### Data
Data|Citation|Purpose
-----|------|--------
Nucleosome Occupancy|[Zhou & O'Shea 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3127084/)|To get the nucleosome occupany data; wig file through the [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM730535) datasets or raw [FASTQ](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA141451&o=acc_s%3Aa) files through the SRA Run selector
Binding sites of Pho4|[He et al 2017](https://elifesciences.org/articles/25157)| 115 sites for CgPho4; 74 sites for ScPho4
Genome Sequence|SGD Website|the genome coordinates of the above table is based on S. cerevisiae genome R64-2-1, which is based on genome sequences of R64-1-1
### Analysis
(Need more advice)
1. Mapping Promoter position as the X-axis
2. Using RNA-seq data to produce nucleosome occupancy data from FAFSA file (see data). Use both high Pi (starting state before Pho4 takes effects) and low Pi conditions. Mapping the nucleosome occupancy data
3. Finding and mapping Motif location. 
4. (Optional) Motif conservation within the sensu stricto species (the solid vs light shade in the PHO5 figure)
