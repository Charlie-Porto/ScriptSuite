#!/bin/zsh
 
###########################################################
# creates cpp file for benchmarking a function
#----------------------------------------------------
# INPUT:
# string: function name (a.k.a. file name): string
# string: function namespace 
# int: argc
###########################################################
 
input_array=("$@");

# assign vars
function_name="${input_array[1]}";
namespace="${input_array[2]}";
argc=${input_array[3]};

file_namespace_name="bmark_${function_name}";
full_file_name="bmark_${function_name}.cpp";
define_header="bmark_${function_name}_cpp";

# create file
touch $full_file_name;

# embellish file
local put() {echo $1 >> $full_file_name}
put "#ifndef $define_header"
put "#define $define_header"
put ""
put "#include <gtest/gtest.h>"
put "#include <benchmark/benchmark.h>"
put ""
put "namespace kbmark {"
put "namespace ${file_namespace_name} {"
put ""

integer i=0;
integer num_cases_plus_one=4;
char_list=("a" "b" "c" "d" "e");
integer count=${input_array[3]}

while ((i < num_cases_plus_one))
do
  args="";
  integer j=0; 
  while ((j < count))
  do
    put "//auto bm${char_list[$i+1]}_${char_list[$j+1]} = ;"
    args+="bm${char_list[$i+1]}_${char_list[$j+1]}, "
    j+=1; 
  done;
  put ""
  put "// static void BM_${function_name}_A(benchmark::State& state) {"
  put "//  for (auto _ : state) {"
  put "//    ${namespace}"::"${function_name}(${args});"
  put "//  }"
  put "//}"
  put "//BENCHMARK(BM_${function_name}_A);"
  put ""
  put ""
  
  i+=1;
done;

put ""
put "}"
put "}"
put "#endif /* $define_header */"

# alert job is done
echo "Successfully created new c++ function benchmarking file: $full_file_name";
