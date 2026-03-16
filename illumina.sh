READS=/path/to/reads
OUT=/path/to/output
DB=~/esviritu_DB/v3.2.4

for R1 in $READS/*_R1_001.fastq.gz
do
    SAMPLE=$(basename $R1 _R1_001.fastq.gz)
    R2=$READS/${SAMPLE}_R2_001.fastq.gz

    echo "Processing $SAMPLE"

    docker run --rm \
      -v $READS:/reads \
      -v $DB:/db \
      -v $OUT:/data \
      nitinshukla1912/esviritu:1.2.0 \
        -r /reads/${SAMPLE}_R1_001.fastq.gz /reads/${SAMPLE}_R2_001.fastq.gz \
        -s $SAMPLE \
        -o /data/${SAMPLE}_results \
        -p paired \
        -t 8

done
