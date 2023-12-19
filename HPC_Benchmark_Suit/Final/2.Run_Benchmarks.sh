#!/bin/bash

CURRENT_DIR=$(pwd)

RUN_PATH=$CURRENT_DIR/../Run

#RUN_PATH="/home/hpctechtest/sanket/Benchmark_Suit/Run"


while true; do
    clear
    echo "Choose an option:"
    echo "1. Run HPL"
    echo "2. Run HPCG"
    echo "3. Run IO500"
    echo "4. Run SHOC"
    echo "5. Run OSU"
    echo "6. Run STREAM"
    echo "7. Run ALL"
    echo "8. Exit"

    read -p "Enter the number of your choice: " choice
    echo ""

    case $choice in
        1)
            echo "Working on HPL Benchmark ..."
            echo ""
            #source $RUN_PATH/HPL/1.HPL_running.sh
            source $RUN_PATH/HPL/4.HPL_running.sh
            ;;
        2)
            echo "Working on HPCG ..."
            echo ""
            source $RUN_PATH/HPCG/3.HPCG_running.sh
            ;;
        3)
            echo "Working on IO500 Benchmark ..."
            source $RUN_PATH/IO500/2.IO500_Running_v2.sh
            ;;
        4)
            echo "Working on SHOC Benchmark ..."
            echo ""
            source $RUN_PATH/SHOC/1.Running_shoc.sh
            ;;
        5)
            echo "Working on OSU Benchmark ..."
            echo ""
            source $RUN_PATH/OSU/1.Running_OSU.sh
            ;;
        6)
            echo "Working on STREAM Benchmark .."
            source $RUN_PATH/STREAM/1.STREAM_running.sh
            echo ""

            ;;
        7)
            echo "Installing ALL Benchmarks .."
            source $RUN_PATH/HPL/Script/6.Full_HPL.sh
            source $RUN_PATH/HPCG/Script/4.Full_HPCG.sh
            source $RUN_PATH/IO500/Script/4.Full_IO500.sh
            source $RUN_PATH/SHOC/Script/5.Full_SHOC.sh
            source $RUN_PATH/OSU/Script/4.Full_OSU.sh
            source $RUN_PATH/STREAM/Script/4.Full_STREAM.sh
            ;;
        8)
            echo ""
            break
            ;;
        *)
            echo "Invalid option. Please choose a valid option (1-7)."
            ;;
    esac

    read -p "Press Enter to continue..."
done
