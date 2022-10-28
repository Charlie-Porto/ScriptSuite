#!/bin/zsh
 
###########################################################
# creates cpp file for implementing a specific header file
#----------------------------------------------------
# INPUT:
# filename: string
###########################################################

input_array=("$@");

# assign vars
new_file_name="${input_array[1]}";
full_file_name="${new_file_name}.cpp";
define_header="${new_file_name}_cpp";

# create file
touch $full_file_name;

# embellish file
local put() {echo $1 >> $full_file_name}
put "#ifndef $define_header"
put "#define $define_header"
put ""
put "#include \"${new_file_name}.hpp\"";
put ""
put ""
put ""
put ""
put "#endif /* $define_header */"


# alert job is done
echo "Successfully created new c++ file: $full_file_name";
