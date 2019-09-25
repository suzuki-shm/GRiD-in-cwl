#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["multiplex"]
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
    "d":
        type: Directory
        doc: "GRiD database directory"
        inputBinding:
            prefix: "-d"
    "-p":
        type: boolean?
        doc: "Enable reassignment of ambiguous reads using Pathoscope2"
        inputBinding:
            prefix: "-p"
    "n":
        type: int?
        doc: "Number of threads"
        inputBinding:
            prefix: "-n"
    "o":
        type: string?
        doc: "Output dir name (default: grid_output_dir)"
        default: "grid_output_dir"
        inputBinding:
            prefix: "-o"

outputs:
    "output_dir":
        type: Directory
        outputBinding:
            glob: $(inputs.o)
