EE211_finalproject
===
Include
---
```
EE211_finalproject
├── caffe
│   ├── get_train_log.sh
│   ├── get_test_log.sh
│   └── models
│  	│ 	│── bvlc_reference_caffenet
│	│	│	├── train_val.prototxt
│	│	│	└── solver.prototxt
├── create_imagenet.sh
├── ilsvrc12_train_lmdb
│   ├── data.mdb
│   └── lock.mdb
├── ilsvrc12_val_lmdb
│   ├── data.mdb
│   └── lock.mdb
├── imagenet_mean.binaryproto
├── make_imagenet_mean.sh
├── sample.py
├── train.txt
├── train_test.sh
└── val.txt
```
Introduction
---
This project is Caffenet-based Automatic Prostate Tumor Classification from T2-MRI. The framework is caffe and we build our network based on BVLC reference caffenet and set our own solver file. 
We use PROSTATEx Challenge Data Sets for training and testing and random pick-in, random pick-out to augmentation the image. The final accuracy can get an average value of 0.7.

Dependencies
---
1. Download data from our google drive which included in ```data.md```.
2. Set up caffe environment and the instruction is included in ```mac_caffe.md```.
3. Use our ```train_val.prototxt``` and ```solver.prototxt``` to replace the original files in models/bvlc\_reference_caffenet.
4. 	Prepare data and use our script file to train model and get the result.

Data preparation
---
1. Download data and set the fold name as train and val.
2. Put train and val image fold and your caffe framework fold in your work space fold.
3. Run ```bash train_test.sh train``` will create train.txt to save the train image path and its label in a txt file.
4. Run ```bash train_test.sh val``` will create val.txt in the same way.
5. Run ```./create_imagenet.sh```	 will create train and val lmdb file which will help to increase the calculate efficiency.
6. Run ```./make_imagenet_mean.sh``` will create imagenet_mean.binaryproto which is useful in training.


Training model and save the result
---
1. Make sure 	you have get train and val lmdb file, imagenet_mean.binaryproto file and you have build your caffe successfuly.
2. Make sure you have successfully replced ```train_val.prototxt``` and ```solver.prototxt``` as the Dependencies part.
3. Get into your caffe fold and run ```get_train_log.sh bvlc_reference_caffenet``` to apply adjusted training file. If you want to test other network. You just need to rewrite your training file and change the model name to yours.
4. After training, you will find ```train_result.txt``` which saves the training log in caffe\_train_log fold.
5. If you want to test the model, you can run ```get_test_log.sh bvlc_reference_caffenet``` which saves the predict log in caffe\_net_log fold.

Sample
---
We save some logs of our training model in training_log fold as a sample.