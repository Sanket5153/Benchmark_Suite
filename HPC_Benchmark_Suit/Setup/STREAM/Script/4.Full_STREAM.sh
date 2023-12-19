#!/bin/bash

export stream_dep_path=$CURRENT_DIR/../Setup/STREAM/Dependencies
export stream_install_path=$CURRENT_DIR/../Setup/STREAM/Installation_Path


if [ -d "$stream_install_path/gcc-11.3.0/my_bin" ]; then

    export PATH=$stream_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$stream_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$stream_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$stream_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Loaded                   |"
    echo "----------------------------------------------"

else

    tar -xvf $stream_dep_path/gcc-11.3.0.tar.gz

    cd gcc-11.3.0

    bash ./contrib/download_prerequisites

    mkdir my_bin

    bash ./configure --prefix=$stream_install_path/gcc-11.3.0/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$stream_install_path/gcc-11.3.0/my_bin/bin:$PATH

    export INCLUDE=$stream_install_path/gcc-11.3.0/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$stream_install_path/gcc-11.3.0/my_bin/lib:$LD_LIBRARY_PATH

    export LD_LIBRARY_PATH=$stream_install_path/gcc-11.3.0/my_bin/lib64:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                GCC Installed                 |"
    echo "----------------------------------------------"

fi

#-------------------------------------------------------------------------------

if [ -d "$stream_install_path/openmpi-4.1.4/my_bin" ]; then

    echo ""

    export PATH=$stream_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$stream_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$stream_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    echo "----------------------------------------------"
    echo "|                OpenMPI Loaded                |"
    echo "----------------------------------------------"

else


    tar -xvf $stream_dep_path/openmpi-4.1.4.tar.gz

    cd openmpi-4.1.4

    mkdir my_bin

    bash ./configure --prefix=$stream_install_path/openmpi-4.1.4/my_bin --disable-multilib

    make -j40

    make install

    export PATH=$stream_install_path/openmpi-4.1.4/my_bin/bin:$PATH

    export INCLUDE=$stream_install_path/openmpi-4.1.4/my_bin/include:$INCLUDE

    export LD_LIBRARY_PATH=$stream_install_path/openmpi-4.1.4/my_bin/lib:$LD_LIBRARY_PATH

    cd ..

    echo "----------------------------------------------"
    echo "|                OpenMPI Installed             |"
    echo "----------------------------------------------"


fi

#-------------------------------------------------------------------------

echo "---------------------------------------------------"
echo "|          Checking Intel Compiler  ..             |"
echo "--------------------------------------------------"

if which icc > /dev/null 2>&1; then
    echo "Intel Compiler Present .."
else
    echo "Intel Compiler not Present .."
    echo "Loading Intel Compiler .."
   
    ml av

    read -p "Enter the name of the compiler you want to load: " compiler
 
    ml load "$compiler"
    
fi


#---------------------------------------------------------------------------

if [ -f "$stream_install_path/memory-bandwidth-benchmarks/stream_avx512.bin" ]; then
   echo " "

   echo "----------------------------------------------"
   echo "|          STREAM Already Installed ..           |"
   echo "----------------------------------------------"


else

    tar -xvf $stream_dep_path/memory-bandwidth-benchmarks.tar.gz

    cd memory-bandwidth-benchmarks

    gcc -O3 -DSTREAM_ARRAY_SIZE=10000000 -o stream_avx512 stream.c

    make -j 40

    cd ../

    mv memory-bandwidth-benchmarks/ $stream_install_path/

 #  bash $stream_install_path/memory-bandwidth-benchmarks/run.sh



   echo "----------------------------------------------"
   echo "|          STREAM Installed Successfully        |"
   echo "----------------------------------------------"

fi



#---------------------------------------------------------------


