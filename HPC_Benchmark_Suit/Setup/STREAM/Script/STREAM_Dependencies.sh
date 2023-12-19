#!/bin/bash

#CURRENT_DIR=$(pwd)

STREAM_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For STREAM Benchmark                      "
echo "-------------------------------------------------------------------------------"

cd $STREAM_path/STREAM/Dependencies

if [ -f "$STREAM_path/STREAM/Dependencies/gcc-11.3.0.tar.gz" ]; then

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

if [ -f "$STREAM_path/STREAM/Dependencies/openmpi-4.1.4.tar.gz" ]; then

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

if [ -f "$STREAM_path/STREAM/Dependencies/memory-bandwidth-benchmarks.tar.gz" ]; then

        echo "memory-bandwidth-benchmark tar found "
echo "-------------------------------------------------------------------------------------"
else

				git clone https://github.com/intel/memory-bandwidth-benchmarks.git
				tar -cvf memory-bandwidth-benchmarks.tar.gz memory-bandwidth-benchmarks
        sleep 2
        echo ""
        echo ""
echo "---------------------------------------------------------------------------------------"

fi

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For STREAM Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -

