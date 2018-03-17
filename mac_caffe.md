caffe on mac os and create python interface
===

###install brew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

###install dependecies with brew

```
brew install -vd snappy leveldb gflags glog szip lmdb

brew install hdf5 opencv

brew upgrade libpng

brew tap homebrew/science

brew tap homebrew/versions

brew install --build-from-source --with-python -vd protobuf

brew install --build-from-source -vd boost boost-python
```

###create virtualenv
```
cd workspace
```
```
virtualenv ENV
```
```
git clone $URL of caffe$
```
```
cp Makefile.Config.example Makefile.config
```

1. CPU_ONLY := 1 should be uncommented
2. CUDA_DIR should point to the correct install location
3. Use BLAS := atlas
4. PYTHON_INCLUDE is required to locate the Python.h and numpy/arrayobject.h files.

Python.h in include/python2.7

numpy/arrayobject.h in /lib/python2.7/site-packages/numpy/core/include

```
make all
```
```
make test
```
```
make runtest
```

###create python interface
```
make pycaffe
```
```
vim ~/.bashrc
```
```
export PYTHONPATH = "/your/path/to/caffe/python/:$PYTHONPATH"
```
```
python
import caffe
```


