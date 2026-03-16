FROM continuumio/miniconda3:latest

LABEL tool="EsViritu" version="1.2.0"

RUN apt-get update && apt-get install -y wget curl git \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -n base -c conda-forge mamba -y

RUN mamba create -n EsViritu \
    -c bioconda -c conda-forge \
    bioconda::esviritu python=3.11 \
    -y && conda clean -afy

SHELL ["conda", "run", "-n", "EsViritu", "/bin/bash", "-c"]

RUN R -e "if (!requireNamespace('remotes', quietly=TRUE)) \
    install.packages('remotes', repos='https://cran.r-project.org'); \
    remotes::install_github('timelyportfolio/dataui')"

ENV PATH="/opt/conda/envs/EsViritu/bin:$PATH"
ENV ESVIRITU_DB=/db

WORKDIR /data

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "EsViritu", "EsViritu"]
CMD ["-h"]
