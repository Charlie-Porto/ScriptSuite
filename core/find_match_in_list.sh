#!/bin/zsh
 
###########################################################
# finds a match in a list. returns two values:
# if found: 1, if not found, 0
# the item found
#----------------------------------------------------
# INPUT:
# - string: item searched for
# - array: array being searched
#      - NOTE: pass to function as single array.
###########################################################
 
input=("$@");
search_item=${input[1]};

a=$search_item;
integer l=${#a}+1;
p=$input;

integer n=${#input}+1;
target_item=$a;
integer if_match=0	

integer i=2;
while ((i < n))
do
  c=$input[$i]
  integer w=${#c}+1
  
  if [[ $w -gt $l ]]
  then 
    integer w=$l
  fi
  
  integer j=1
  while ((j<w))
  do
    x=${a[$j]}
    y=${c[$j]}

    if [[ "$x" == "$y" ]]
    then 
      integer j=$j+1
      
      if [[ $j -eq $w ]]
      then
        target_item=$c
        integer if_match=1
      fi
    else
      integer j=$w+1;
    fi	
  done
if [[ $if_match -eq 1 ]]
then
  integer i=$n+1
else
  integer i=$i+1
fi

done
# END OF BIG WHILE LOOP

if [[ $if_match -eq 1 ]] 
then 
  echo $target_item
else
  echo "error: no match found"
fi