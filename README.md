# GRiD-in-cwl

Growth Rate Index Calculater wrapped by CWL

## Requirements

* cwl-runner such as [cwltool](https://github.com/common-workflow-language/cwltool)
* Docker
    * If you cannot use docker, this tool runs with `--no-container` options.
    * However, you have to install dependent tools of RaGOO, such as R, samtools, and so on
* Database file (for multiplex mode)
    * See [document of GRiD](https://github.com/ohlab/GRiD)

## How to use

With the [CWL reference implementation](https://github.com/common-workflow-language/cwltool/) (`cwltool`), [`toil-cwl-runner`](https://toil.readthedocs.io/en/latest/running/cwl.html), or [`arvados-cwl-runner`](https://dev.arvados.org/projects/arvados/wiki/Running_Common_Workflow_Language_%28CWL%29_workflows_on_Arvados) as your `cwl-runner`:

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           tools/grid_single.cwl \
           -r ${PATH_TO_FASTQ_DIR} \
           -g ${PATH_TO_FASTA_FILE} \
           -o ${OUTPUT_DIR_NAME}
```

For other runners an input object is required:
> inputs.yml
```
r:
  class: Directory
  path: path/to/fastq/dir
g:
  class: File
  path: path/to/fasta/file
o: output_name
```

```
cwl-runner --outdir ${PATH_TO_OUTPUT_DIR} \
           workflows/grid_single.cwl \
           inputs.yml
```

### Caution

By default, GRiD generates an alignment file with bowtie2. If the input FASTQ file size is large, the size of this intermediate sam file will also increase. In the standard setting of cwltool, this intermediate file is output to a directory temporarily created on `/tmp`, and as a result, there is a possibility that the capacity of the system disk will be exhausted. To avoid this, we recommend changing the temporary directory using `--tmpdir-prefix` and `--tmp-outdir-prefix`.

## Reference

Original GRiD inplementation was published from [(Emiola & Oh, Nature Comm., 2018)](http://doi.org/10.1038/s41467-018-07240-8).