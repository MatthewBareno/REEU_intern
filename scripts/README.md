# COMMANDS

## VCF files
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
