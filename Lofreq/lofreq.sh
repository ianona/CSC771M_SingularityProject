#!/bin/bash          
CURRENTEPOCTIME=`date +"%Y-%m-%d%T"`
OUTPUT="variants_${CURRENTEPOCTIME}.vcf"
echo Reference is: $1
echo Query is: $2
echo Outputting to: $OUTPUT
echo Running Lofreq...
lofreq call -f $1 -o $OUTPUT $2
