#!/bin/bash

CURRENT_DIR=$(pwd)

Setup_Path=$CURRENT_DIR/../Setup

while true; do
    clear
    echo "Choose an option:"
    echo "1. Install HPL"
    echo "2. Install HPCG"
    echo "3. Install IO500"
    echo "4. Install SHOC"
    echo "5. Install OSU"
    echo "6. Install STREAM"
    echo "7. Install ALL"
    echo "8. Exit"

    read -p "Enter the number of your choice: " choice
    echo ""
    
    case $choice in
        1)
            echo ""
            source $Setup_Path/HPL/Script/HPL_Dependencies.sh
            echo ""
            echo "Working on HPL Benchmark ..."
            echo ""
            source $Setup_Path/HPL/Script/6.Full_HPL.sh
	    
            ;;
        2)
            echo ""
            source $Setup_Path/HPCG/Script/HPCG_Dependencies.sh
            echo ""
            echo "Working on HPCG ..."
            echo ""
            source $Setup_Path/HPCG/Script/4.Full_HPCG.sh
            ;;
        3)
            echo ""
            source $Setup_Path/IO500/Script/IO500_Depencdencies.sh
            echo ""
            echo "Working on IO500 Benchmark ..."
	    source $Setup_Path/IO500/Script/4.Full_IO500.sh
            ;;
        4)
            echo ""
            source $Setup_Path/SHOC/Script/SHOC_Dependencies.sh
            echo ""
            echo "Working on SHOC Benchmark ..."
            echo ""
            source $Setup_Path/SHOC/Script/5.Full_SHOC.sh
            ;;
        5)
            echo ""
            source $Setup_Path/OSU/Script/OSU_dependencies.sh
            echo ""
            echo "Working on OSU Benchmark ..."
            echo ""
            source $Setup_Path/OSU/Script/4.Full_OSU.sh
            ;;
        6)
            echo ""
            source $Setup_Path/STREAM/Script/STREAM_Dependencies.sh
            echo ""

            echo "Working on STREAM Benchmark .."
            source $Setup_Path/STREAM/Script/4.Full_STREAM.sh
            echo ""
            
            ;;
        7)

            echo "Installing ALL Benchmarks .."
            source $Setup_Path/HPL/Script/HPL_Dependencies.sh
            source $Setup_Path/HPL/Script/6.Full_HPL.sh
            
            source $Setup_Path/HPCG/Script/HPCG_Dependencies.sh
            source $Setup_Path/HPCG/Script/4.Full_HPCG.sh
            
            source $Setup_Path/IO500/Script/IO500_Depencdencies.sh
            source $Setup_Path/IO500/Script/4.Full_IO500.sh
 
            source $Setup_Path/SHOC/Script/SHOC_Dependencies.sh
            source $Setup_Path/SHOC/Script/5.Full_SHOC.sh

            source $Setup_Path/OSU/Script/OSU_dependencies.sh
            source $Setup_Path/OSU/Script/4.Full_OSU.sh
 
            source $Setup_Path/STREAM/Script/STREAM_Dependencies.sh
            source $Setup_Path/STREAM/Script/4.Full_STREAM.sh
            ;;
        8)
	   # echo "Bye ..."
            break 
            ;;
        *)
            echo "Invalid option. Please choose a valid option (1-7)."
            ;;
    esac

    read -p "Press Enter to continue..."
done

echo ".... Thank You For Using HPC Benchmark Suite ...."
