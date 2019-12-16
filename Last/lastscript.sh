#!/bin/bash
echo Reference is:  $1
echo Query is: $2
#echo Bam file name is: $bam_name

sudo lastdb hivdb_bash $1 #hxb2.fasta
echo "Train scoring scheme"
sudo last-train hivdb_bash -Q1 $2
echo "Lastdb command done."
sudo lastal hivdb_bash -Q1 $2 | last-map-probs  > hivalns_bash.maf #sample_1million.fastq.gz > hivalns_bash.maf
echo "Maf file created."
maf-convert sam hivalns_bash.maf > hivalns.sam
samtools view -bT $1 hivalns.sam > hivalns.bam #hxb2.fasta hivalns.sam > hivalns.bam
echo "Convert maf to sam/bam"
samtools sort hivalns.bam -o sortednewSample1mil.bam #$bam_name  # hivalns.sorted.bam
echo "Bam sorted."
