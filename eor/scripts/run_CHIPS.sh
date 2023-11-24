module use /astro/mwaeor/software/modulefiles
module load chips/v3.0

obslist=obs_list.txt

# tags=(  "1088285600_SIM_DEF_CAL_DEF_MOD_SUB_10000"
#         "1088285600_SIM_DEF_CAL_DEF_MOD_SUB_1000"
#         "1088285600_SIM_DEF_CAL_DEF_MOD_SUB_100"
#         "1088285600_SIM_DEF_CAL_DEF_MOD_SUB_10"
#         "1088285600_SIM_DEF_CAL_DEF_MOD_SUB_1"
#         "1088285600_SIM_DEF_CAL_FEE_MOD_SUB_10000"
#         "1088285600_SIM_DEF_CAL_FEE_MOD_SUB_1000"
#         "1088285600_SIM_DEF_CAL_FEE_MOD_SUB_100"
#         "1088285600_SIM_DEF_CAL_FEE_MOD_SUB_10"
#         "1088285600_SIM_DEF_CAL_FEE_MOD_SUB_1" )

tags=(  "1088285600_SIM_FEE"
        "1088285600_SIM_T36_CAL_FEE_MOD_SUB_10000"
        "1088285600_SIM_T36_CAL_FEE_MOD_SUB_1000"
        "1088285600_SIM_T36_CAL_FEE_MOD_SUB_100"
        "1088285600_SIM_T36_CAL_FEE_MOD_SUB_10"
        "1088285600_SIM_T36_CAL_FEE_MOD_SUB_1"
        "1088285600_SIM_T36_CAL_FEE"
        "1088285600_SIM_T36_CAL_T36_MOD_SUB_10000"
        "1088285600_SIM_T36_CAL_T36_MOD_SUB_1000"
        "1088285600_SIM_T36_CAL_T36_MOD_SUB_100"
        "1088285600_SIM_T36_CAL_T36_MOD_SUB_10"
        "1088285600_SIM_T36_CAL_T36_MOD_SUB_1"
        "1088285600_SIM_T36_CAL_T36"
        "1088285600_SIM_T36.uvfits" )



DATA_DIR=/astro/mwaeor/achokshi/hyperdrive/eor/data/1088285600/run_T36_2s_80kHz/


for tag in ${tags[@]}; do
    echo $tag
    run_CHIPS.py --cluster=garrawarla \
        --obs_list=${obslist} \
        --obs_range=0,1 \
        --output_dir=${DATA_DIR}/CHIPS_outputs/ \
        --output_tag=${tag} \
        --single_uvfits=${tag}.uvfits \
        --timeres=2 --freqres=80e3 \
        --data_dir=${DATA_DIR} \
        --band=high --no_krig
done

# tags=( "run_2s_40kHz" )
#
# for tag in ${tags[@]}; do
#     echo $tag
#     mkdir -p ${tag}
#     cp /astro/mwaeor/software/chips/template_CHIPS_outputs/* ${tag}
#     run_CHIPS.py --cluster=garrawarla \
#         --obs_list=${obslist} \
#         --obs_range=0,1 \
#         --output_dir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/${tag} \
#         --output_tag=${tag} \
#         --timeres=2 --freqres=40e3 \
#         --direct_path_list=direct_path_list.txt \
#         --band=high --no_krig
# done
