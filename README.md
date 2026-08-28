# DITC-TGVCRN Reproduction Package

This repository provides a patch, configurations, and random seeds for reproducing the experiments in our SIGSPATIAL 2026 short paper. It does not redistribute the original TGV-CRN codebase; please clone the upstream repository and apply the provided patch.

This package contains a patch against the original `TGV-CRN` repository.
It is intended for the following base version:

- Repository: https://github.com/keisuke198619/TGV-CRN
- Commit: `9eac7166b8f07f89d47d141ff0a4a761f4f017a3`

It does not redistribute the full modified repository; it only provides the differences needed to reproduce the modified code.

## Files

- `ditc_tgvcrn.patch`: patch file
- `changed_files.txt`: list of modified/added files
- `apply_patch.sh`: helper script
- `base_commit.txt`: base repository and commit used to create the patch

## How to apply

From a clean clone/copy of the original TGV-CRN repository:

```bash
git clone https://github.com/keisuke198619/TGV-CRN.git
cd TGV-CRN
git checkout 9eac7166b8f07f89d47d141ff0a4a761f4f017a3
git apply --check --whitespace=nowarn /path/to/ditc_tgvcrn.patch
git apply --whitespace=nowarn /path/to/ditc_tgvcrn.patch
bash run.sh
```

Or copy this package into the repository root and run:

```bash
bash apply_patch.sh
bash run.sh
```

The patch was checked with `git apply --check` against the original `TGV-CRN` folder provided in the zip. For reproducibility, use the commit shown above rather than the current `main` branch.
