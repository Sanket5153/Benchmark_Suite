#!/bin/bash

#CURRENT_DIR=$(pwd)

SHOC_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For SHOC Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $SHOC_path/SHOC/Dependencies

if [ -f "$SHOC_path/SHOC/Dependencies/gcc-7.5.0.tar.gz" ]; then

        echo "GCC tar Found "
echo "---------------------------------------------------------------------------------"
else

        wget https://ftp.gnu.org/gnu/gcc/gcc-7.5.0/gcc-7.5.0.tar.gz --no-check-certificate
        echo "GCC Downloaded "
        sleep 2
        echo ""
        echo ""
echo "---------------------------------------------------------------------------------"

fi

#--------------------------------------------------------------------

if [ -f "$SHOC_path/SHOC/Dependencies/openmpi-4.1.4.tar.gz" ]; then

        echo "OpenMPI tar found"
echo "----------------------------------------------------------------------------------"
else

        wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz  --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "-----------------------------------------------------------------------------------"

fi

#--------------------------------------------------------------------

if [ -f "$SHOC_path/SHOC/Dependencies/cuda_10.1.243_418.87.00_linux.run" ]; then

        echo "CUDA tar found"
echo "----------------------------------------------------------------------------------"
else

        wget https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.243_418.87.00_linux.run  --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "-----------------------------------------------------------------------------------"

fi

#---------------------------------------------------------------------

if [ -f "$SHOC_path/SHOC/Dependencies/shoc.tar.gz" ]; then

        echo "SHOC tar found"
echo "----------------------------------------------------------------------------------"
else

        git clone https://github.com/vetter/shoc.git
				tar -cvf shoc.tar.gz shoc/
        sleep 2
        echo ""
        echo ""
echo "-----------------------------------------------------------------------------------"

fi

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For SHOC Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -
