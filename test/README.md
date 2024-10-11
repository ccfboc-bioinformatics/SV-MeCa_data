# Test SV-MeCa
Here is a workflow to test SV-MeCa with the example data set HG00514 from the [HGSVC2](https://www.internationalgenome.org/data-portal/data-collection/hgsvc2). The workflow includes downsampling from 30x to 9x of input data to shorten the runtime of the test execution.

## Requirements

* A Linux OS (developer tests were run on Ubuntu 22.04)
* [Docker engine](https://docs.docker.com/engine/install/) installed

## Execution

Pull the github repo:
``` 
> git clone https://github.com/ccfboc-bioinformatics/SV-MeCa_data.git
```

Navigate to the test folder:
``` 
> cd test/
```

Execute the test script:
```
> ./test_sv_meca.sh
```

The results should be located in `test/output/HG00514`, and comprise the same set of result files as in `test/output/HG00514_test`.
Note that the downsampling from 30x to 9x appears randomly, and hence, your output will not be completly identical to the given example result files.

More informations about the folder structure of SV-MeCa's output can be found [here](https://github.com/ccfboc-bioinformatics/SV-MeCa?tab=readme-ov-file#folder-structure).
