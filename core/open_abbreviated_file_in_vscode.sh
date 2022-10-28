#!/bin/zsh
 
###########################################################
# explained_by_title
#----------------------------------------------------
# INPUT:
# string: file name
###########################################################
 
# get input array and count of input array
argv=($@);
argc=${#argv};
 
# assign varibles 
a=${argv[1]}


integer l=${#a}+1
p=(*)

integer n=${#p}+1
target_item=$a;
integer if_match=0	

integer i=1
while ((i < n))
do
  c=$p[$i]
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
  echo "opening: " $target_item
  code $target_item
else
  echo "error: no match found"
fi


 
