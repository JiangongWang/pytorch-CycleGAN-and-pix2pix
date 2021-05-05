#! /bin/bash  

EXP_NAME="viper2mapillary"
OUT_NAME="mapillary2viper"

python train.py --dataroot ./datasets/$EXP_NAME --name $EXP_NAME --load_size 1024 --crop_size 400 --preprocess scale_width_and_crop --lambda_identity 1 --n_epochs 40 --n_epochs_decay 40

cp ./checkpoints/$EXP_NAME/latest_net_G_A.pth ./checkpoints/$EXP_NAME/latest_net_G.pth

python test.py --dataroot ./datasets/$EXP_NAME/testA --model test --name $EXP_NAME --preprocess none --dataset_mode single --no_drop --num_test 10000

cp ./checkpoints/$EXP_NAME/latest_net_G_B.pth ./checkpoints/$OUT_NAME/latest_net_G.pth

python test.py --dataroot ./datasets/$EXP_NAME/testB --model test --name $OUT_NAME --load_size 1024 --preprocess scale_width --dataset_mode single --no_drop --num_test 20000

mkdir ./results/$EXP_NAME/test_latest/train2017_$EXP_NAME
mkdir ./results/$OUT_NAME/test_latest/train2017_$OUT_NAME

cp ./results/$EXP_NAME/test_latest/images/*_fake.png ./results/$EXP_NAME/test_latest/train2017_$EXP_NAME/
rename 's/_fake//' ./results/$EXP_NAME/test_latest/train2017_$EXP_NAME/*
cp ./results/$OUT_NAME/test_latest/images/*_fake.png ./results/$OUT_NAME/test_latest/train2017_$OUT_NAME/
rename 's/_fake//' ./results/$OUT_NAME/test_latest/train2017_$OUT_NAME/*
