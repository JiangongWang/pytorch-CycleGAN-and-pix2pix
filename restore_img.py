import os
import glob
import argparse
from PIL import Image

def parse_args():
    parser = argparse.ArgumentParser('parser for converting mapillary to voc format')
    parser.add_argument("--org_imgs_dir", type=str, default='./datasets/synthia2mapillary/trainB/JPEGImages/')
    parser.add_argument("--imgs_dir", type=str, default='./results/mapillary2synthia/test_latest/train2017_mapillary2synthia')
    parser.add_argument("--out_dir", type=str, default='./results/mapillary2synthia/test_latest/train2017_synthia')
    return parser.parse_args()

if __name__ == '__main__':
    args = parse_args()
    imgs_path = glob.glob(os.path.join(args.imgs_dir, '*.jpg'))
    assert imgs_path!=[]
    if not os.path.exists(args.out_dir):
        os.mkdir(args.out_dir)
    for img_path in imgs_path:
        print(img_path)
        img_name = os.path.basename(img_path)
        org_img = Image.open(os.path.join(args.org_imgs_dir, img_name))
        img = Image.open(img_path)

        ow, oh = org_img.size
        new_img = img.resize((ow, oh), Image.BICUBIC)
        new_img.save(os.path.join(args.out_dir, img_name))
