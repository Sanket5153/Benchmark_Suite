#!/bin/bash

#$CURRENT_DIR/../Setup
export IO500_dep_path=$CURRENT_DIR/../Setup/IO500/Dependencies
export IO500_install_path=$CURRENT_DIR/../Setup/IO500/Installation_Path

if [ -d "$IO500_install_path/gcc-11.3.0/my_bin" ]; then

    echo ""

    export PATH=$IO500_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$IO500_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$IO500_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$IO500_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"


else
    
    tar -xvf $IO500_dep_path/gcc-11.3.0.tar.gz

    cd gcc-11.3.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$IO500_install_path/gcc-11.3.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$IO500_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$IO500_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$IO500_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$IO500_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

    

fi
#-------------------------------------------------------------------

if [ -d "$IO500_install_path/openmpi-4.1.4/my_bin" ]; then

    echo ""
 
    export PATH=$IO500_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$IO500_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$IO500_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                OpenMPI Loaded                |"
    echo "----------------------------------------------"

else


    tar -xvf $IO500_dep_path/openmpi-4.1.4.tar.gz

    cd openmpi-4.1.4

    mkdir my_bin

    bash ./configure --prefix=$IO500_install_path/openmpi-4.1.4/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$IO500_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$IO500_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$IO500_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                OpenMPI Installed             |"
    echo "----------------------------------------------"


fi

#------------------------------------------------------------------------------------------------

if [ -d "$IO500_install_path/io500/bin" ]; then
   echo " "
   export PATH=$IO500_install_path/io500/bin:$PATH
   export LD_LIBRARY_PATH=$IO500_install_path/io500/lib:$LD_LIBRARY_PATH
   export INCLUDE=$IO500_install_path/io500/include:$INCLUDE

   echo "----------------------------------------------"
   echo "|          IO500 Already Installed ..        |"
   echo "----------------------------------------------"


else

    tar -xvf $IO500_dep_path/io500.tar.gz

    cd io500

    bash prepare.sh

    rm ./bin/pfind

    if [ ! -d "$IO500_install_path/io500/" ]; then
        mkdir -p "$IO500_install_path/io500/"
    fi

    if [ ! -d "$IO500_install_path/hpcg-3.1/bin" ]; then
        cp -r ./bin $IO500_install_path/io500/
        cp -r ./include $IO500_install_path/io500/
        cp -r ./lib $IO500_install_path/io500/
        cp -r ./build/pfind/pfind $IO500_install_path/io500/bin/
        cp -r ./test/ $IO500_install_path/io500/
    fi

    export PATH=$IO500_install_path/io500/bin:$PATH
    export LD_LIBRARY_PATH=$IO500_install_path/io500/lib:$LD_LIBRARY_PATH
    export INCLUDE=$IO500_install_path/io500/include:$INCLUDE

   cd ..

   echo "----------------------------------------------"
   echo "|          IO500 Installed Successfully        |"
   echo "----------------------------------------------"

fi


