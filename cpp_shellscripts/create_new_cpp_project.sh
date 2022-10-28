#!/bin/zsh
 
###########################################################
# function to create a new c++ project.
# - adds specific folders to new project 
#----------------------------------------------------
# INPUT:
# - project_name: string
# - tag (OPTIONAL): string [i.e. -sdl adds sdl to project]
###########################################################
 

# get project name from input
project_name=$1;
tag=$2;

# plug in default project location (ordinary project)
proj_location='/Users/charlieporto/realshit/cppstuff/templates/OrdinaryProjectTemplate';


# check for tag and adjust template project if necessary
if [[ $tag ]]
then
  if [[ "$tag" == "-sdl_ecs" ]]
  then
    proj_location="/Users/charlieporto/realshit/cppstuff/templates/SdlProjectsWithEntityComponentSystem/SdlProjectWithEcs";
  fi;
  # if [[ "$tag" == "-sdl" ]]
  # then
    # proj_location="/Users/charlieporto/realshit/cppstuff/templates/OrdinarySdlProject";
  # fi;
fi;

# move folder to new current location and give it the project name
cp -r $proj_location $PWD/$project_name
echo "new cpp project created: $project_name"


