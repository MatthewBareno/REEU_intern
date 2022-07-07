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
> Hints:
Genome size: \
No of contigs: \
N50:\
No. of genes: \ 
and more! 

**1 Jul**

Summary of the week - 

## Week 2

** 5 Jul **

1. Cluster environment and submissions
2. Running cutadatp in the CQLS cluster
3. Download genomes

** 6 Jul **
1. Analyze results
2. Check `BWA` and `GATK` \
2.1 `BWA` commands [example](https://userweb.eng.gla.ac.uk/umer.ijaz/bioinformatics/BWA_tutorial.pdf)
3. Work on the read alignment against the reference Genome

** Today **
1. Check `BWA` execution and results
1.1 Create a folder for all `.bam` files generated with `BWA`
2. Check `GATK` and `Graphtyper`
2.2 `GATK` commands [example](https://gatk.broadinstitute.org/hc/en-us/articles/360036194592-Getting-started-with-GATK4)
2.3 `GraphTyper` commands [paper](https://www.nature.com/articles/s41467-019-13341-9)

### Readings:
Tutorials: 
Linux: https://www.guru99.com/unix-linux-tutorial.html \
How to install linux: https://www.guru99.com/install-linux.html \
***new*** BASH Sheetcheat: https://devhints.io/bash \
Reproducible code: https://www.britishecologicalsociety.org/wp-content/uploads/2017/12/guide-to-reproducible-code.pdf \

|Manuscripts | Link|
|--|--|
|Poplar GWAS: | https://www.pnas.org/doi/10.1073/pnas.1804428115 |
|Septoria PopGen: |https://apsjournals.apsnet.org/doi/10.1094/MPMI-05-19-0131-R |
      
      
