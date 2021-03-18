#! /bin/bash  

python train.py --dataroot ./datasets/vkitti2cs --name vkitti2cs --load_size 1024 --crop_size 400 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
cp ./checkpoints/vkitti2cs/latest_net_G_A.pth ./checkpoints/vkitti2cs/latest_net_G.pth
cp ./checkpoints/vkitti2cs/latest_net_G_B.pth ./checkpoints/cs2vkitti/latest_net_G.pth
python test.py --dataroot ./datasets/vkitti2cs/testA --model test --name vkitti2cs --preprocess none --dataset_mode single --no_drop --num_test 10000
python test.py --dataroot ./datasets/vkitti2cs/testB --model test --name cs2vkitti --preprocess none --dataset_mode single --no_drop --num_test 10000