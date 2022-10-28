#!/bin/zsh
 
###########################################################
# creates cpp file for testing a function
#----------------------------------------------------
# INPUT (3):
# String: function name
# String: namespace 
# Int: argc
###########################################################
 
input_array=("$@");
argc=${#input_array}

# assign vars
function_name="${input_array[1]}";
namespace="${input_array[2]}"

file_namespace_name="test_${function_name}";
full_file_name="test_${function_name}.cpp";
define_header="test_${function_name}_cpp";

# create file

# embellish file
local put() {echo $1 >> $full_file_name}
put "#ifndef $define_header"
put "#define $define_header"
put ""
put "#include <gtest/gtest.h>"
put ""
put "namespace ktest {"
put "namespace ${file_namespace_name} {"
put ""
put ""

integer i=0;
integer num_cases_plus_one=4;
char_list=("a" "b" "c" "d" "e");
integer count=${input_array[3]}
echo $count

# make each test case boilerplate via loop
while ((i < num_cases_plus_one))
do
  args="";
  integer j=0; 
  while ((j < count))
  do
    put "//auto t${char_list[$i+1]}_${char_list[$j+1]} = ;"
    args+="t${char_list[$i+1]}_${char_list[$j+1]}, "
    j+=1; 
  done;

  put "//auto result_${char_list[$i+1]} = ${namespace}::${function_name}(${args});"
  put "//auto cr_${char_list[$i+1]} = ;"
  put ""
  put "//TEST(test_${function_name}, case${i+1}) {"
  put "//ASSERT_EQ(cr_${char_list[$i+1]}, result_${char_list[$i+1]});"
  put "//}"
  put ""
  put ""
  
  i+=1;
done;

put ""
put ""
put ""
put ""
put ""
put ""
put ""
put "}"
put "}"
put "#endif /* $define_header */"


# alert job is done
echo "Successfully created new c++ function testing file: $full_file_name";
