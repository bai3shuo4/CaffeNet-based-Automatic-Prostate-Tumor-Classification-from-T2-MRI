#! /bin/bash
#
# get_test_log.sh
# Copyright (C) 2018 shuobai <shuobai@s-169-232-183-170.resnet.ucla.edu>
#
# Distributed under terms of the MIT license.
#
MODELNAME=$1

mkdir caffe_net_log
for filename in models/$MODELNAME/caffe*.caffemodel;do
    echo $filename
    caffemodel=`basename "$filename"`
    echo $caffemodel
    ./build/tools/caffe test -model=models/$MODELNAME/train_val.prototxt -weights=models/$MODELNAME/$caffemodel -iterations=300 -log_dir=./caffe_net_log
    cd ./caffe_net_log
    cp caffe.INFO $caffemodel.txt
    rm caffe.INFO
    rm caffe.s*
    cd ..
 done
