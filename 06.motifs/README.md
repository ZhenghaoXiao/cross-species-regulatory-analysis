# Motif Enrichment

This folder contains Task 5 motif enrichment analyses using HOMER.

Main workflow:

1. Task 4 promoter/enhancer peak sets are staged into `downstream/`.
2. `downstream/build_centered_beds.sh` creates 200 bp summit-centered peak windows.
3. `downstream/run_all.sh` runs the HOMER analyses for human and mouse, centered and non-centered windows, and all-peak backgrounds.
4. `downstream/summarize_known_motifs.py` summarizes HOMER `knownResults.txt` files into `downstream/results_summary/`.

The HOMER installation itself is not stored in the repository. The full pipeline can link an external HOMER installation with the `--homer /path/to/homer` argument.

See `HOMER_Installation_Log_and_Setup_Guide.md` for setup notes.
