This folder includes following data used for this project:
## Binding sites of ScPho4/CgPho4: Binding_Sites_He2017.csv (converted from elife-25157-fig4-data1-v2.xlsx)
- Source: [He et al, 2017](https://elifesciences.org/articles/25157)
- Strain: K699 (W303)
- Purpose: Binding sites of CgPho4 and ScPho4 in _S. cerevisiae_ background: 115, 74, respectively. Data Download [link](https://elifesciences.org/download/aHR0cHM6Ly9jZG4uZWxpZmVzY2llbmNlcy5vcmcvYXJ0aWNsZXMvMjUxNTcvZWxpZmUtMjUxNTctZmlnNC1kYXRhMS12Mi54bHN4/elife-25157-fig4-data1-v2.xlsx?_hash=IcmxB4nJvanOaBFmUOQAqHIJHNLlZJNWCY%2FkyTN1hGI%3D)
- I plan to convert it to csv file in terminal 
## WT in No Pi Nucleosome occupancy data: GSM730535_WT_NoPi_Nucleosome.wig.gz
- Source: [Xu 2011](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3127084/)
- Strain: W303
- Purpose: Nucleosome occupancy data of WT No Pi from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM730535) dataset in WIG format\
Alignment: Sequence reads were obtained and mapped to the S. cerevisiae (2003) genomes using the Illumina Genome Analyzer Pipeline. All reads uniquely mapping with two or fewer mismatches were retained and read starts were summed in sliding windows of 80 bp to create summary windows.
Paired-end Data: the average insert size for WT_NoPi_Nucleosome is 154 bp, with standard deviation of 22.8 bp\
use .gitignore to ignore this file because it is over 10 Mb
- I plan to analyze this data in terminal and plot in R (X axis: genomic position & gene annotation, y axis: nucleosome occupancy). 
## WT in normal/high Pi Nucleosome occupancy data: GSM1849297_MNase-seq.WT.YPD.R1.bw
- Source: [Hu 2015](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4793274/)
- Strain: SKI (derived from S288C)
- Purpose: Nucleosome occupancy data of WT No Pi from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM1849297) in bw (BigWig) format. Data processing	Demultiplexing was accomplished using bcl2fastq. Alignment: bowtie v0.12.7, command-line parameters -m 1 --best. Track generation: MNase-seq BED files were rendered as bedGraphs using the BEDtools genomeCoverageBed utility; these were then RPM-adjusted. Resulting bedGraphs were converted to tracks using UCSC Genome Browser's bedGraphToBigWig utility. Genome_build: sacCer2. Supplementary_files_format_and_content: BigWigs are per-base pair track visualizations of the MNase-seq data after RPM adjustment.## Genomic Sequence: GCF_000146045.2_R64_genomic.fna.gz. 
- I used bigWigtoWig package in terminal to convert the bigWig format to Wig format and store it in the local server. Size is ~90Mb: too big to upload to github
## (Old) Genomic Sequence: GCF_000146045.2_R64_genomic.fna.gz
- Source: NCBI
- Strain: S288C
- Purpose: Genome sequence, R64, SacCer3. [Link](https://www.ncbi.nlm.nih.gov/genome/15) to the sequences. 
- I plan to use wget to download all sequences in terminal, and use the sequence information to show the position of Pho4's binding sites and binding motifs. 
## (Actual used) Genomic Sequence from UCSC 
- sacCer1.2bit
- sacCer2.2bit
- sacCer3.2bit
  + Genome version: sacCer1 (or Oct. 2003 in the Saccharomyces Genome 
Database or SGD. Downloaded [URL](http://hgdownload.soe.ucsc.edu/goldenPath/sacCer1/bigZips/)
  + Genome version: sacCer2 (based on June 2008 in SGD). Downloaded [URL](http://hgdownload.soe.ucsc.edu/goldenPath/sacCer2/bigZips/)
  + Genome version: sacCer3 (based on April 2011 in SGD). Downloaded [URL](http://hgdownload.soe.ucsc.edu/goldenPath/sacCer3/bigZips/)
## Gene Annotations: GCF_000146045.2_R64_genomic.gff.gz
- Source: NCBI
- Strain: S288C
- Purpose: Genome sequence annotation, R64, SacCer3. Same link above
- I plan to use the gene annotation to correctly label the gene names of Pho4 targets
---
## (Proposed in HW2. Not used for real data analysis) WT in normal/high Pi Nucleosome occupancy data: GSM4193057_WT1_xl_MNase.bedgraph.gz
- Source: [Oberbeckmann et al, 2019](https://pubmed.ncbi.nlm.nih.gov/31694866/)
- Strain: BY4741
- Purpose: Nucleosome occupancy data of WT No Pi from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM4193057) dataset in [BedGraph](https://genome.ucsc.edu/goldenPath/help/bedgraph.html) format\
fastq files were aligned to the SacCer3 genome using Bowtie (Lengmead et al. 2009). Multiple matches were omited.
BAM files were imported into R Studio (RStudio Team, 2015) using GenomicAlignments (Lawrence et al. 2013). Then, reads were shifted by 73 bp to cover the nucleosome dyad and extended to 50 bp. Genome coverage was caluculated.
bedgraph files were generated from genome coverage files using rtracklayer (Lawrence et al. 2009).
Genome_build: SacCer3
Supplementary_files_format_and_content: bedGraph
- I plan to analyze this data in terminal and plot in R (X axis: genomic position & gene annotation, y axis: nucleosome occupancy).\
### Bin's comment (HW2)
the paper you cited published in 2019 used a new technology other than MNase-seq. I can’t say for sure, based on the quick read I just did, whether you can use their result directly. in that paper however, you can see under Genome-wide absolute occupancy map and comparison with other nucleosome maps section that they compared their results to previous ones, which were MNase based. I quickly followed the second paper (True et al 2016) — I often directly go to the associated GEO page or in this case, the [SGD](yeastgenome.org) page, which conveniently listed all the relevant datasets. Notice that the last two datasets are MNase-seq for wt with two replicates. The other resource you should check — and it even allow you to quickly view any gene of interest — is the JBrowse available through SGD. go to yeastgenome.org, under “Sequences” select “Genome Browser”. In the resulting page, select “select tracks” and look for the “Micrococcal nuclease” in the data type. For example, [Hu, 2015 Nucleosome occupancy track.](https://browse.yeastgenome.org/?loc=chrII%3A429439..431404&tracks=DNA%2CAll%20Annotated%20Sequence%20Features%2Cyoung_cells_nucleosomes%2CHu_2015_MNase-seq_WT-YPD%2CHu_2015_MNase-seq_WT%2CH3H4_Nucleosome_positions&highlight=)

---
## Motif search: "CACGTG" and all 18 1-bp off motifs
- sacCer1.csv: Motif position summary using sacCer1
- sacCer2.csv: Motif position summary using sacCer2
- sacCer3.csv: Motif position summary using sacCer3
