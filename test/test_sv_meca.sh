#!/bin/bash
set -Eeuo pipefail
set -o verbose

# ressources
CPU=16
RAM=32G
REFERENCE="GRCh38_full_analysis_set_plus_decoy_hla.fa"

# get the container 
docker pull wembasop/sv-meca:latest

cd input

# get the cram 60min
wget -q ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR398/ERR3988781/HG00514.final.cram	

# get the reference 10min
wget -q ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/GRCh38_reference_genome/$REFERENCE

cd ..

# cram to bam 7min
docker run -v $(pwd)/input:/input wembasop/sv-meca:latest "/opt/conda/envs/samtools/bin/samtools view -@ $CPU -b -o /input/HG00514.bam -T /input/$REFERENCE /input/HG00514.final.cram"

# downsample 16 min
docker run -v $(pwd)/input:/input wembasop/sv-meca:latest "/opt/conda/envs/align/bin/gatk --java-options "-Xmx$RAM" DownsampleSam -I /input/HG00514.bam -O /input/HG00514.down.bam -P 0.30" 

# run SV-MeCa (141min)
docker run -v $(pwd)/input:/input -v $(pwd)/output:/workspace/SV-MeCa/results wembasop/sv-meca:latest "/workspace/SV-MeCa/run_svmeca.sh bam -bam /input/HG00514.down.bam -ref /input/$REFERENCE -sample HG00514 -build hg38 -has_chr true -bed /input/hg38_centromer.bed" 