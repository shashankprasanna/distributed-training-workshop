#!/bin/bash

cd ~/SageMaker
git clone https://github.com/shashankprasanna/distributed-training-workshop.git

cd ~/SageMaker/distributed-training-workshop/notebooks/

source activate tensorflow_p36
python generate_cifar10_tfrecords.py --data-dir dataset

sudo yum install tree -y
tree dataset

my_bucket=<your_bucket>

if ! aws s3api head-bucket --bucket "$my_bucket" 2>/dev/null
then 
    aws s3 mb s3://$my_bucket
fi
aws s3 sync dataset/ s3://$my_bucket/data/cifar10-dataset/