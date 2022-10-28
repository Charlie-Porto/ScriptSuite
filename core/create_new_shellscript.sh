#!/bin/zsh

###########################################################
# this script creates a new shell script file. trippy.
# ----------------------------------------------------
# INPUT:
# 	string: filename (include the ".sh" for good practice)
###########################################################

filename=$1;

touch $filename;	

local put() {echo $1 >> $filename;}

put "#!/bin/zsh";
put " ";
put "###########################################################";
put "# explained_by_title";
put "#----------------------------------------------------";
put "# INPUT:";
put "# ";
put "###########################################################";
put " ";
put "# imports ";
put " ";
put "# get input array and count of input array";
put "argv=("\$\@");"
put "argc=\${#argv};"
put " ";
put "# assign varibles ";
put "var=\${argv[1]}";
put " ";
