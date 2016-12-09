# Install Anaconda

We likely already have a python installed, so let's install `pyenv` first. It's easy to install dependancies on OSX using `homebrew` so make sure you have that installed first.

[http://brew.sh/](http://brew.sh/)

Once homebrew is installed, run the following commands from the terminal.

```
brew install pyenv

pyenv install anaconda-2.0.1

pyenv rehash

sudo pyenv local anaconda-2.0.1

sudo pyenv global anaconda-2.0.1

```

**Update packages in anaconda**

```

conda update conda

conda update anaconda

```

**Check anaconda path**

```
conda env list
```

You will get something like this:

/Users/zoro/.pyenv/versions/anaconda-2.0.1



# Install OpenCV

```
brew update

brew tap homebrew/science
```



&gt;&gt;&gt; here we want to do something different

* We will need to edit the OpenCV installation file a bit.
* _**brew edit opencv**_
* replace the following lines -
* _**args « "-DPYTHON\#{py\_ver}\_LIBRARY=\#{py\_lib}/libpython2.7.\#{dylib}"**_
* _**args « "-DPYTHON\#{py\_ver}\_INCLUDE\_DIR=\#{py\_prefix}/include/python2.7"**_
* with -
* _**args « "-DPYTHON\_LIBRARY=\#{py\_prefix}/lib/libpython2.7.dylib"**_
* _**args « "-DPYTHON\_INCLUDE\_DIR=\#{py\_prefix}/include/python2.7"**_



# Caffe

On the terminal, find a directory where you want Caffe to live and run the following:

```
git clone [https://github.com/BVLC/caffe.git](https://github.com/BVLC/caffe.git)

cd &lt;caffe-dir&gt;/python

for req in $\(cat requirements.txt\); do condainstall $req; done

```

If that doesn't work, you may need to install boost manually.

# Boost install

First try to just install the requirements

```
for x in snappy leveldb gflags glog szip lmdb homebrew/science/opencv; do brew uninstall $x; brew install --build-from-source --fresh -vd $x; done

brew uninstall protobuf;

brew install --build-from-source --with-python --fresh -vd protobuf

brew uninstall boost
brew uninstall boost-python
brew install --build-from-source --fresh -vd boost boost-python

conda install protobuf

conda install boost

```

O

```
cd ../

cp Makefile.config.example Makefile.config
```

**Makefile.config**

Modify Makefile.config for to use CPU\_ONLY option. If you have a nvidia GPU, this does not apply.

```
# CPU-only switch (uncomment to build without GPU support).

# CPU_ONLY := 1

CPU_ONLY := 1
```

NOTE: this is required only if you will compile the python interface.

We need to be able to find Python.h and numpy/arrayobject.h.

PYTHON_INCLUDE := /usr/include/python2.7

# /usr/lib/python2.7/dist-packages/numpy/core/include

# Anaconda Python distribution is quite popular. Include path:

# Verify anaconda location, sometimes it's in root.

ANACONDA\_HOME := /path/to/anaconda-2.0.1

PYTHON\_INCLUDE := $\(ANACONDA\_HOME\)/include \

$\(ANACONDA\_HOME\)/include/python2.7 \

$\(ANACONDA\_HOME\)/lib/python2.7/site-packages/numpy/core/include \# We need to be able to find [libpythonX.X.so](http://libpythonx.x.so/) or .dylib.


PYTHON_LIB := /usr/lib

PYTHON\_LIB := $\(ANACONDA\_HOME\)/lib

add to .profile

# pyenv

export PYENV\_ROOT="${HOME}/.pyenv"

if \[ -d "${PYENV\_ROOT}" \]; then

```
export PATH=${PYENV_ROOT}/bin:$PATH

eval "$(pyenv init -)"
```

fi

# caffe

export PYTHONPATH=/path/to/caffe/python:$PYTHONPATH

export DYLD\_FALLBACK\_LIBRARY\_PATH=/usr/local/cuda/lib:$HOME/.pyenv/versions/anaconda-2.0.1/lib:/usr/local/lib:/usr/lib

\(maybe also comment out python import line like this, test first\)

# PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"

exportPATH

Compile and Test

make all

make runtest

make pycaffe

make distribute
