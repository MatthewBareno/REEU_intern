# COMMANDS

## VCF (Variant Call Format) 
Generating SNPs from sequence data aligned to a reference genome. The alignment of million reads to a reference genome, is a complicated and memory expensive task. Burrows wheeler algorith implemented in the program `bwa` allow the rapid indexing and compression of sequence data, followed by a set of iteration to store data (in binary format), adding groups and sorting reads against the reference sequence, generating a `VCF` file. 

First index the Reference Genome sequence in `.fasta` format
```bash
gatk CreateSequenceDictionary -R ref.fasta
samtools faidx ref.fasta
bwa index ref.fasta
```
Follow by the alignment of reads -untrimmed and unfiltered-
```bash
bwa mem ref.fasta S1_L001_R1_001.fastq.gz S1_L001_R2_001.fastq.gz > S1.sam
java -jar picard.jar AddOrReplaceReadGroups -I S1.sam -O S1.rg.sam -RGLB S1 -RGPL Illumina -RGPU S1 -RGSM S1
java -jar picard.jar SortSam I= S1.rg.sam O= S1.rgs.bam SORT_ORDER=coordinate CREATE_INDEX=true
java -jar picard.jar MarkDuplicates -I S1.rgs.bam -O S1.rgs.mdup.bam -ASSUME_SORT_ORDER coordinate -M S1_mdup_metrics.txt
java -jar picard.jar SortSam -I S1.rgs.mdup.bam -O S1.mdup.sorted.bam -SORT_ORDER coordinate -CREATE_INDEX true
gatk HaplotypeCaller -R ref.fasta -I S1.mdup.sorted.bam -O S1.vcf  
```


## snpEff annotation

Creating a database: for Septoria musiva S02202
1. Create a folder named `data` inside `snpEff` folder, and create a folder with the name of the _Species_ to construct the database
2. Move the genome reference sequence to the _Species_ folder, and rename it `sequences.fa`
3. Moved the annotation files `.gtf` format, `.gff` format, and `.gbff` genebank format to the _Species_ folder, and rename it `genes.gtf`, `genes.gff` or `genes.gbk` = `.gbff` 
4. Add the cds and protein annotation files as `cds.fa` and `proteins.fa`
5. Add following line to `snpEff.config` file in the folder `snpEff`
```vi
# Septoria musiva S02202, version 1
S02202.genome : S02202
```
6. Build your database using the flags `-gft22`, '-gff3' or '-genebank`, the annoation `.gft` and `.gff` files for Septoria musiva did not worked, so I used the `genebank` annotation using the following command: 
```java
java -jar snpEff.jar build -genbank -v S02202
```
7. Annotate your `.VCF` file using `snpEff.jar`
```java
java -jar ~/Documents/snpEff/snpEff.jar -c ~/Documents/snpEff/snpEff.config S02202 Septoria.vcf -v > Septoria_ann.vcf
```
