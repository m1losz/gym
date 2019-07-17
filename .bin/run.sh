#!/bin/bash

#function not available in subshell have to source it first
source ~/anaconda3/etc/profile.d/conda.sh
conda activate gym

#persistent storage
ln -sn /data /gym/data

jupyter lab --ip=0.0.0.0 --port=80 --no-browser --allow-root
