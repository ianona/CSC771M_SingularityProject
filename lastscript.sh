#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo make 
echo "Make command done."
sudo lastdb hivdb_bash hxb2.fasta
echo "Lastdb command done."
sudo lastal hivdb_bash -Q1 sample_1million.fastq.gz > hivalns_bash.maf
echo "Maf file created."
maf-convert sam hivalns_bash.maf > hivalns.sam | samtools view -bT hxb2.fasta hivalns.sam > hivalns.bam
echo "Convert maf to sam/bam"
samtools sort hivalns.bam -o hivalns.sorted.bam
echo "Bam sorted."
