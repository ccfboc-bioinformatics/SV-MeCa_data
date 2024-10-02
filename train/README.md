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
TP | Truvari VCF | Binary encoding of true and false positive SV calls | |
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
DELLY_HOMLEN | Delly VCF | Predicted microhomology length using a max. edit distance of 2, set to 0 if mssing
DELLY_GQ | Delly VCF | Genotype quality | y |
DELLY_FT_PASS | Delly VCF | Binary flag indicating that the per-sample genotype filter (FT) was passed | n | 
DELLY_RDCN | Delly VCF | Read depth-based copy number estimate | n |
LUMPY_QUAL
LUMPY_PRECISE
LUMPY_PE
LUMPY_SR
LUMPY_GQ
LUMPY_DP
LUMPY_QRFR
LUMPY_RSFR
LUMPY_RPFR
LUMPY_QAFR
LUMPY_ASFR
LUMPY_ASCFR
LUMPY_APFR
LUMPY_AB
MANTA_QUAL
MANTA_PRECISE
MANTA_HOMLEN
MANTA_GQ
MANTA_SR
MANTA_PR
MANTA_VF
MANTA_SampleFT
MANTA_NoPairSupport
MANTA_MaxMQ0Frac
PINDEL_DP
PINDEL_VF
PINDEL_HOMLEN
TARDIS_GT
TARDIS_PRECISE
TARDIS_CNVL
TARDIS_RPSUP
TARDIS_SRSUP

| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |
