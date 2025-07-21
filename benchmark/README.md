# Benchmark Callsets

This directory contains the callsets employed to assess the performance metrics of the standalone SV callers BreakDancer, Delly, INSurVeyor, LUMPY, Manta, Pindel, TARDIS, and the meta-caller SV-MeCa.
To reproduce the results reported in the publication, a script is provided and can be executed as follows:  

```
bash truvari_bench_metrics.sh <HG002-CMRG|HG00514|HG00733|NA19240>
```
>⚠️ **Important:** Truvari is required to run the script. Our tests use v~4.0.0

In this example, `HG00514` refers to the directory containing the bgzip- and tabix-indexed comparison and benchmark VCF files, along with the corresponding region of interest.

The script produces, for each caller in the given directory, a `truvari bench` output folder containing:

* `tp-comp.vcf.gz`: True Positive (TP) calls from the **comparison** set
* `fp.vcf.gz`: False Positive (FP) calls from the **comparison** set
* `tp-base.vcf.gz`: True Positive (TP) calls from the **benchmark** set
* `fn.vcf.gz`: False Negative (FN) calls from the **benchmark** set



