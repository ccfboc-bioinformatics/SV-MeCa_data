# SV-MeCa Training Data

## Overview

Originating, genome-wide VCF output of seven structural variant (SV) callers for sample HG002 (down-sampled to coverage 35x) can be found in folder `standalone_vcfs`.

VCFs were merged using [SURVIVOR](https://github.com/fritzsedlazeck/SURVIVOR), and [Truvari](https://github.com/ACEnglish/truvari) was employed to distinguish between true and false positive, merged SV calls given the [Genome in a Bottle (GIAB) SV benchmark](https://www.nist.gov/programs-projects/genome-bottle).
True positive calls are listed in `hg002_35x.truvari.tp.vcf`, false positives in `hg002_35x.truvari.fp.vcf`.

### Deletion-specific models

Features to train deletion-specific full and basic (binary) models were retrieved from TRUVARI VCFs and VCF outputs of BreakDancer, Delly, Lumpy, Manta, Pindel, and TARDIS. 
A complete listing of all features initially considered for development of the full deletion-specific model is given in `hg002_35x.del_fm.initial.tsv`, a densed version containing only the features incorporated in the final model is provided in file `hg002_35x.del_fm.final.tsv`. See the table below for a summarizing description of all features.

The predictions obtained from the final model are listed in `hg002_35x.del_fm.predictions.tsv`, the content is as follows:
  * `SURVIVOR_ID`: SURVIVOR-generated ID of (merged) SV call, identical to entries in feature TSV files
  * `TP`:  Binary encoding of true and false positive SV calls (1: true positive; 0: false positive) 
  * `Prediction`: Prediction assigned by SV-MeCa's final deletion-specific XGBoost model (1: true positive; 0: false positive) 
  * `Prob`: Predition probabilites assigned by SV-MeCa's final deletion-specific XGBoost model

Additionally, so-called basic XGBoost models were trained, considering only SV lengths and binary encoding of caller agreement. Corresponding input data for model training is given in `basic_model/hg002_35x.del_bm.tsv`.


## Description

### Features considered in development of the deletion-specific full model

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
TARDIS_GT | TARDIS VCF | Genotype, encoded via 0/0 → 0; 0/1 → 0.5; 1/1 → 1 | y |
TARDIS_CNVL  | TARDIS VCF | CNV Likelihood | y | 
TARDIS_RPSUP  | TARDIS VCF | Number of supporting paired reads, normalized by mean coverage | y |
TARDIS_SRSUP  | TARDIS VCF | Number of supporting split reads,  normalized by mean coverage | y |

### Features considered in development of the insertion-specific full model

| Feature | Source | Description | Included in final model [y/n] | 
| ------------- | ------------ | ------------- | ----------------|
| SURVIVOR_ID | SURVIVOR VCF | Variant ID in SURVIVOR VCF output, identical to a single variant ID in standalone VCF outputs | 
TP | Truvari VCF | Binary encoding of true and false positive SV calls (1: true positive; 0: false positive) | |
SVLEN | SURVIVOR VCF | Absolute mean length of (consensus) SV call, extracted from SURVIVOR VCF output | y | 
DELLY_ID | Delly VCF | Variant ID in Delly VCF output |
INSV_ID | INSurVeyor VCF | Variant ID in INSurVeyor VCF output |
MANTA_ID | Manta VCF | Variant ID in Manta VCF output |
PINDEL_ID | Pindel VCF | Variant ID in Pindel VCF output | 
TARDIS_ID | TARDIS VCF | Variant ID in TARDIS VCF output |
DELLY_QUAL | Delly VCF | Normalized rank score of QUAL values extracted from Delly VCF output | n | 
DELLY_PASS | Delly VCF |  `PASS` (1) or `LowQual` (0) in `FILTER` column of Delly VCF output | y |
DELLY_VF | Delly VCF |  Variant fraction estimate from Delly VCF output, RV/(RR+RV) for PRECISE calls; DV/(DR+DV) for IMPRECISE calls | n |
DELLY_HQSUPPORT | Delly VCF | Estimator of local high quality read depth: RR+RV for PRECISE calls, DR+DV for IMPRECISE calls, normalized by mean coverage |  n |
DELLY_RD | Delly VCF | Normalized read depth ratio RD = RC/(RCL+RCR) | n |
DELLY_MAPQ | Delly VCF | Median mapping quality of paired-end reads | y |
DELLY_PE | Delly VCF | Count of supporting paired reads (PE), normalized by mean coverage | n |
DELLY_SR | Delly VCF | Count of supporting split reads (SR), normalized by mean coverage | n | 
DELLY_SRMAPQ | Delly VCF | Median mapping quality of split reads (applies only to PRECISE calls) | n |
DELLY_SRQ | Delly VCF | Split read consensus alignment quality (applies only to PRECISE calls) | y |
DELLY_CE | Delly VCF | Consensus sequence entropy (applies only to PRECISE calls) | y |
DELLY_HOMLEN | Delly VCF | Predicted microhomology length using a max. edit distance of 2, set to 0 if mssing | n |
DELLY_GQ | Delly VCF | Genotype quality | n |
DELLY_FT_PASS | Delly VCF | Binary flag indicating that the per-sample genotype filter (FT) was passed | y | 
DELLY_RDCN | Delly VCF | Read depth-based copy number estimate | n |
INSV_ANOMALOUS_DEPTH  | INSurVeyor VCF | If 1, the insertion region has anomalous depth | y | 
INSV_ALT_SHORTER_THAN_REF  | INSurVeyor VCF | If 1, then if this insertion/replacement was real, alternative allele would be shorter than reference | y | 
INSV_LOW_SUPPORT  | INSurVeyor VCF | If 1, insertion has low support | y | 
INSV_NO_DISC_SUPPORT  | INSurVeyor VCF | If 1, insertion has no discordant support | y |
INSV_HOMOPOLYMER_INSSEQ  | INSurVeyor VCF | If 1, inserted sequence is a homopolymer | y |
INSV_NOT_ENOUGH_DISC_PAIRS  | INSurVeyor VCF | If 1, not enough discordant pairs support this insertion | n | 
INSV_DIFF_SVLEN  | INSurVeyor VCF | Difference between length of the inserted sequence and difference in length between REF and ALT alleles | y | 
INSV_OVERLAP  | INSurVeyor VCF | Overlap (in bp) between the left and right contigs, assigned for calls originating from consensus_overlap approach exclusively | n | 
INSV_DISCORDANT_LEFT  | INSurVeyor VCF | Discordant pairs supporting the left breakpoint of this insertion, normalized by mean coverage | y |
INSV_DISCORDANT_RIGHT  | INSurVeyor VCF | Discordant pairs supporting the right breakpoint of this insertion, normalized by mean coverage | y |
INSV_SPLIT_READS_LEFT  | INSurVeyor VCF | Split reads supporting the left breakpoint of this insertion, normalized by mean coverage | y |
INSV_SPLIT_READS_RIGHT  | INSurVeyor VCF | Split reads supporting the right breakpoint of this insertion, normalized by mean coverage | n | 
INSV_SPLIT_RATIO_LEFT  | INSurVeyor VCF | Smaller No. of +/- supporting split reads divided by greater number of +/- supporting split reads at left breakpoint | y |
INSV_SPLIT_RATIO_RIGHT  | INSurVeyor VCF | Smaller No. of +/- supporting split reads divided by greater number of +/- supporting split reads at right breakpoint | n | 
INSV_SPANNING_LEFT  | INSurVeyor VCF | Negative evidence (left), assigned for assembly and transurveyor calls exclusively, normalized by mean coverage | n |
INSV_SPANNING_RIGHT  | INSurVeyor VCF | Negative evidence (right), assigned for assembly and transurveyor calls exclusively, normalized by mean coverage | y |
INSV_SCORES_LEFT  | INSurVeyor VCF | Score for the left breakpoint of this insertion, assigned for transurveyor calls exclusively | n |
INSV_SCORES_RIGHT  | INSurVeyor VCF | Score for the right breakpoint of this insertion, assigned for transurveyor calls exclusively | n |
INSV_TRANS_QUERY_COV_LEFT  | INSurVeyor VCF | Length of the prefix of the transposed sequence that was covered by reads, assigned for transurveyor calls exclusively | y |
INSV_TRANS_QUERY_COV_RIGHT  | INSurVeyor VCF | Length of the suffix of the transposed sequence that was covered by reads, assigned for transurveyor calls exclusively | y |
INSV_STABLE_DEPTHS_LEFT  | INSurVeyor VCF | Depth of the stable region left of the insertion site, normalized by mean coverage | y |
INSV_STABLE_DEPTHS_RIGHT  | INSurVeyor VCF | Depth of the stable region right of the insertion site, normalized by mean coverage | y |
INSV_AVG_STABLE_NM_LEFT  | INSurVeyor VCF | Average edit distance (NM) of stable reads left of insertion site, normalized by read length. Assigned for assembly and transurveyor calls exclusively. | y | 
INSV_AVG_STABLE_NM_RIGHT  | INSurVeyor VCF | Average edit distance (NM) of stable reads right of insertion site, normalized by read length. Assigned for assembly and transurveyor calls exclusively. | y |
INSV_IMPRECISE  | INSurVeyor VCF | Flag for imprecise breakpoints and/or inserted sequence | y |
MANTA_QUAL
MANTA_PRECISE
MANTA_HOMLEN
MANTA_GQ
MANTA_SR
MANTA_PR
MANTA_VF
MANTA_SampleFT
PINDEL_DP
PINDEL_VF
PINDEL_HOMLEN
TARDIS_GT
TARDIS_CNVL
TARDIS_RPSUP
TARDIS_SRSUP
