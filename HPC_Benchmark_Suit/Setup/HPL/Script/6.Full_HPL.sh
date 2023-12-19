#!/bin/bash


export hpl_dep_path=$CURRENT_DIR/../Setup/HPL/Dependencies
export hpl_install_path=$CURRENT_DIR/../Setup/HPL/Installation_Path

if [ -d "$hpl_install_path/gcc-11.3.0/my_bin" ]; then

    export PATH=$hpl_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$hpl_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpl_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$hpl_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"


else 

    tar -xvf $hpl_dep_path/gcc-11.3.0.tar.gz

    cd gcc-11.3.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$hpl_install_path/gcc-11.3.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$hpl_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$hpl_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpl_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$hpl_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

fi

#------------------------------------------------------------------------------------------

if [ -d "$hpl_install_path/openmpi-4.1.4/my_bin/" ]; then

   export PATH=$hpl_install_path/openmpi-4.1.4/my_bin/bin:$PATH

   export INCLUDE=$hpl_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

   export LD_LIBRARY_PATH=$hpl_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

   echo "----------------------------------------------"
   echo "|                OpenMPI Loaded                |"
   echo "----------------------------------------------"

else

   tar -xvf $hpl_dep_path/openmpi-4.1.4.tar.gz

   cd openmpi-4.1.4

   mkdir my_bin

   bash ./configure --prefix=$hpl_install_path/openmpi-4.1.4/my_bin --disable-multilib

   make -j40

   make install

   export PATH=$hpl_install_path/openmpi-4.1.4/my_bin/bin:$PATH

   export INCLUDE=$hpl_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE
 
   export LD_LIBRARY_PATH=$hpl_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

   cd ..

   echo "----------------------------------------------"
   echo "|                OpenMPI Installed             |"
   echo "----------------------------------------------"

fi

#-----------------------------------------------------------------------------------------------

if [ -d "$hpl_install_path/OpenBLAS-0.3.24/my_bin" ]; then
   
   export PATH=$hpl_install_path/OpenBLAS-0.3.24/my_bin/bin:$PATH

   export INCLUDE=$hpl_install_path/OpenBLAS-0.3.24/my_bin/include:$INCLUDE

   export LD_LIBRARY_PATH=$hpl_install_path/OpenBLAS-0.3.24/my_bin/lib:$LD_LIBRARY_PATH


  echo "----------------------------------------------"
  echo "|                OpenBlas Loaded              |"
  echo "----------------------------------------------"

else

  tar -xvf $hpl_dep_path/OpenBLAS-0.3.24.tar.gz

  cd OpenBLAS-0.3.24

  mkdir my_bin

  make -j40 PREFIX=$hpl_install_path/OpenBLAS-0.3.24/my_bin

  make  PREFIX=$hpl_install_path/OpenBLAS-0.3.24/my_bin install

  export PATH=$hpl_install_path/OpenBLAS-0.3.24/my_bin/bin:$PATH

  export INCLUDE=$hpl_install_path/OpenBLAS-0.3.24/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$hpl_install_path/OpenBLAS-0.3.24/my_bin/lib:$LD_LIBRARY_PATH

  cd ..

  echo "----------------------------------------------"
  echo "|                OpenBlas Installed             |"
  echo "----------------------------------------------"

fi
#--------------------------------------------------------------------------

if [ -d "$hpl_install_path/Blas-3.4.2/my_bin/lib64" ]; then

  export LD_LIBRARY_PATH=$hpl_install_path/Blas-3.4.2/my_bin/lib64:$LD_LIBRARY_PATH

  echo "----------------------------------------------"
  echo "|              Blas-3.4.2 Loaded              |"
  echo "----------------------------------------------"

else

  mkdir $hpl_install_path/Blas-3.4.2

  cd $hpl_install_path/Blas-3.4.2

  cp $hpl_dep_path/blas-devel-3.4.2-8.el7.x86_64.rpm .

  rpm2cpio blas-devel-3.4.2-8.el7.x86_64.rpm | cpio -idmv

  mv usr/ my_bin

  export LD_LIBRARY_PATH=$hpl_install_path/Blas-3.4.2/my_bin/lib64:$LD_LIBRARY_PATH

fi

cd ..


#--------------------------------------------------------------------------

if [ -d "$hpl_install_path/hpl-2.3/my_bin/" ]; then

  export PATH=$hpl_install_path/hpl-2.3/my_bin/bin:$PATH

  #export INCLUDE=$hpl_install_path/hpl-2.3/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$hpl_install_path/hpl-2.3/my_bin/lib:$LD_LIBRARY_PATH

  #export LD_LIBRARY_PATH=$hpl_install_path/hpl-2.3/my_bin/lib64:$LD_LIBRARY_PATH

  echo "----------------------------------------------"
  echo "|              HPL Loaded                     |"
  echo "----------------------------------------------"  

else

  tar -xvf $hpl_dep_path/hpl-2.3.tar.gz

  cd hpl-2.3

  mkdir my_bin

  bash ./configure --prefix=$hpl_install_path/hpl-2.3/my_bin --disable-multilib

  make -j40

  make install

  export PATH=$hpl_install_path/hpl-2.3/my_bin/bin:$PATH

  #export INCLUDE=$hpl_install_path/hpl-2.3/my_bin/include:$INCLUDE

  export LD_LIBRARY_PATH=$hpl_install_path/hpl-2.3/my_bin/lib:$LD_LIBRARY_PATH

 # export LD_LIBRARY_PATH=$hpl_install_path/hpl-2.3/my_bin/lib64:$LD_LIBRARY_PATH

  cd ..
  
  echo "----------------------------------------------"
  echo "|              HPL Installed                  |"
  echo "----------------------------------------------"

fi
