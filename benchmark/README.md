# Benchmark Callsets

This directory contains the callsets employed to assess the performance metrics of the standalone SV callers BreakDancer, Delly, INSurVeyor, LUMPY, Manta, Pindel, TARDIS, and the meta-caller SV-MeCa.
To reproduce the results reported in the publication, a script is provided and can be executed as follows:  

```
bash truvari_bench_metrics.sh <HG002-CMRG|HG00514|HG00733|NA19240>
```
>⚠️ **Important:** Truvari is required to run the script. Our tests use v~4.0.0

The script processes the bgzip and tabix-indexed comparison and benchmark VCF files located in the specified subfolder with respect to the corresponding regions of interest.

A subdirectory truvari_* is created per SV caller, which contains the following files:

* `tp-comp.vcf.gz`: True Positive (TP) calls from the **comparison** set
* `fp.vcf.gz`: False Positive (FP) calls from the **comparison** set
* `tp-base.vcf.gz`: True Positive (TP) calls from the **benchmark** set
* `fn.vcf.gz`: False Negative (FN) calls from the **benchmark** set



