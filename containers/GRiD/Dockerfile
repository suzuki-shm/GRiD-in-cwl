FROM continuumio/miniconda:4.6.14

LABEL maintainer="Shinya Suzuki<sshinya@bio.titech.ac.jp>"
LABEL description="Container for GRiD"

ENV TOOLDIR /opt

RUN conda config --ad channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda install grid==1.2

ENTRYPOINT ["grid"]
CMD ["-h"]