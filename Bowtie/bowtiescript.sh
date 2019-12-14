#!/bin/bash
echo "$1"
echo "$2"
echo "Indexing .fasta string."
sudo bowtie2-build $1 hxb2-1mil-index
echo "Indexed .fasta file."
sudo bowtie2 --very-sensitive-local -x hxb2-1mil-index -U $2 -S newSample1mil.sam
echo "Performed alignment, generated .sam file."
sudo samtools view -bS newSample1mil.sam > newSample1mil.bam
echo "Converted .sam file to .bam file."
sudo samtools sort newSample1mil.bam -o sortednewSample1mil.bam
echo "Generated sorted .bam file"
