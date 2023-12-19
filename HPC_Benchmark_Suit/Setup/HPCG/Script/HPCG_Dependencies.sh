#!/bin/bash

#CURRENT_DIR=$(pwd)

HPCG_path=$CURRENT_DIR/../Setup


#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For HPCG Benchmark                      "
echo "-------------------------------------------------------------------------------"


cd $HPCG_path/HPCG/Dependencies

if [ -f "$HPCG_path/HPCG/Dependencies/gcc-11.3.0.tar.gz" ]; then

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

if [ -f "$HPCG_path/HPCG/Dependencies/openmpi-4.1.4.tar.gz" ]; then

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

if [ -f "$HPCG_path/HPCG/Dependencies/hpcg-3.1.tar.gz" ]; then

        echo "HPCG tar found"
echo "----------------------------------------------------------------------------------"
else

        wget https://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz --no-check-certificate
        sleep 2
        echo ""
        echo ""
echo "-----------------------------------------------------------------------------------"

fi


#------------------------------------------------------------------------
echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For HPCG Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"


cd -