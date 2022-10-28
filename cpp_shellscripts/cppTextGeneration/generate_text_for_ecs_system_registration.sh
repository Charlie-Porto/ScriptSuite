#!/bin/zsh
 
###########################################################
# creates cpp code to register an ecs system
#----------------------------------------------------
# INPUT:
# system name, component names
###########################################################
 
# get input array and count of input array
input_array=("$@");
argc=${#input_array};

# assign variables
system_name=${input_array[2]};
caps_system_name=${(C)input_array[2]};
integer num_components=$argc+1;

# create temp file and add inputs
touch tempfile.txt; local put() {echo $1 >> tempfile.txt}
put "auto ${system_name}_system = control.RegisterSystem<pce::${caps_system_name}System>();"
put "Signature ${system_name}_sig;"

integer i=3;
# echo $num_components;
while ((i < num_components))
do
  # echo $i;
  put "${system_name}_sig.set(control.GetComponentType<pce::${input_array[${i}]}>());";
  i+=1;
done;
put "control.SetSystemSignature<pce::${caps_system_name}System>(${system_name}_sig);";

pbcopy < tempfile.txt;
rm tempfile.txt;
