# Test SV-MeCa
Here some informations to test SV-MeCa with the example data set HG00514 from the [HGSVC2](https://www.internationalgenome.org/data-portal/data-collection/hgsvc2)

## Requirements

* A linux system (Our tests were done on Ubuntu 22.04)
* [Docker engine](https://docs.docker.com/engine/install/) installed

## Execution

Pull the github repo
``` 
> git clone https://github.com/ccfboc-bioinformatics/SV-MeCa_data.git
```

Navigate to the test folder
``` 
> cd test/
```

Execute the test script
```
> ./test_sv_meca.sh
```

The results should at the end be located at `test/output/HG00514`

More informations about the folder structure can be found [here](https://github.com/ccfboc-bioinformatics/SV-MeCa?tab=readme-ov-file#folder-structure)
