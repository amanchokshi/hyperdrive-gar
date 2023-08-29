#!/bin/bash

SRCLISTDIR=/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/srclists
DEF_METAFITS=/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/metafits/1120082744_DipAmps.metafits
FEE_METAFITS=/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/metafits/1120082744.metafits

mkdir ms
mkdir fits
mkdir pngs

for SRCLIST in $SRCLISTDIR/SIM*.yaml;
do
    SIMNAME=$(basename $SRCLIST .yaml)
    echo $SRCLIST
    echo $SIMNAME 

    # Simulate visibilities
    hyperdrive vis-simulate \
        -s $SRCLIST -m $DEF_METAFITS \
        --freq-res 40 --num-fine-channels 768 \
        -o ms/"$SIMNAME"_DEF.ms

    # Calibrating with DEF beam
    hyperdrive di-calibrate \
        -s "$SRCLISTDIR"/CAL.yaml \
        -d $DEF_METAFITS ms/"$SIMNAME"_DEF.ms \
        -o fits/"$SIMNAME"_DEF_CAL_DEF.fits

    # Calibrating with FEE beam
    hyperdrive di-calibrate \
        -s "$SRCLISTDIR"/CAL.yaml \
        -d $FEE_METAFITS ms/"$SIMNAME"_DEF.ms \
        -o fits/"$SIMNAME"_DEF_CAL_FEE.fits

    # Plot solutions
    hyperdrive solutions-plot \
        fits/"$SIMNAME"_DEF_CAL_FEE.fits \
        -o pngs

    # Apply DEF beam cal
    hyperdrive solutions-apply \
        -d $DEF_METAFITS ms/"$SIMNAME"_DEF.ms fits/"$SIMNAME"_DEF_CAL_DEF.fits \
        -o ms/"$SIMNAME"_DEF_CAL_DEF.ms

    # Apply FEE beam cal
    hyperdrive solutions-apply \
        -d $FEE_METAFITS ms/"$SIMNAME"_DEF.ms fits/"$SIMNAME"_DEF_CAL_FEE.fits \
        -o ms/"$SIMNAME"_DEF_CAL_FEE.ms
done


