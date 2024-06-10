#!/bin/bash -l

#SBATCH --gres=gpu:h100_pcie_2g.20gb
#SBATCH --time=20-00:00:00
#SBATCH --partition=p.hpcl91
#SBATCH --mem-per-cpu=20G
#SBATCH --ntasks-per-core=2
#SBATCH --output=plates_50000-%j.out

cd /fs/pool/pool-lambacher/Cluster_Projects/AL_DAB-DETR

mamba activate dab-detr

#torchrun main.py --coco_path=/fs/pool/pool-lambacher/Cluster_Projects/data/mycoco_150

python -u main.py -m=dab_detr --output_dir=logs/DABDETR_ARTIFICIAL_PLATE/R50/plates_50000 --batch_size=10 --epochs=100 --lr_drop=40 --number_of_classes_new=103 --resume=/fs/pool/pool-lambacher/Cluster_Projects/AL_DAB-DETR/download_checkpoint/checkpoint.pth --coco_path=/fs/pool/pool-lambacher/Cluster_Projects/data/plates_50000

