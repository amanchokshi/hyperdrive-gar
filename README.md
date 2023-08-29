# Running Hyperdrive

Interactive job for hyperdrive
salloc --partition gpuq --time 4:00:00 --nodes 1 --gres=gpu:1 --cpus-per-task 19 --mem=200G --tmp=200G

Tmp on garrawarla
cd /nvmetmp/

For local software
module use /astro/mwaeor/software/modulefiles/

May sometimes need to use /pawsey/mwa/software/python3/modulefiles. Things like wsclean etc

module load hyperdrive/peel

hyperdrive --help

vim simulate

hyperdrive vis-simulate --help

cp -r /astro/mwaeor/achokshi/hyperdrive/metafits .

make a sourcelist
Read these docs: https://mwatelescope.github.io/mwa_hyperdrive/user/vis_simulate/intro.html

hyperdrive vis-simulate -s srclist.yaml -m *.metafits --freq-res 40 --num-fine-channels -o single_source.ms

module load wsclean
wsclean -name foo -size 4096 4096 -scale 105asec -niter 1000 -j 19 single_source.ms

hyperdrive di-cal -d single_source.ms metafits/1120082864.metafits -s single_source.yaml

hyperdrive solutions-plot hyperdrive_solutions.fits
