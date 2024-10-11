# SV-MeCa Evalutaion Data & Results

Evaluation was based on benchmark data provided by the [Human Genome Structural Variation Consortium, Phase 2 (HGSVC2)](https://www.internationalgenome.org/data-portal/data-collection/hgsvc2) for samples [HG00514](https://www.internationalgenome.org/data-portal/sample/HG00514), [HG00733](https://www.internationalgenome.org/data-portal/sample/HG00733), and [NA19240](https://www.internationalgenome.org/data-portal/sample/NA19240).

Input data and results for the full model, which was finally included into SV-MeCa, can be found in folder `full_model/`. See [here](https://github.com/ccfboc-bioinformatics/SV-MeCa_data/tree/main/train#features-considered-in-development-of-the-deletion-specific-full-model) for the description of input for  the deletion-specific model, and [here](https://github.com/ccfboc-bioinformatics/SV-MeCa_data/tree/main/train#features-considered-in-development-of-the-insertion-specific-full-model) for the description of input for the insertion-specific full model.

Additionally, so-called basic XGBoost models were trained, considering only SV lengths and binary encoding of caller agreement. Corresponding input data and results for each sample are provided in `basic_model/`.

The features shown in resulting predictions files are the following:
  * `SURVIVOR_ID`: SURVIVOR-generated ID of (merged) SV call, identical to entries in feature TSV files
  * `TP`:  Binary encoding of true and false positive SV calls (1: true positive; 0: false positive) 
  * `Prediction`: Prediction assigned by SV-MeCa's final deletion-specific XGBoost model (1: true positive; 0: false positive) 
  * `Prob`: Predition probabilites assigned by SV-MeCa's final deletion-specific XGBoost model

