#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM-shared
#SBATCH -t 02:00:00
#SBATCH --job-name=adrenal_bedtools_intersect
#SBATCH -A bio230007p
#SBATCH --output=/ocean/projects/bio230007p/xhu15/cross-species-regulatory-analysis/03.mapping/run_adrenal_bedtools_intersection.%j.out
#SBATCH --error=/ocean/projects/bio230007p/xhu15/cross-species-regulatory-analysis/03.mapping/run_adrenal_bedtools_intersection.%j.err
#SBATCH --export=ALL

set -euo pipefail

cd /ocean/projects/bio230007p/xhu15/cross-species-regulatory-analysis

bash 03.mapping/run_adrenal_bedtools_intersection.sh
