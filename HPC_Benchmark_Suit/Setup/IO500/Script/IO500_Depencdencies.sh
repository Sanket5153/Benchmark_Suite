#!/bin/bash

#CURRENT_DIR=$(pwd)

IO500_path=$CURRENT_DIR/../Setup

#----------------------------------------------------

echo "-------------------------------------------------------------------------------"
echo "               Downloading Depenencies For IO500 Benchmark                      "
echo "-------------------------------------------------------------------------------"

cd $IO500_path/IO500/Dependencies

if [ -f "$IO500_path/IO500/Dependencies/gcc-11.3.0.tar.gz" ]; then

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

if [ -f "$IO500_path/IO500/Dependencies/openmpi-4.1.4.tar.gz" ]; then

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

if [ -f "$IO500_path/IO500/Dependencies/io500.tar.gz" ]; then

        echo "IO500 tar found "
echo "-------------------------------------------------------------------------------------"
else
				git clone https://github.com/IO500/io500.git
				tar -cvf io500.tar.gz io500
        sleep 2
        echo ""
        echo ""
echo "---------------------------------------------------------------------------------------"

fi

echo "-------------------------------------------------------------------------------"
echo "               All Dependencies For IO500 Benchmark Downloaded                  "
echo "-------------------------------------------------------------------------------"

cd -
