#!/bin/bash

#CURRENT_DIR=$(pwd)

HPL_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For HPL Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $HPL_path/HPL/Dependencies

if [ -f "$HPL_path/HPL/Dependencies/gcc-11.3.0.tar.gz" ]; then

        echo "GCC tar Found "
echo "---------------------------------------------------------------------------------"
else

        wget https://ftp.gnu.org/gnu/gcc/gcc-11.3.0/gcc-11.3.0.tar.gz --no-check-certificate

        echo "GCC Downloaded "
        sleep 2
        echo ""
        echo ""
echo "---------------------------------------------------------------------------------"

fi

#------------------------------------------------------------------------------------

if [ -f "$HPL_path/HPL/Dependencies/openmpi-4.1.4.tar.gz" ]; then

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

if [ -f "$HPL_path/HPL/Dependencies/OpenBLAS-0.3.24.tar.gz" ]; then

        echo "OpenBLAS tar found "
echo "-------------------------------------------------------------------------------------"
else

        wget https://github.com/xianyi/OpenBLAS/releases/download/v0.3.24/OpenBLAS-0.3.24.tar.gz --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "---------------------------------------------------------------------------------------"

fi

#-------------------------------------------------------------------

if [ -f "$HPL_path/HPL/Dependencies/blas-devel-3.4.2-8.el7.x86_64.rpm" ]; then

        echo "Blas tar found"
echo "----------------------------------------------------------------------------------------"
else

        wget http://mirror.centos.org/centos/7/os/x86_64/Packages/blas-devel-3.4.2-8.el7.x86_64.rpm --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "------------------------------------------------------------------------------------------"

fi

#----------------------------------------------------------------------

if [ -f "$HPL_path/HPL/Dependencies/hpl-2.3.tar.gz" ]; then

        echo "HPL-2.3 tar found "
echo "--------------------------------------------------------------------------------------------"
else

        wget https://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz --no-check-certificate
        sleep 2
        echo ""
        echo ""

echo "---------------------------------------------------------------------------------------------"

fi

#-------------------------------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For HPL Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -
