#!/bin/bash

# Usage:  bash gromacs-2018.3-install.sh

# Check it out: 
# https://www.nvidia.com/en-gb/data-center/gpu-accelerated-applications/gromacs/
# http://manual.gromacs.org/documentation/2018/install-guide/index.html
# http://manual.gromacs.org/documentation/

wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2018.3.tar.gz
tar -xzvf *.tar.gz
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=ON -DGMX_GPU=on -DGMX_USE_OPENCL=ON -DGMX_OPENMP=ON
make 
make check
sudo make install

# Finally, we need to export it to the PATH:
# PATH="your-dir/gromacs-2018.3/build/bin:$PATH"

# Anotheroption is to provide an alias to the path:
# alias gmx_mpi='your-dir/gromacs-2018.3/build/bin/./gmx_mpi'
