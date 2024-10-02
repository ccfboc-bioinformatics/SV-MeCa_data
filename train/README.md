# SV-MeCa Training Data

## Overview

1. `hg002_del_fm_initial.tsv`: complete listing of features initially considered in deletion-specific full SV-MeCa model

## Description

### `hg002_del_fm_initial.tsv`

#### Summary

Tab-separated complete listing of all features considered in deletion-specific SV-MeCa model development.

#### Feature list

| Feature | Source | Description | Included in final model [y/n] | 
| ------------- | ------------ | ------------- | ----------------|
| SURVIVOR_ID | SURVIVOR VCF | Variant ID in SURVIVOR VCF output, identical to a single variant ID in standalone VCF outputs | 
TP | Truvari VCF | Binary encoding of true and false positive SV calls (1: true positive; 0: false positive) | |
SVLEN | SURVIVOR VCF | Absolute mean length of (consensus) SV call, extracted from SURVIVOR VCF output | y | 
BD_ID | BreakDancer VCF | Variant ID in BreakDancer VCF output |
DELLY_ID | Delly VCF | Variant ID in Delly VCF output |
LUMPY_ID | LUMPY VCF | Variant ID in LUMPY VCF output |
MANTA_ID | Manta VCF | Variant ID in Manta VCF output |
PINDEL_ID | Pindel VCF | Variant ID in Pindel VCF output | 
TARDIS_ID | TARDIS VCF | Variant ID in TARDIS VCF output |
BD_QUAL | BreakDancer VCF | Quality score (Score) assigned by BreakDancer to SV calls | n |
BD_RD | BreakDancer VCF | Number of supporting read pairs, normalized by mean coverage | y |
BD_SB1 | BreakDancer VCF | Smaller No. of +/- supporting reads divided by greater number of +/- supporting reads at Pos1 (Orientation1) | y |
BD_SB2 | BreakDancer VCF | Smaller No. of +/- supporting reads divided by greater number of +/- supporting reads at Pos2 (Orientation2); identical to BD_SB1 for insertions | y |
DELLY_QUAL | Delly VCF | Normalized rank score of QUAL values extracted from Delly VCF output | n | 
DELLY_PASS | Delly VCF |  `PASS` (1) or `LowQual` (0) in `FILTER` column of Delly VCF output | y |
DELLY_VF | Delly VCF |  Variant fraction estimate from Delly VCF output, RV/(RR+RV) for PRECISE calls; DV/(DR+DV) for IMPRECISE calls | n |
DELLY_HQSUPPORT | Delly VCF | Estimator of local high quality read depth: RR+RV for PRECISE calls, DR+DV for IMPRECISE calls, normalized by mean coverage |  y |
DELLY_RD | Delly VCF | Normalized read depth ratio RD = RC/(RCL+RCR) | n |
DELLY_MAPQ | Delly VCF | Median mapping quality of paired-end reads | n |
DELLY_PE | Delly VCF | Count of supporting paired reads (PE), normalized by mean coverage | y |
DELLY_SR | Delly VCF | Count of supporting split reads (SR), normalized by mean coverage | y | 
DELLY_SRMAPQ | Delly VCF | Median mapping quality of split reads (applies only to PRECISE calls) | n |
DELLY_SRQ | Delly VCF | Split read consensus alignment quality (applies only to PRECISE calls) | y |
DELLY_CE | Delly VCF | Consensus sequence entropy (applies only to PRECISE calls) | y |
DELLY_HOMLEN | Delly VCF | Predicted microhomology length using a max. edit distance of 2, set to 0 if mssing | y |
DELLY_GQ | Delly VCF | Genotype quality | y |
DELLY_FT_PASS | Delly VCF | Binary flag indicating that the per-sample genotype filter (FT) was passed | n | 
DELLY_RDCN | Delly VCF | Read depth-based copy number estimate | n |
LUMPY_QUAL | LUMPY VCF | Normalized rank score of VCF-retrieved QUAL values | n | 
LUMPY_PRECISE | LUMPY VCF | Binary flag indicating precise (1) versus imprecise (0) SV calls | y |
LUMPY_PE | LUMPY VCF | Number of variant supporting paired reads, normalized by mean coverage | n |
LUMPY_SR | LUMPY VCF | Number of variant supporting split reads, normalized by mean coverage | n |
LUMPY_GQ | LUMPY VCF | Genotype quality | y |  
LUMPY_DP | LUMPY VCF | Read depth, normalized by mean coverage | n | 
LUMPY_QRFR | LUMPY VCF | QR/RO; fraction of sum of quality reference observation and reference allele observation count, with partial observations recorded fractionally | n |
LUMPY_RSFR | LUMPY VCF | RS/RO; fraction of reference allele SR observation count and reference allele observation count, with partial observations recorded fractionally | n | 
LUMPY_RPFR | LUMPY VCF | RP/RO; fraction of reference allele PR observation count and reference allele observation count, with partial observations recorded fractionally | y | 
LUMPY_QAFR | LUMPY VCF | QA/AO; fraction of sum of quality of alternate observations and alternate allele observations, with partial observations recorded fractionally | y | 
LUMPY_ASFR | LUMPY VCF | AS/AO; fraction of alternate allele SR observation count and alternate allele observations, with partial observations recorded fractionally | n | 
LUMPY_ASCFR | LUMPY VCF | ASC/AO; fraction of  alternate allele clipped-read observation count and alternate allele observations, with partial observations recorded fractionally | y | 
LUMPY_APFR | LUMPY VCF | AP/AO; fraction of alternate allele PR observation count and alternate allele observations, with partial observations recorded fractionally | y | 
LUMPY_AB | LUMPY VCF | Allele balance, fraction of observations from alternate allele, QA/(QR+QA) | y |
MANTA_QUAL | Manta VCF | VCF-retrieved QUAL values, normalized by observed mean coverage | y |
MANTA_PRECISE  | Manta VCF | Binary flag indicating precise (1) versus imprecise (0) structural variant calls | n |
MANTA_HOMLEN  | Manta VCF | Length of base pair identical homology at event breakpoints, set to zero if missing | y |
MANTA_GQ  | Manta VCF | Genotype Quality | n | 
MANTA_SR  | Manta VCF | Count of supporting split reads (SR), normalized by mean coverage | n | 
MANTA_PR  | Manta VCF | Count of supporting paired reads (PR), normalized by mean coverage | y |
MANTA_VF  | Manta VCF | Estimate of variant fraction: Ratio of sum of supporting SR and PR vs sum of overall SR and PR | n | 
MANTA_SampleFT  | Manta VCF | Filters MinGQ (genotype quality) or HomRef (homozygous reference) passsed (0) vs not passed (1) | y |
MANTA_NoPairSupport  | Manta VCF | PR support filter of the alternate allele passed (0) or not (1); does only apply for variants significantly larger than the PR fragment size |  y | 
MANTA_MaxMQ0Frac  | Manta VCF | Filter for fraction of reads with MAPQ0 around either breakend exceeds 0.4 (1) or not (0); does only apply to short variants <1000bp | n |
PINDEL_DP | Pindel VCF | Local coverage estimate: ratio of sum of `AD values and mean coverage | y |
PINDEL_VF | Pindel VCF | Variant fraction estimate: Number of alternate allele supporting reads divided by sum of `AD` values | y | 
PINDEL_HOMLEN | Pindel VCF | Length of base pair identical micro-homology at event breakpoints, set to zero if missing | y |
TARDIS_GT
TARDIS_PRECISE
TARDIS_CNVL
TARDIS_RPSUP
TARDIS_SRSUP



