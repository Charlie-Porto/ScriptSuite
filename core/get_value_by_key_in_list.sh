#!/bin/zsh
 
###########################################################
# returns a value corresponding to a key in a list (psuedo-map)
#----------------------------------------------------
# INPUT:
# string to be found
# map to be searched
###########################################################
 
 
# get input array and count of input array
argv=($@);
argc=${#argv};

# loop through argv and compare the first argument (the search key)
# to each key until a match is found
integer len_map=${#argv}
integer i=2;
value="NOT_FOUND";
while ((i<len_map))
do
  key=${argv[$i]};
  if [[ "${argv[1]}" == "$key" ]]; then
    value="${argv[$i+1]}";
    i=$len_map;
  fi;
  i+=2;
done;

echo $value;
 
 
