#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --partition=workq
#SBATCH --time=01:00:00
#SBATCH --account=mwaeor
#SBATCH --nodes=1
#SBATCH --mem=256gb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --output=cube-%A.out
#SBATCH --error=cube-%A.err

# Base path for outputs for this project
# DATADIR=/astro/mwaeor/achokshi/hyperdrive/data
DATADIR=/astro/mwaeor/achokshi/hyperdrive/data/fake_sky

# Full path wsclean dirty image directory
FITSPATH=$1

# Last path element
FITSDIR=$(basename $FITSPATH)

fits_dir=$FITSPATH
prefix=$FITSDIR
suffix=dirty
chans=768
dim=5200

# Make output directory
OUTDIR="$DATADIR"/cubes/"$FITSDIR"
mkdir -p $OUTDIR

module purge
module load python
module load astropy

time python /astro/mwaeor/achokshi/hyperdrive/cube_wsclean.py \
    --fits_dir=$fits_dir \
    --prefix=$prefix \
    --suffix=$suffix \
    --chans=$chans \
    --dim=$dim \
    --out_dir="$OUTDIR"
