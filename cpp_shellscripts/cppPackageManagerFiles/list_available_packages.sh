#!/bin/zsh
 
###########################################################
# function to list all cpp packages in package folder
#----------------------------------------------------
# INPUT: NONE
###########################################################
 

# set location of packages folder
packages_location='/Users/charlieporto/realshit/cppstuff/modules'

# get list of packages
package_list=($packages_location/*);
packages=();

len_package_list=${#package_list};

integer i=1;
while ((i < len_package_list+1))
do 
  raw_item=${package_list[$i]};
  item="$(basename ${raw_item})";
  packages+=("${item}");
  echo $item
  i+=1;
done;

