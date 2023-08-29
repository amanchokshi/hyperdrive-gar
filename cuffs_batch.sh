#!/bin/bash

# for SIMDIR in "$PWD"/data/cubes/*
for SIMDIR in "$PWD"/data/fake_sky/cubes/*
do 
    SIMNAME=$(basename $SIMDIR)
    QFITS=$SIMDIR/"$SIMNAME"_Q-dirty-cube.fits 
    UFITS=$SIMDIR/"$SIMNAME"_U-dirty-cube.fits 
    FREQ=$SIMDIR/frequency.txt 
    OUTNAME=$SIMDIR/"$SIMNAME"_
    # echo QFITS: $QFITS
    # echo UFITS: $UFITS
    # echo FREQ: $FREQ
    # echo OUTNAME: $OUTNAME
    cat cuffs_parset.in >> "$SIMNAME".in
    sed -i "s|qfits|"$QFITS"|g" "$SIMNAME".in
    sed -i "s|ufits|"$UFITS"|g" "$SIMNAME".in
    sed -i "s|freqfile|"$FREQ"|g" "$SIMNAME".in
    sed -i "s|outname|"$OUTNAME"|g" "$SIMNAME".in
    sbatch cuffs.sh "$SIMNAME".in
done
