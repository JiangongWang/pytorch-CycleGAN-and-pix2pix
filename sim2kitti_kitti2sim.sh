#! /bin/bash  

CUDA_VISIBLE_DEVICES=1 python train.py --dataroot ./datasets/sim2kitti --name sim2kitti --load_size 1024 --crop_size 460 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
CUDA_VISIBLE_DEVICES=1 python test.py --dataroot ./datasets/sim2kitti/testA --model test --name sim2kitti --preprocess none --dataset_mode single --no_drop
CUDA_VISIBLE_DEVICES=1 python test.py --dataroot ./datasets/sim2kitti/testB --model test --name kitti2sim --preprocess none --dataset_mode single --no_drop 