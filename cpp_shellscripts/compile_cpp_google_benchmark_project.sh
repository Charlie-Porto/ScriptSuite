#!/bin/zsh
 
###########################################################
# 
#----------------------------------------------------
# INPUT:
# 
###########################################################
 
eval "g++ src/main.cpp -std=c++11 -I /Users/charlieporto/realshit/cppstuff/packages/google_benchmark/benchmark/include -I include -L /Users/charlieporto/realshit/cppstuff/packages/google_benchmark/benchmark/lib -lbenchmark -lpthread -o main.o"

