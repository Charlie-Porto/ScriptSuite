#!/bin/zsh
 
###########################################################
# explained_by_title
#----------------------------------------------------
# INPUT:
# -> string: file name
###########################################################
 
# imports
coref_coda="/Users/charlieporto/realshit/shellscripts/core/./open_abbreviated_file_in_vscode.sh"
 
# get input array and count of input array
argv=($@);
argc=${#argv};

# assign variables
file_name=${argv[1]}

$coref_coda $file_name;
cd "implementations"
$coref_coda $file_name;
cd ../
 
 
