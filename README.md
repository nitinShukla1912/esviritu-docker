# EsViritu Docker Container

Docker container for [EsViritu v1.2.0](https://github.com/cmmr/EsViritu) — a read mapping pipeline for virus detection from metagenomic and clinical samples.

## Pull from Docker Hub
```bash
docker pull yourusername/esviritu:1.2.0
```

## Download the database (~400 MB)
```bash
mkdir -p ~/esviritu_DB && cd ~/esviritu_DB
wget https://zenodo.org/records/17716199/files/esviritu_db_v3.2.4.tar.gz
tar -xvf esviritu_db_v3.2.4.tar.gz
rm esviritu_db_v3.2.4.tar.gz
```

## Run (paired-end)
```bash
docker run --rm \
  -v /path/to/reads:/reads \
  -v ~/esviritu_DB/v3.2.4:/db \
  -v /path/to/output:/data \
  yourusername/esviritu:1.2.0 \
    -r /reads/sample.R1.fastq.gz /reads/sample.R2.fastq.gz \
    -s sample_NAME \
    -o /data/results \
    -p paired \
    -t 8
```

## Run (unpaired)
```bash
docker run --rm \
  -v /path/to/reads:/reads \
  -v ~/esviritu_DB/v3.2.4:/db \
  -v /path/to/output:/data \
  yourusername/esviritu:1.2.0 \
    -r /reads/sample.fastq.gz \
    -s sample_NAME \
    -o /data/results \
    -p unpaired \
    -t 8
```

## For HPC (Singularity/Apptainer)
```bash
singularity pull docker://yourusername/esviritu:1.2.0
```
