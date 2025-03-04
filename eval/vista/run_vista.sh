# requires vcf files 
# Use: manta, lumpy, genomestrip, delly, octopus
# manta, lumpy and delly comes from SV-MeCa
# genomestrip and octopus were run using docker images available on docker hub(octopus) and biocontainer(genomestrip)
# create a new header, as VISTA output a VCF without suitable header

# VISTA outputs multiallelic variants

# preprocessing of native VCF Output (example of Octopus)
python VISTA/scripts/convert_scripts/OCTOPUStoVCF.py NA19240_octopus.vcf NA19240.octopus_edit.vcf

# preprocessing of genomestrip
python edit_svlen_strip.py NA19240.genomestrip.vcf NA19240.genomestrip_edit.vcf

# run Vista
python vista.py -i NA19240.manta_edit.vcf NA19240.lumpy_edit.vcf NA19240.delly_edit.vcf NA19240.genomestrip_edit.vcf NA19240.octopus_edit.vcf -o ./na19240 -s human

# sort
awk '$1 ~ /^#/ {print $0;next} {print $0 | "sort -k1,1V -k2,2n"}' na19240/VISTA.vcf > na19240/VISTA_sort.vcf

# edit chr and add sample
awk '$1 ~ /^#/ {print $0; next} {print "chr"$0"\tGT\t."}' na19240/VISTA_sort.vcf > na19240/VISTA_sort_chr.vcf

# correct header
bcftools reheader -h header.txt -o na19240/VISTA_reheader.vcf na19240/VISTA_sort_chr.vcf

# compress and index
bgzip VISTA_reheader.vcf && tabix -p vcf VISTA_reheader.vcf.gz

# split_multiallelic sites
bcftools norm -m -any -o VISTA_reheader_split.vcf.gz -Oz VISTA_reheader.vcf.gz

# index 
tabix -p vcf VISTA_reheader_split.vcf.gz

# compare with benchmark
truvari bench \
    -b /projects/data/HGSVC2/variants_freeze4_sv_insdel_alt.na19240.gt.vcf.gz \
    -c VISTA_reheader.vcf.gz \
    -o truvari_hgsvc_na19240 \
    -p 0 \
    --includebed /projects/data/HGSVC2/hgsvc2_included_regions.bed \
    --dup-to-ins


