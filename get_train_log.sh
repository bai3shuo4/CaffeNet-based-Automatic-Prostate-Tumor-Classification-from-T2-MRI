#! /bin/bash
#
# get_test_log.sh
# Copyright (C) 2018 shuobai <shuobai@s-169-232-183-170.resnet.ucla.edu>
#
# Distributed under terms of the MIT license.
#
MODELNAME=$1

mkdir caffe_train_log
./build/tools/caffe train -solver=models/$MODELNAME/solver.prototxt -log_dir=./caffe_train_log
cd ./caffe_train_log
cp caffe.INFO train_result.txt
rm caffe.INFO
rm caffe.s*
cd ..

