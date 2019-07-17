#!/bin/bash

PREFIX="/gym/.config"
#function not available in subshell have to source it first
source ~/anaconda3/etc/profile.d/conda.sh
conda env create --file "$PREFIX/environment.yml" --force

conda info --envs
