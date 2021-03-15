#! /bin/bash  

CUDA_VISIBLE_DEVICES=1 python train.py --dataroot ./datasets/vkitti2kitti --name vkitti2kitti --load_size 1024 --crop_size 460 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
CUDA_VISIBLE_DEVICES=1 python test.py --dataroot ./datasets/vkitti2kitti/testA --model test --name vkitti2kitti --preprocess none --dataset_mode single --no_drop
CUDA_VISIBLE_DEVICES=1 python test.py --dataroot ./datasets/vkitti2kitti/testB --model test --name kitti2vkitti --preprocess none --dataset_mode single --no_drop 