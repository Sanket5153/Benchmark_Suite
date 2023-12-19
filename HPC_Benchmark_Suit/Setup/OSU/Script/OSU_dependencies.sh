#!/bin/bash

#CURRENT_DIR=$(pwd)

Benchmark_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For OSU Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $Benchmark_path/OSU/Dependencies

if [ -f "$Benchmark_path/OSU/Dependencies/gcc-11.3.0.tar.gz" ]; then

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

if [ -f "$Benchmark_path/OSU/Dependencies/openmpi-4.1.4.tar.gz" ]; then

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

if [ -f "$Benchmark_path/OSU/Dependencies/osu-micro-benchmarks-5.6.2.tar.gz" ]; then

        echo "osu-micro-benchmark tar found"
echo "----------------------------------------------------------------------------------"
else

        wget http://mvapich.cse.ohio-state.edu/download/mvapich/osu-micro-benchmarks-5.6.2.tar.gz --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "-----------------------------------------------------------------------------------"

fi

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For OSU Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -
