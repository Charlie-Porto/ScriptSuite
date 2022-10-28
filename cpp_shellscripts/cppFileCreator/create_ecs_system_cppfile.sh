#!/bin/zsh
 
###########################################################
# creates a cpp module for an ECS system.
#----------------------------------------------------
# INPUT:
# ecs system name (all caps)
###########################################################
input_array=("$@");
 
system_name=${input_array[1]};
system_name_expanded="${system_name}System";
full_file_name="${system_name_expanded}.cpp"
define_header="${system_name_expanded}_cpp"

# create file
touch $full_file_name;

# embellish file
local put() {echo $1 >> $full_file_name}
put "#ifndef $define_header"
put "#define $define_header"
put ""
put "/*----------------------------------------------------------------|"
put "--------------------- Module Description -------------------------|"
put ""
put "-----------------------------------------------------------------*/"
put ""
put "#include <ezprint.cpp>"
put ""
put '#include "../System.cpp"';
put ""
put "extern ControlPanel control;";
put ""
put "namespace pce{"
put "class ${system_name_expanded} : public ISystem {";
put "public:"
put ""
put "void UpdateEntities() {"
put "  for (auto const& entity : entities) {"
put ""
put "  }"
put "}"
put ""
put "private:"
put "};"
put "}"
put "#endif /* $define_header */"


# alert job is done
echo "Successfully created new c++ file: $full_file_name";

