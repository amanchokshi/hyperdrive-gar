module use /astro/mwaeor/software/modulefiles
module load chips/v3.0

obslist=obs_list.txt

# tags=( "1088285600_SIM_FEE" "1088285600_SIM_DEF" "1088285600_SIM_DEF_CAL_DEF" "1088285600_SIM_DEF_CAL_FEE" )
# tags=( "1088285600_SIM_T36" "1088285600_SIM_T36_CAL_T36" "1088285600_SIM_T36_CAL_FEE" )
# tags=( "1088285600_SIM_DEF" "1088285600_SIM_DEF_CAL_DEF_flat" "1088285600_SIM_DEF_CAL_FEE_flat" )

# for tag in ${tags[@]}; do
#     echo $tag
#     run_CHIPS.py --cluster=garrawarla \
#         --obs_list=${obslist} \
#         --obs_range=0,1 \
#         --output_dir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/CHIPS_outputs/ \
#         --output_tag=${tag} \
#         --single_uvfits=${tag}.uvfits \
#         --data_dir=/astro/mwaeor/achokshi/hyperdrive/eor/data/1088285600/run_DipAmps_flat \
#         --band=high --no_krig
# done

tags=( "run_10" "run_100" "run_1000" "run_10000" )

for tag in ${tags[@]}; do
    echo $tag
    mkdir -p ${tag}
    cp /astro/mwaeor/software/chips/template_CHIPS_outputs/* ${tag}
    run_CHIPS.py --cluster=garrawarla \
        --obs_list=${obslist} \
        --obs_range=0,1 \
        --output_dir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/${tag} \
        --output_tag=${tag} \
        --direct_path_list=direct_path_list.txt \
        --band=high --no_krig
done
