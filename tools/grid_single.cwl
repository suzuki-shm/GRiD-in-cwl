#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["single"]
hints:
    DockerRequirement:
        dockerImageId: ajhjhaf/grid:1.2
        dockerFile:
            $include: ../containers/GRiD/Dockerfile

inputs:
    "r":
        type: Directory
        doc: "Reads directory (single end reads)"
        inputBinding:
            prefix: "-r"

    "g":
        type: File
        doc: "Reference genome (fasta)"
        inputBinding:
            prefix: "-g"
    "n":
        type: int?
        doc: "Number of threads"
        inputBinding:
            prefix: "-n"
arguments:
    - prefix: "-o"
      valueFrom: "grid_output_dir"

outputs:
    "output_plot":
        type: Directory
        outputBinding:
            glob: "grid_output_dir"