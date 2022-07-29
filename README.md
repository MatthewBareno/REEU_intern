# REEU Summer program

This repository is intedended to follow up with the summer REEU internship. 
Main objective of the internship is to have an idea how to process **Genome-wide association studies** (GWAS), using as models using the phenotypic and genotypic of data of poplar (_Populus trichocarpa_) tree populations for the pathogen _Sphaerulina musiva_.

To beging with these analyis, the student need to get familiarized with unix/linux commands, navigate the CQLS computer cluster, and version control and software development using Git.

## Week 1.
1. Start using the terminal \
1.1. Install a terminal prompt for windows \
1.2. Create, move and delete files using the terminal \
1.3. How to edit files using `nano` and `vi`, and other text edit software \
1.4. Create a github \
1.4.1. Create a repository \
1.4.2. Git add, git commit, git push and git pull! 
2. Accessing to the CQLS \
2.1 Working in the CQLS cluster \
2.2 Data structure \
2.3 Accessing data 


**28 Jun:**
1. Access to the CQLS 
2. Create a directory to organize your github 
3. Create a repository for the poplar/septoria GWAS on GitHub \
3.1 Clone your repository to the CQLS cluster \
3.2 Create the folder structure following the book "Guide to reproducible code" \
3.3 Create the folders with `mkdir` and populate the directories witgh "mock" files and scripts (comment the files with your name) 
4. Clone your gwas repository in your local git (on your ubuntu machine)

**29 Jun**
1. Install [`cutadapt`](https://cutadapt.readthedocs.io/en/stable/) \
1.1 Read the [manual](https://cutadapt.readthedocs.io/en/stable/guide.html) 
2. Find the adapter 
3. Cut yor primers and filter by quality below 30 Phred score
4. Put together a [`bash`](https://www.gnu.org/software/bash/) script to process ALL your samples with one script
> Hint: You can find the adapter in one of your outputs from fastQC

**30 Jun**
1. Work with bash commands
      - `sed`
      - `cut`
      - `awk`
2. Practices loops for `bash`


1. Retrive from NCBI or any other database the genomes of:
      - _Populus trichocarpa_
      - _Septoria musiva_ \
      (Find the reference genomes information on the manuscripts)
2. Understand the formats and concepts behing a genome assembly
3. Summarize the genome data for _P. trichocarpa_ and _S. musiva_


**1 Jul**

Summary of the week - 

------
## Week 2

**5 Jul**

1. Cluster environment and submissions
2. Running cutadatp in the CQLS cluster
3. Download genomes

**6 Jul**
1. Analyze results
2. Check BWA and GATK \
2.1 BWA commands [example](https://userweb.eng.gla.ac.uk/umer.ijaz/bioinformatics/BWA_tutorial.pdf) \

**7 Jul**
1. Finalize working on mapping the read to the alignment against the reference Genome
2. Learn the GATK commands [example](https://)
3. Index your Reference Sequence

-------
## Week 3

**11 Jul**
1. Wrap up last week \
1.2. Edit your README.md in your [poplar-septoria-GWA](https://github.com/MatthewBareno/poplar-septoria-GWAS) with all the steps we have done so far. From fastqc, cutadapt, bwa and gatk commands.  \
2. Install picard.jar \
`after bwa mem ` \
2.1 Search how to assign groups with `picard.jar AddOrReplaceReadGroups` \
2.2 Search how to sort with `picard.jar SortSam`

**12 Jul**
1. Debug `gatk` VCF calling.
2. Execute the `bash` scripts for all septoria genome files 

**13 Jul** \
*_OFF_*

**14 Jul**
1. Summarize Referece Genomes for _Septoria_ and _Poplar_ 
> Hints:
Genome size: \
No of contigs: \
N50:\
No. of genes: \ 

**15 Jul**
1. Install [GEMMA](https://github.com/genetics-statistics/GEMMA)
2. Copy the VCF file and the [phenotype data](https://github.com/ricardoi/REEU_intern/blob/main/data/Final%20GWAS%20Dataset%20for%20DOE.xlsx) 
```
$ /nfs1/BPP/LeBoldus_Lab/user_folders/Shared_projects/data_REEU/PopGWAS2016.vcf.tar.gz
```

--------
## Week 4
**Jul 18**
1. Test the `GEMMA` software
1.1 Use the example data and understand the file structure \
2. Generate the VCF
```bash 
java -jar gatk.jar -T GenotypeGVCFs -R REF.fna -o file_jointcalls.vcf -V 1.vcf -V 2.vcf -V n.vcf
```

**Jul 19**
1. Submit an array in the CQLS cluster to generate VCFs for the second part of septoria reads
2. Parse the phenotype data by septoria isolate and poplar genotype 

**Jul 20**
1. Finalyze the parsing of the phenotype data \
1.1 Generate a `.txt` with the input in GEMMA structure. 
2. Parse the phenotypes based on the `All_septoria.vcf` \
2.1 Get the sample names of the septoria `.vcf` \
2.2 Install `vcfR` \
```R
library(vcfR)
poplar <- read.vcfR(poplar.vcf)
poplar.IDs <- colnames(poplar@gt)
write.csv(poplar.name, "poplar_names_vcf.csv")
```

**Jul 21**
1. Generate VCF with all individual `.vcf` files
2. Finalize the inputs for GEMMA input

**Jul 22**
1. Producce the `.bim`, `.bed` and `.fam`
2. Try to run GEMMA software
---------
## Week 5

** This week **
1. Debugging and polishing

### Readings:
Tutorials: 
Linux: https://www.guru99.com/unix-linux-tutorial.html \
How to install linux: https://www.guru99.com/install-linux.html \
BASH Sheetcheat: https://devhints.io/bash \
Reproducible code: https://www.britishecologicalsociety.org/wp-content/uploads/2017/12/guide-to-reproducible-code.pdf \

|Manuscripts | Link|
|--|--|
|Poplar GWAS: | https://www.pnas.org/doi/10.1073/pnas.1804428115 |
|Poplar VCF info | https://doi.ccs.ornl.gov/ui/doi/55 |
| GWAS precedent | https://www.nature.com/articles/ng.3075#Sec10 |
| GWAS methodology | https://www.nature.com/articles/ng.548 |
| GEMMA Software | https://github.com/genetics-statistics/GEMMA |
| BIMBAM | http://www.haplotype.org/software.html|
|--|--|
|Septoria PopGen: |https://apsjournals.apsnet.org/doi/10.1094/MPMI-05-19-0131-R |
 
      
