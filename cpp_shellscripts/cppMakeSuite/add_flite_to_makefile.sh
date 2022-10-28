#!/bin/zsh
 
###########################################################
# adds flite compilation and linking info to a project.
#----------------------------------------------------
# INPUT:
# a full makefile path
###########################################################
 
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};

# assign variables 
makefile_path=${argv[1]};

local put() {echo $1 >> $makefile_path}

put "\n-L/Users/charlieporto/realshit/cppstuff/packages/whole_packages/flite/include \\"
put "-L/Users/charlieporto/realshit/cppstuff/packages/whole_packages/flite/build/x86_64-darwin19.4.0/lib \\"
put "-lflite \\"
put "-lflite_usenglish \\"

echo "flite library paths successfully added to compile_project.sh"


 
