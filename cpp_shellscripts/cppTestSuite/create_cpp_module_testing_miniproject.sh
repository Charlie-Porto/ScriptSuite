#!/bin/zsh
 
###############################################################
# creates a mini project purposed for testing a specific cpp file 
#----------------------------------------------------
# INPUTs:
# function name (string)
###########################################################

input_array=("$@");

# assign vars
new_file_name="${input_array[1]}";
file_namespace_name="test_${new_file_name}";
full_file_name="${new_file_name}.cpp";
define_header="test_${new_file_name}_cpp";

# copy the make file over
template_path="/Users/charlieporto/realshit/cppstuff/templates/PackageTestingTemplate";
cp -r $template_path "$PWD/$file_namespace_name";
cd "$PWD/$file_namespace_name";

# create file
cd "$PWD/test";
touch main.cpp;

# embellish file
local put() {echo $1 >> main.cpp}
put "#ifndef main_cpp"
put "#define main_cpp"
put ""
put "#include <gtest/gtest.h>"
put "#include <ezprint.cpp>"
put "#include \"../../../${full_file_name}\""
put ""
put ""
put ""
put "auto ta_a = ;"
put "auto ta_b = ;"
put "auto result_a = pce::math::${new_file_name}(ta_a, ta_b);"
put "auto cr_a = ;"
put "TEST(test_${new_file_name}, case1) {"
put "  ASSERT_EQ(cr_a, result_a);"
put "}"
put ""
put "auto tb_a = ;"
put "auto tb_b = ;"
put "auto result_b = pce::math::${new_file_name}(tb_a, tb_b);"
put "auto cr_b = ;"
put "TEST(test_${new_file_name}, case2) {"
put "  ASSERT_EQ(cr_b, result_b);"
put "}"
put ""
put "auto tc_a = ;"
put "auto tc_b = ;"
put "auto result_c = pce::math::${new_file_name}(tc_a, tc_b);"
put "auto cr_c = ;"
put "TEST(test_${new_file_name}, case3) {"
put "  ASSERT_EQ(cr_c, result_c);"
put "}"
put ""
put "auto td_a = ;"
put "auto td_b = ;"
put "auto result_d = pce::math::${new_file_name}(td_a, td_b);"
put "auto cr_d = ;"
put "TEST(test_${new_file_name}, case4) {"
put "  ASSERT_EQ(cr_d, result_d);"
put "}"
put ""
put "auto te_a = ;"
put "auto te_b = ;"
put "auto result_e = pce::math::${new_file_name}(te_a, te_b);"
put "auto cr_e = ;"
put "TEST(test_${new_file_name}, case5) {"
put "  ASSERT_EQ(cr_e, result_e);"
put "}"
put ""
put "int main(int argc, char** argv) {"
put "  testing::InitGoogleTest(&argc, argv);"
put "  return RUN_ALL_TESTS();"
put ""
put "  // return 0;"
put "}"
put ""
put "#endif /* main_cpp */"


# alert job is done
echo "Successfully created new c++ function testing file: $full_file_name";

