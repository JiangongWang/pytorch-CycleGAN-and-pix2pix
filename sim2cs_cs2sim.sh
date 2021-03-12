#! /bin/bash  

python train.py --dataroot ./datasets/sim2cs --name sim2cs --load_size 1024 --crop_size 400 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
python test.py --dataroot ./datasets/sim2cs/testA --model test --name sim2cs --preprocess none --dataset_mode single --no_drop
python test.py --dataroot ./datasets/sim2cs/testB --model test --name cs2sim --preprocess none --dataset_mode single --no_drop 