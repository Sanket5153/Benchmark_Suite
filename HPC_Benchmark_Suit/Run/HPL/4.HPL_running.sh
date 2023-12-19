#!/bin/bash

ROOT_DIR=$CURRENT_DIR/../Run/HPL

cd $ROOT_DIR


current_datetime=$(date +'%Y-%m-%d_%H:%M:%S')

# Define the path to HPL.dat
#HPL_DAT="$ROOT_DIR/HPL.dat"

#--------------------------------------

if [ -f $ROOT_DIR/Current_Benchmark/*/*.txt ]; then
   echo "Moving Old Benchmark Data"
   echo ""
   mv $ROOT_DIR/Current_Benchmark/* $ROOT_DIR/HPL_Benchmarks/

else
   echo "NO Old Benchmark Data Found"
fi
#---------------------------------------




#---------------------------------------

source 4.HPL_tuner.sh

sed -i "s/[0-9]\+ Ns/$N Ns/g" ./HPL.dat
sed -i "s/[0-9]\+ NBs/$NB NBs/g" ./HPL.dat
sed -i "s/[0-9]\+ Ps/$P Ps/g" ./HPL.dat
sed -i "s/[0-9]\+ Qs/$Q Qs/g" ./HPL.dat

export OMPI_MCA_btl=^openib

mkdir -p $ROOT_DIR/Current_Benchmark/$current_datetime/

#mpirun -np $MPI xhpl HPL.dat > ./Current_Benchmark/$current_datetime/$current_datetime.txt
mpirun -np $MPI xhpl $ROOT_DIR/HPL.dat 2>&1 | tee $ROOT_DIR/Current_Benchmark/$current_datetime/HPL.txt

echo "HPL benchmark completed."

cd -
