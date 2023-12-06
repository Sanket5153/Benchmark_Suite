#!/bin/bash

#read -p "Enter Total Ram on System : " ram

ram=$(free -b | grep Mem: | awk {'print $2'})

let val=$(( ram/8 ))

square_root=$(echo "$val" | awk '{print sqrt($1)}')

echo ""
echo "Total RAM on system is : " $ram
echo ""

#--------------------------------

#Give Efficiency we want

read -p "Enter in which efficiency you want to check : " effeciency 

let Eff=$(( square_root * effeciency/100 )) 

echo ""
echo "Working on Data for $effeciency % Efficiency "
echo ""

#---------------------------------------------------

#Give Block size we want

read -p "Enter block size (NB) : " NB

echo ""
echo "Block size given is : " $NB
echo ""

let N_size=$(( Eff / NB ))

let N=$(( N_size * NB))

echo "Final Size of N : " $N
echo ""

#------------------------------
read -p "Enter the number of processes (P): " P

read -p "Enter the number of threads per process (Q): " Q

read -p "Number of MPI process : " MPI

#------------------------------

export NB

export N

export P

export Q

export MPI
