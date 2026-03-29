#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mapping_dir="${repo_root}/03.mapping"

mapped_human=${mapping_dir}/human_adrenal_idr_optimal.HumanToMouse.HALPER.narrowPeak.gz
native_mouse=${mapping_dir}/mouse_adrenal_idr_optimal.mapping_preprocess.bed.gz

shared_mapped=${mapping_dir}/human_adrenal_idr_optimal.HumanToMouse.shared_with_mouse_native.bed
human_mapped_only=${mapping_dir}/human_adrenal_idr_optimal.HumanToMouse.no_mouse_native_overlap.bed
shared_mouse=${mapping_dir}/mouse_adrenal_idr_optimal.shared_with_human_mapped.bed
mouse_only=${mapping_dir}/mouse_adrenal_idr_optimal.no_human_mapped_overlap.bed
summary_tsv=${mapping_dir}/adrenal_human_to_mouse_intersection_summary.tsv

module load bedtools/2.30.0 >/dev/null 2>&1

bedtools intersect \
  -a ${mapped_human} \
  -b ${native_mouse} \
  -u \
  > ${shared_mapped}

bedtools intersect \
  -a ${mapped_human} \
  -b ${native_mouse} \
  -v \
  > ${human_mapped_only}

bedtools intersect \
  -a ${native_mouse} \
  -b ${mapped_human} \
  -u \
  > ${shared_mouse}

bedtools intersect \
  -a ${native_mouse} \
  -b ${mapped_human} \
  -v \
  > ${mouse_only}

gzip -f ${shared_mapped}
gzip -f ${human_mapped_only}
gzip -f ${shared_mouse}
gzip -f ${mouse_only}

printf "set\tcount\n" > ${summary_tsv}
printf "mapped_human_total\t" >> ${summary_tsv}
gzip -dc ${mapped_human} | wc -l >> ${summary_tsv}
printf "native_mouse_total\t" >> ${summary_tsv}
gzip -dc ${native_mouse} | wc -l >> ${summary_tsv}
printf "mapped_human_shared_with_mouse\t" >> ${summary_tsv}
gzip -dc ${shared_mapped}.gz | wc -l >> ${summary_tsv}
printf "mapped_human_no_mouse_overlap\t" >> ${summary_tsv}
gzip -dc ${human_mapped_only}.gz | wc -l >> ${summary_tsv}
printf "mouse_shared_with_human_mapped\t" >> ${summary_tsv}
gzip -dc ${shared_mouse}.gz | wc -l >> ${summary_tsv}
printf "mouse_no_human_mapped_overlap\t" >> ${summary_tsv}
gzip -dc ${mouse_only}.gz | wc -l >> ${summary_tsv}
