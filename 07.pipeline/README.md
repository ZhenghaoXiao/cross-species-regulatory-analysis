# Automated Pipeline

This folder contains the single-command workflow for Tasks 2 to 5.

Run on Bridges-2 with the default course-provided adrenal inputs:

```bash
sbatch 07.pipeline/run_adrenal_pipeline.slurm
```

Run directly with explicit inputs:

```bash
bash 07.pipeline/run_adrenal_pipeline.sh \
  --human /path/to/human_adrenal.narrowPeak.gz \
  --mouse /path/to/mouse_adrenal.narrowPeak.gz \
  --hal /path/to/10plusway-master.hal \
  --human-tss /path/to/human_tss.bed \
  --mouse-tss /path/to/mouse_tss.bed \
  --homer /path/to/homer
```

Optional flags:

- `--skip-rgreat`: skip the Task 3 rGREAT step.
- `--skip-homer`: skip the Task 5 HOMER motif step.

The pipeline stages intermediate files between task folders, runs the existing task scripts, and keeps the main analysis order consistent with the project workflow.
