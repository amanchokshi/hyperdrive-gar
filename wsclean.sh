#!/bin/bash --login

#SBATCH --nodes=1
#SBATCH --partition=workq
#SBATCH --time=8:00:00
#SBATCH --account=mwaeor
#SBATCH --nodes=1
#SBATCH --mem=256gb
#SBATCH --tmp=768gb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --output=wsclean-rm-%A.out
#SBATCH --error=wsclean-rm-%A.err

module use /astro/mwaeor/software/modulefiles
module load wsclean

# Work in fast nvme tmp dir
cd /nvmetmp

# Full path to measurement set
MSPATH=$1

# Extract name of file
MSNAME=$(basename $MSPATH .ms)

# Make working dir and copy ms to local
mkdir $MSNAME && cd $MSNAME
cp -r $MSPATH .

# out_dir=/astro/mwaeor/achokshi/hyperdrive/data/wsclean/"$MSNAME"
out_dir=/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/wsclean/"$MSNAME"
mkdir -p $out_dir

# Stokes
time wsclean -pol QU \
  -join-polarizations -join-channels -squared-channel-joining \
  -weight briggs -1 --channels-out 768 -scale 0.75amin -size 5200 5200 \
  -name ./"$MSNAME" $MSNAME.ms

mv *.fits $out_dir
