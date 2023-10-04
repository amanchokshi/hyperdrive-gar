#!/bin/bash

#SBATCH --job-name="hyperdrive"
#SBATCH --nodes=1
#SBATCH --cpus-per-gpu=40
#SBATCH --time=08:00:00
#SBATCH --clusters=garrawarla
#SBATCH --partition=gpuq
#SBATCH --account=mwaeor
#SBATCH --gres=gpu:1,tmp:64G
#SBATCH --mem=370G


module use /astro/mwaeor/software/modulefiles/
module load hyperdrive/peel

OBSID=1088285600
ROOT_DIR=/astro/mwaeor/achokshi/hyperdrive/eor/data
WORK_DIR=${ROOTDIR}/${OBSID}

FEE_METAFITS=${ROOT_DIR}/metafits/1088285600.metafits
DEF_METAFITS=${ROOT_DIR}/metafits/1088285600_DipAmps.metafits
SRCLIST=${ROOT_DIR}/srclists/srclist_pumav3_EoR0LoBESv2_fixedEoR1pietro+ForA_phase1+2_edit.yaml

INTERP_BEAM=/astro/mwaeor/jline/software/MWA_embedded_element_pattern_rev2_interp_167_197MHz.h5

# Hyperdrive vis-sim with DEF beam
hyperdrive vis-simulate \
    -s $SRCLIST -m $DEF_METAFITS \
    --beam-file $INTERP_BEAM \
    -o ${OBSID}_SIM_DEF.uvfits
    # --num-sources 8192 \

# Calibrate with DEF/FEE beams
hyperdrive di-calibrate \
    -s ${SRCLIST} \
    -d ${DEF_METAFITS} ${OBSID}_SIM_DEF.uvfits \
    --beam-file $INTERP_BEAM \
    -o ${OBSID}_SIM_DEF_CAL_DEF.fits
    # --num-sources 8192 \

hyperdrive di-calibrate \
    -s ${SRCLIST} \
    -d ${FEE_METAFITS} ${OBSID}_SIM_DEF.uvfits \
    --beam-file $INTERP_BEAM \
    -o ${OBSID}_SIM_DEF_CAL_FEE.fits
    # --num-sources 8192 \

# Plot solutions
hyperdrive solutions-plot *.fits -o pngs

# Apply beam cal
hyperdrive solutions-apply \
    -d $DEF_METAFITS ${OBSID}_SIM_DEF.uvfits ${OBSID}_SIM_DEF_CAL_DEF.fits \
    -o ${OBSID}_SIM_DEF_CAL_DEF.uvfits

hyperdrive solutions-apply \
    -d $FEE_METAFITS ${OBSID}_SIM_DEF.uvfits ${OBSID}_SIM_DEF_CAL_FEE.fits \
    -o ${OBSID}_SIM_DEF_CAL_FEE.uvfits
