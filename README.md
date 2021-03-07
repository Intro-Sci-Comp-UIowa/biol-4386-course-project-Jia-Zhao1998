# Analyze Transcription Factor Pho4 Binding Sites and Nucleosome Occupancy in _Saccharomyces cerevisiae_
This is for the course BIOL:4386: Intro to scientific computing in Spring 2021. This repository aims at following up C16 Nucleosome Occupancy Project (Bin He Lab) and adapted from Bin He's repository [C016-Pho4-binding_difference.](https://github.com/binhe-lab/C016-Pho4-binding-difference) 


## Introduction/Background
*Sacchromyces cerevisiae* or *S. cerevisiae*, the baker's yeast, is closely related to the second-most common yeast pathogen *Candida glabrata* or *C. glabrata*. More than 90% of their genes are 1-to-1 orthologs and yet the two species occupy different ecological niches: *S. cerevisiae* is primarily associated with plants and soil, and has been domesticated by human to ferment and leven food. While _C. glabrata_ is also found in soil and on plants, what distinguishes it from the former is its ability to colonize human hosts and cause infections in patients whose immune system is compromised. One of the key challenges for _C. glabrata_ to survive in the host environment is to adapt to the unique patterns of stress, e.g. host immune cell attacks. Given the similarity in their gene content, we hypothesize that rewiring of the stress response networks play a major role in this adaptation. To better understand how gene regulatory networks for stress responses evolve, we study the phosphate starvation stress (PHO) response, whose regulation has been well studied in _S. cerevisiae_, allowing us to dissect changes in its structure and the functional consequences in _C. glabrata_.

The main transcription factor (TF) involved in PHO is named Pho4. *S. cerevisiae* Pho4 (ScPho4) binds 74 promoter sites under phosphate starvation conditions; in contrast, *C. glabrata* Pho4 (CgPho4) binds to 115 promoter sites, which include all 74 bound by ScPho4, when assayed in the same genomic background ([*He et al, 2017*](https://elifesciences.org/articles/25157)). This difference is not due to their motif preference: ScPho4 and CgPho4 both recognize the DNA motif CACGTG; all but four promoters they bind to contain this consensus motif, while the remaining four contain a one-bp-off variant. Not all motifs, however, are equally accessible. Notably, in eukaryotes chromosomes consists of DNA wrapped around nucleosomes, which serve as a barrier for proteins to bind to the DNA. We therefore hypothesize that CgPho4 is more capable of binding to nucleosome-occluded promoter sites compared with ScPho4. Under this hypothesis, I expect that CgPHO4-specific binding sites show a higher nucleosome occupancy compared with the 74 sites that ScPho4 also binds to.

This hypothesis is motivated by a previous study by *Lam et al. 2008*. In that study, the authors comprehensively dissected the promoter *PHO5*, which encodes a secreted phosphatase and whose expression is induced by ScPho4 with the help of ScPho2. What they found is that the consensus motif CACGTG is occluded by the -2 nucleosome and not accessible to ScPho4. An exposed (not nucleosome-occluded) non-consensus motif CACGTT plays a crucial role to allow ScPho4-ScPho2 to bind and remodel the -2 nucleosome, which in turn exposes the consensus motif and leads to the induction of *PHO5* (Figure 1). Notice that when one compares the WT and A2 mutant, in which the exposed weak motif is mutationally removed, the mutant promoter has an expression level close to zero. This observation provides a potential mechanism to explain why not all consensus motifs in the _S. cerevisiae_ genomes are bound by ScPho4. In turn, we hypothesize that CgPho4 is more capable of binding at CACGTG motifs that are occluded by nucleosomes, and when there are no exposed weak motif(s) nearby to allow ScPho4 and ScPho2 to use.

![Fig 1](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_3.png)
**Figure 1. *PHO5pr-GFP* construct variants and expression under PHO**. Grey circles are representative of nucleosomes. Red triangles stands for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACTTG). GFP is a reporter of gene expression. (adapted from Figure 3 from Lam et al 2008)

To test this hypothesis, I will combine publicly available nucleosome occupancy data for _S. cerevisiae_ with Chromatin-Immunoprecipitation (ChIP) determined ScPho4 and CgPho4 binding sites to determine whether the CgPho4-only binding sites are more likely to be nucleosome-occluded and have no exposed weak motif next to them, compared with the 74 motifs accessible to both ScPho4 and CgPho4 in *S. cerevisiae* background. 

## Reference

Lam, F., Steger, D. & O’Shea, E. Chromatin decouples promoter threshold from dynamic range. Nature 453, 246–250 (2008). [https://doi.org/10.1038/nature06867](https://doi.org/10.1038/nature06867)

## Expected Figure
The expected figure would look like this. I plan to produce similar figures to cover all binding sites of CgPho4 and ScPho4 under PHO to answer my biological question. There are 115 binding sites for CgPho4, while 74 for ScPho4.

![](https://raw.githubusercontent.com/binhe-lab/C016-Pho4-binding-difference/master/docs/images/Lam_et_al_2008_fig_2a.png)

**Figure 2. Nucleosome occupancy at the _PHO5_ promoter.** X axis is genomic coordinates of *S. cerevisiae PHO5*. Red triangles stand for high affinity motifs CACGTG, while blue circles represent low affinity motifs, which are 1-bp off motifs (i.e. CACGTT). Solid colors (blue and red) indicate that the motif sequences are conserved in closely related species, while sesmi-transparent colors indicate non-conserved motifs. The Y axis measures nucleosome occupancy with normalized qPCR fold changes. Higher Y values correspond to higher nucleosome occupancy. Notice that the non-consensus motif (blue circle at -400) has a low nucleosome occupancy while the consensus (red triangle at -250) site is nucleosome occluded.
 
## Materials and Methods
### Data
> HB comment: I don't think the Zhou and O'Shea 2011 has the high Pi nucleosome profiling data. We will need to identify a different dataset.

Data|Citation|Purpose
-----|------|--------
Nucleosome Occupancy No Pi|[Zhou & O'Shea 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3127084/)|To get the nucleosome occupany No Pi data; wig file through the [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM730535) datasets or raw [FASTQ](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA141451&o=acc_s%3Aa) files through the SRA Run selector
Nucleosome Occupancy High Pi|[Oberbeckmann, 2019](https://pubmed.ncbi.nlm.nih.gov/31694866/)|To get the nucleosome occupancy High Pi data; BedGraph file from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM4193057) datasets or raw [FASTQ](https://www.ncbi.nlm.nih.gov/sra?term=SRX7217819)
Binding sites of Pho4|[He et al 2017](https://elifesciences.org/articles/25157)| 115 sites for CgPho4; 74 sites for ScPho4
Genome Sequence and Annotation|[NCBI Website](https://www.ncbi.nlm.nih.gov/genome/15)|the genome coordinates of the above table is based on S. cerevisiae genome R64-2-1, which is based on genome sequences of R64-1-1

### Analysis
1. Our end goal is to plot nucleosome occupancy for all 115 promoters that CgPho4 binds to in _S. cerevisiae_ and annotate the locations of the consensus motif(s) relative to the occupancy.
2. To achieve that, we need to have the nucleosome occupancy values and the binding motif locations mapped to the same genome coordinates.
3. Binding motif coordinates can be easily calculated by a pattern matching script in Python or R.
4. Nucleosome occupancy values need to be computed from the MNase-seq data. This would involve downloading the fastq files, mapping to the _S. cerevisiae_ genome and computing the normalized occupancy at each genomic position.
