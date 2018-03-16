#! /bin/bash
#
# train_test.sh
# Copyright (C) 2018 shuobai <shuobai@SHUOs-MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#


# /usr/bin/env sh

TF=$1
TRUEDATA=./$TF/true
FALSEDATA=./$TF/false
DATASAVE=.
echo "Create $TF.txt..."

find $TRUEDATA -name *.png | cut -d '/' -f2-5 | sed "s/$/ 1/">>$DATASAVE/$TF.txt
find $FALSEDATA -name *.png | cut -d '/' -f2-5 | sed "s/$/ 0/">>$DATASAVE/tmp.txt

cat $DATASAVE/tmp.txt>>$DATASAVE/$TF.txt

rm -rf $DATASAVE/tmp.txt

echo "Done.."
