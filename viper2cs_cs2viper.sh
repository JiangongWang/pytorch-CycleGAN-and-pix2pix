#! /bin/bash  

python train.py --dataroot ./datasets/viper2cs --name viper2cs --load_size 1024 --crop_size 400 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40
cp ./checkpoints/viper2cs/latest_net_G_A.pth ./checkpoints/viper2cs/latest_net_G.pth
cp ./checkpoints/viper2cs/latest_net_G_B.pth ./checkpoints/cs2viper/latest_net_G.pth
python test.py --dataroot ./datasets/viper2cs/testA --model test --name viper2cs --preprocess none --dataset_mode single --no_drop --num_test 10000
python test.py --dataroot ./datasets/viper2cs/testB --model test --name cs2viper --preprocess none --dataset_mode single --no_drop --num_test 10000