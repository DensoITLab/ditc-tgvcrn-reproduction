#!/bin/bash

### boid dataset
 cd simulation
 python generate_boid_dataset.py --ver 0 --num-train 20000 --num-valid 400 --num-test 400 --sample_freq 1 --length 21 --length_test 21 --n_boids 20 --r_o 1 # 
 cd -


function carla_boid() {

    #### model training 
    for m in TXDSW XDSW GVTBCRN VBCRN GVBCRN GBDSW GBTXDSW GBXDSW VTBCRN DSW BDSW XRNN TXRNN BXRNN BTXRNN; do
        d=carla
        python train_MADSW.py --data ${d} --epochs 20 --batch-size 256 --model ${m} \
            --results-dir ${results_dir} --checkpoint-dir ${checkpoint_dir} --seed ${seed} > ${results_dir}/${d}/${m}.log
        d=boid
        python train_MADSW.py --data ${d} --epochs 20 --batch-size 2560 --model ${m} \
            --results-dir ${results_dir} --checkpoint-dir ${checkpoint_dir} --seed ${seed} > ${results_dir}/${d}/${m}.log
    done
    python draw_covariates.py --data carla --model GVTBCRN

}

function nba() {
    for m in GVTTBCRN VBCRN GVBCRN GBDSW GBTTXDSW GBXDSW VTTBCRN DSW BDSW XRNN TXRNN BXRNN BTXRNN TTXRNN BTTXRNN; do
        python train_MADSW.py --data nba --epochs 20 --batch-size 256 --model ${m} --l_X 1 \
            --results-dir ${results_dir} --checkpoint-dir ${checkpoint_dir} --seed ${seed} > ${results_dir}/nba/${m}.log
    done
}

for seed in 666 777 888; do
    results_dir=./results_${seed}
    checkpoint_dir=./checkpoint_${seed}

    mkdir -p ${checkpoint_dir}/{boid,carla,nba} ${results_dir}/{boid,carla,nba} mat

    carla_boid
    nba
done

