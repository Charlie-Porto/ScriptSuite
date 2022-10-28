#!/bin/zsh
 
###########################################################
# creates ecs component cpp file
#----------------------------------------------------
# INPUT:
# filename: string
###########################################################

input_array=("$@");

# assign vars
new_file_name="${input_array[1]}";
new_struct_name="${(C)input_array[1]}";
full_file_name="${new_file_name}_component.cpp";
define_header="${new_file_name}_component_cpp";

# create file
touch $full_file_name;

# embellish file
local put() {echo $1 >> $full_file_name}
put "#ifndef $define_header"
put "#define $define_header"
put ""
put ""
put "namespace pce {"
put ""
put "struct $new_struct_name {"
put "};"
put ""
put "}"
put ""
put "#endif /* $define_header */"


# alert job is done
echo "Successfully created new c++ file: $full_file_name";
