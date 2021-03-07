This folder includes following data used for this project:
## elife-25157-fig4-data1-v2.xlsx
- Source: He et al, 2017
- Strain: K699 (W303)
- Purpose: Binding sites of CgPho4 and ScPho4 in _S. cerevisiae_ background: 115, 74, respectively
## GSM730535_WT_NoPi_Nucleosome.wig.gz
- Source: Xu 2011
- Strain: W303
- Purpose: Nucleosome occupancy data of WT No Pi in WIG format\
Alignment: Sequence reads were obtained and mapped to the S. cerevisiae (2003) genomes using the Illumina Genome Analyzer Pipeline. All reads uniquely mapping with two or fewer mismatches were retained and read starts were summed in sliding windows of 80 bp to create summary windows.
Paired-end Data: the average insert size for WT_NoPi_Nucleosome is 154 bp, with standard deviation of 22.8 bp\
use .gitignore to ignore this file because it is over 10 Mb
## GSM4193057_WT1_xl_MNase.bedgraph.gz
- Source: Oberbeckmann et al, 2019
- Strain: BY4741
- Purpose: Nucleosome occupancy data of WT No Pi in [BedGraph](https://genome.ucsc.edu/goldenPath/help/bedgraph.html) format\
fastq files were aligned to the SacCer3 genome using Bowtie (Lengmead et al. 2009). Multiple matches were omited.
BAM files were imported into R Studio (RStudio Team, 2015) using GenomicAlignments (Lawrence et al. 2013). Then, reads were shifted by 73 bp to cover the nucleosome dyad and extended to 50 bp. Genome coverage was caluculated.
bedgraph files were generated from genome coverage files using rtracklayer (Lawrence et al. 2009).
Genome_build: SacCer3
Supplementary_files_format_and_content: bedGraph


