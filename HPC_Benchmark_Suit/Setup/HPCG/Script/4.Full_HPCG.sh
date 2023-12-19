#!/bin/bash


export hpcg_dep_path=$CURRENT_DIR/../Setup/HPCG/Dependencies
export hpcg_install_path=$CURRENT_DIR/../Setup/HPCG/Installation_Path

if [ -d "$hpcg_install_path/gcc-11.3.0/my_bin" ]; then

    echo ""

    export PATH=$hpcg_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$hpcg_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpcg_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$hpcg_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"


else
    
    tar -xvf $hpcg_dep_path/gcc-11.3.0.tar.gz

    cd gcc-11.3.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$hpcg_install_path/gcc-11.3.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$hpcg_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$hpcg_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpcg_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$hpcg_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

    

fi
#-------------------------------------------------------------------

if [ -d "$hpcg_install_path/openmpi-4.1.4/my_bin" ]; then

    echo ""
 
    export PATH=$hpcg_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$hpcg_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpcg_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                OpenMPI Loaded                |"
    echo "----------------------------------------------"

else


    tar -xvf $hpcg_dep_path/openmpi-4.1.4.tar.gz

    cd openmpi-4.1.4

    mkdir my_bin

    bash ./configure --prefix=$hpcg_install_path/openmpi-4.1.4/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$hpcg_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$hpcg_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$hpcg_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                OpenMPI Installed             |"
    echo "----------------------------------------------"


fi

#------------------------------------------------------------------------------------------------

#Here we have bin 
if [ -d "$hpcg_install_path/hpcg-3.1/bin" ]; then
   echo " "
   export PATH=$hpcg_install_path/hpcg-3.1/bin:$PATH

   echo "----------------------------------------------"
   echo "|          HPCG Already Installed ..        |"
   echo "----------------------------------------------"


else

    tar -xvf $hpcg_dep_path/hpcg-3.1.tar.gz

    cd hpcg-3.1

    make -j40 arch=Linux_MPI

    make install

   if [ ! -d "$hpcg_install_path/hpcg-3.1/" ]; then
        mkdir -p "$hpcg_install_path/hpcg-3.1/"    
   fi

   if [ ! -d "$hpcg_install_path/hpcg-3.1/bin" ]; then
        cp -r ./bin $hpcg_install_path/hpcg-3.1/bin
   fi


   export PATH=$hpcg_install_path/hpcg-3.1/bin:$PATH

   cd .. 

   echo "----------------------------------------------"
   echo "|          HPCG Installed Successfully        |"
   echo "----------------------------------------------"

fi
