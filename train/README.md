# SV-MeCa Training Data

## Overview

1. `hg002_del_fm_initial.tsv`: complete listing of features initially considered in deletion-specific full SV-MeCa model

## Description

### `hg002_del_fm_initial.tsv`

#### Summary

Tab-separated complete listing of all features considered in deletion-specific SV-MeCa model development.

#### Feature list

| Feature | Description | Included in final model [y/n] | 
| ------------- | ------------- | ----------------|
| SURVIVOR_ID | Variant ID in SURVIVOR VCF output, identical to a single variant ID in standalone VCF outputs | 
TP | Binary encoding of true and false positive SV calls | |
SVLEN | Absolute mean length of (consensus) SV call, extracted from SURVIVOR VCF output | y | 
BD_ID | Variant ID in BreakDancer VCF output |
DELLY_ID | Variant ID in Delly VCF output |
LUMPY_ID | Variant ID in LUMPY VCF output |
MANTA_ID | Variant ID in Manta VCF output |
PINDEL_ID | Variant ID in Pindel VCF output | 
TARDIS_ID | Variant ID in TARDIS VCF output |
BD_QUAL | Quality score (Score) assigned by BreakDancer to SV calls | n |
BD_RD | Number of supporting read pairs, normalized by mean coverage | y |
BD_SB1 | Smaller No. of +/- supporting reads divided by greater number of +/- supporting reads at Pos1 (Orientation1) | y |
BD_SB2 | Smaller No. of +/- supporting reads divided by greater number of +/- supporting reads at Pos2 (Orientation2); identical to BD_SB1 for insertions | y |
DELLY_QUAL
DELLY_PASS
DELLY_VF
DELLY_HQSUPPORT
DELLY_RD
DELLY_MAPQ
DELLY_PE
DELLY_SR
DELLY_SRMAPQ
DELLY_SRQ
DELLY_CE
DELLY_HOMLEN
DELLY_GQ
DELLY_FT_PASS
DELLY_RDCN
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
