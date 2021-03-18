#! /bin/bash  

python train.py --dataroot ./datasets/vkitti2kitti --name vkitti2kitti --load_size 1024 --crop_size 460 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
cp ./checkpoints/vkitti2kitti/latest_net_G_A.pth ./checkpoints/vkitti2kitti/latest_net_G.pth
cp ./checkpoints/vkitti2kitti/latest_net_G_B.pth ./checkpoints/kitti2vkitti/latest_net_G.pth
python test.py --dataroot ./datasets/vkitti2kitti/testA --model test --name vkitti2kitti --preprocess none --dataset_mode single --no_drop --num_test 10000
python test.py --dataroot ./datasets/vkitti2kitti/testB --model test --name kitti2vkitti --preprocess none --dataset_mode single --no_drop --num_test 10000