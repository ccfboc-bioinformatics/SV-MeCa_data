#!/bin/bash
set -e

# Check if sample argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <sample_directory>"
  exit 1
fi

SAMPLE="${1%/}"

# Change to the sample directory
if ! cd "$SAMPLE"; then
  echo "Error: Could not change to directory '$SAMPLE'"
  exit 1
fi

CALLERS=("breakdancer" "delly" "insurveyor" "lumpy" "manta" "pindel" "tardis")

for CALLER in "${CALLERS[@]}"; do
  if [[ "$CALLER" == "delly" || "$CALLER" == "insurveyor" ]]; then
    echo "Running: truvari bench with PASS for $CALLER"
    truvari bench -b "${SAMPLE}_benchmark.vcf.gz" -c "${SAMPLE}_${CALLER}.vcf.gz" -o "truvari_${CALLER}" -p 0 --includebed "${SAMPLE}.bed" --passonly
  else
    echo "Running: truvari bench for $CALLER"
    truvari bench -b "${SAMPLE}_benchmark.vcf.gz" -c "${SAMPLE}_${CALLER}.vcf.gz" -o "truvari_${CALLER}" -p 0 --includebed "${SAMPLE}.bed"
  fi
done
