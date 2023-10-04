module use /astro/mwaeor/software/modulefiles
module load chips/v3.0

PLTSCRIPT=/astro/mwaeor/achokshi/software/chips/scripts/plotchips_all.py

# ################################################################################
# # run_DipAmps
# ################################################################################
#
# chips_tags=( 
#     "1088285600_SIM_FEE" 
#     "1088285600_SIM_DEF" 
#     "1088285600_SIM_DEF_CAL_DEF" 
#     "1088285600_SIM_DEF_CAL_FEE" )
#
# # #Regular 2D PS
# for tag in ${chips_tags[@]}; do
#     echo ${tag}
#     python $PLTSCRIPT \
#         --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/CHIPS_outputs/ \
#         --chips_tag=${tag} \
#         --polarisation=both \
#         --plot_type=2D \
#         --min_power=1e3 --max_power=1e14 \
#         --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/plots/
# done
#
# # Ratio
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/CHIPS_outputs/ \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_FEE \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_DEF \
#     --polarisation=both \
#     --plot_type=2D_ratio \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/plots \
#     --min_power=1 --max_power=1e2
#
# # Ratio
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/CHIPS_outputs/ \
#     --chips_tag_one=1088285600_SIM_FEE \
#     --chips_tag_two=1088285600_SIM_DEF \
#     --polarisation=both \
#     --plot_type=2D_ratio \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/plots \
#     --min_power=1 --max_power=1e2
#
# # Ratio-Diff
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/CHIPS_outputs/ \
#     --chips_tag=1088285600_SIM_DEF \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_DEF \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_FEE \
#     --polarisation=both \
#     --plot_type=2D_ratio_diff \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps/plots \
#     --min_power_r=1 --max_power_r=1e4 --min_power_rd=1 --max_power_rd=1e2
#
#
# ################################################################################
# # run_T36
# ################################################################################
#
# chips_tags=(
#     "1088285600_SIM_T36" 
#     "1088285600_SIM_T36_CAL_T36" 
#     "1088285600_SIM_T36_CAL_FEE" )
#
# # Regular 2D PS
# for tag in ${chips_tags[@]}; do
#     echo ${tag}
#     python $PLTSCRIPT \
#         --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/CHIPS_outputs/ \
#         --chips_tag=${tag} \
#         --polarisation=both \
#         --plot_type=2D \
#         --min_power=1e3 --max_power=1e14 \
#         --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/plots/
# done
#
# # Ratio
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/CHIPS_outputs/ \
#     --chips_tag_one=1088285600_SIM_T36_CAL_FEE \
#     --chips_tag_two=1088285600_SIM_T36_CAL_T36 \
#     --polarisation=both \
#     --plot_type=2D_ratio \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/plots \
#     --min_power=1 --max_power=1e2
#
# # Ratio-Diff
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/CHIPS_outputs/ \
#     --chips_tag=1088285600_SIM_T36 \
#     --chips_tag_one=1088285600_SIM_T36_CAL_T36 \
#     --chips_tag_two=1088285600_SIM_T36_CAL_FEE \
#     --polarisation=both \
#     --plot_type=2D_ratio_diff \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_T36/plots \
#     --min_power_r=1 --max_power_r=1e4 --min_power_rd=1 --max_power_rd=1e2
#
#
# ################################################################################
# # run_DipAmps_flat
# ################################################################################
#
# chips_tags=(
#     "1088285600_SIM_DEF" 
#     "1088285600_SIM_DEF_CAL_DEF_flat" 
#     "1088285600_SIM_DEF_CAL_FEE_flat" )
#
# # Regular 2D PS
# for tag in ${chips_tags[@]}; do
#     echo ${tag}
#     python $PLTSCRIPT \
#         --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/CHIPS_outputs/ \
#         --chips_tag=${tag} \
#         --polarisation=both \
#         --plot_type=2D \
#         --min_power=1e3 --max_power=1e14 \
#         --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/plots/
# done
#
# # Ratio
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/CHIPS_outputs/ \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_FEE_flat \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_DEF_flat \
#     --polarisation=both \
#     --plot_type=2D_ratio \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/plots \
#     --min_power=1 --max_power=1e2
#
# # Ratio-Diff
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/CHIPS_outputs/ \
#     --chips_tag=1088285600_SIM_DEF \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_DEF_flat \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_FEE_flat \
#     --polarisation=both \
#     --plot_type=2D_ratio_diff \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_flat/plots \
#     --min_power_r=1 --max_power_r=1e4 --min_power_rd=1 --max_power_rd=1e2
#
# ################################################################################
# # run_DipAmps_perfect
# ################################################################################
#
# chips_tags=(
#     "1088285600_SIM_DEF" 
#     "1088285600_SIM_DEF_CAL_DEF_perfect" 
#     "1088285600_SIM_DEF_CAL_FEE_perfect" )
#
# # Regular 2D PS
# for tag in ${chips_tags[@]}; do
#     echo ${tag}
#     python $PLTSCRIPT \
#         --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/CHIPS_outputs/ \
#         --chips_tag=${tag} \
#         --polarisation=both \
#         --plot_type=2D \
#         --min_power=1e3 --max_power=1e14 \
#         --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/plots/
# done
#
# # Ratio
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/CHIPS_outputs/ \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_FEE_perfect \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_DEF_perfect \
#     --polarisation=both \
#     --plot_type=2D_ratio \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/plots \
#     --min_power=1 --max_power=1e2
#
# # Ratio-Diff
# python $PLTSCRIPT \
#     --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/CHIPS_outputs/ \
#     --chips_tag=1088285600_SIM_DEF \
#     --chips_tag_one=1088285600_SIM_DEF_CAL_DEF_perfect \
#     --chips_tag_two=1088285600_SIM_DEF_CAL_FEE_perfect \
#     --polarisation=both \
#     --plot_type=2D_ratio_diff \
#     --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/run_DipAmps_perfect/plots \
#     --min_power_r=1 --max_power_r=1e4 --min_power_rd=1 --max_power_rd=1e2

################################################################################
# run_10
################################################################################

chips_tags=( "run_10" "run_100" "run_1000" "run_10000" )

# Regular 2D PS
for tag in ${chips_tags[@]}; do
    echo ${tag}
    python $PLTSCRIPT \
        --basedir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/${tag} \
        --chips_tag=${tag} \
        --polarisation=both \
        --plot_type=2D \
        --min_power=1e3 --max_power=1e14 \
        --outputdir=/astro/mwaeor/achokshi/hyperdrive/eor/scripts/plots/
done
