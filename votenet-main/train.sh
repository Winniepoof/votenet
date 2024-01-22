#!/bin/bash
#SBATCH -J votenet #提交作业的名字，可自行更改
#SBATCH -N 1 #节点数
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16 #cpu数量
#SBATCH --gres=dcu:4 # dcu数量
#SBATCH -p train # 工作队列
#SBATCH --mem=96G # 内存大小
#SBATCH -D /public/home/uzhangxf/votenet # 工作目录
#SBATCH -o /public/home/uzhangxf/votenet/logshuchu  #日志文件输出目录

module purge
module load apps/anaconda3/5.2.0
module load compiler/devtoolset/7.3.1
module load compiler/rocm/4.0.1
conda activate vt


python train.py --dataset sunrgbd --log_dir log_demo
