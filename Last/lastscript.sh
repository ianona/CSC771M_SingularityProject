#!/bin/bash
echo Reference is:  $ref
echo Query is: $query
#echo Bam file name is: $bam_name

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install g++
sudo apt-get install libz-dev
sudo make

echo "Make command done."
sudo lastdb hivdb_bash $ref #hxb2.fasta
echo "Train scoring scheme"
sudo last-train hivdb -Q1 $query
echo "Lastdb command done."
sudo lastal hivdb_bash -Q1 $query | last-map-probs  > hivalns_bash.maf #sample_1million.fastq.gz > hivalns_bash.maf
echo "Maf file created."
maf-convert sam hivalns_bash.maf > hivalns.sam
samtools view -bT $ref > hivalns.bam #hxb2.fasta hivalns.sam > hivalns.bam
echo "Convert maf to sam/bam"
samtools sort hivalns.bam -o sortednewSample1mil.bam #$bam_name  # hivalns.sorted.bam
echo "Bam sorted."
