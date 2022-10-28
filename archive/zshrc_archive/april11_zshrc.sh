# path manip stuff
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Users/charlieporto/.local/bin:$PATH"


eval "$(pyenv init --path)"

#=================== Aliases ===================#
alias editalii='code ~/.zshrc'
alias copycd="echo ${PWD} | pbcopy"

# std alias lib
alias cls="clear; ls"

# d20
export ENV=dev
alias pop="echo 959-328-440 | pbcopy"
alias eldia='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/eldia.txt'
alias prnotes='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/pr_notes/prnotes.txt'
alias bestvim='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/bestvim.txt'
alias bestunix='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/bestunix.txt'
alias vuenotes='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/vuenotes.txt'
alias cdeldia='prevcd=$PWD; cd /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes'
alias manana='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/manana.txt'
alias scrum='vim /Users/charlieporto/realshit/telematics/meeting_notes/daily_notes/scrum.txt'
alias calendar="open https://calendar.google.com/calendar";
alias setb='prevcd=$PWD;'
alias gb='return_to_prevcd'
alias jsnotes='vim /Users/charlieporto/realshit/js_stuff/react_learning/jsnotes.txt'
alias vncss='code /Users/charlieporto/realshit/telematics/code/python_projs/chapter2/vimbus/vue_nimbus/src/assets/css/nimbus_custom.css'
alias tessocr="/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/ifta_study/scripts/./read_pdf_to_txt.sh"
alias pdfsep="/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/ifta_study/scripts/./separate_pdf_tosingle_pages.sh"
alias mpdfsep="/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/ifta_study/scripts/./separate_multiple_pdfs.sh"

# git
alias gitpdf='open ~/realshit/telematics/gitstuff/git-cheat-sheet-education.pdf'

# VS code
alias code='open -a "Visual Studio Code"'

# python stuff
alias pipenrp='pipenv run python'

# c++ stuff
alias comp='compcpp sim_runner.cpp main -sdl'
alias compt='compcpp playground.cpp main'
alias compf='comp; ./main.o'
alias cdcpp='cd ~/realshit/cppstuff; ls'
alias specs='vim /Users/charlieporto/realshit/cppstuff/games_SDL2/pre_2021_games/avoidance/specs/leaderboard_specs.txt'

# for getting info about javascript: 
alias jsinfo="open https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_Types"
alias react_info="open https://reactjs.org/docs/react-api.html"

# for going to common places
alias cddesktop="cd ~/Desktop"

# open directory in finder
oif () {
	current_dir=$PWD;
	cd ../;
	open $current_dir;
	cd $current_dir;
}

# get clean path for list
clean_path() {	
	# Params
	a=$1
	b=${a:t}
	echo $b
}
	
# automatically move template files
getcpptemplate()
{
	# Params
	a=$1; #item to grab
	b="null"; #specifier folder null unless specified

	# check if folder specifier input exists (i.e. tools)
	if [[ $2 ]]; then b=$2; fi;
	
	# Variables
	current_dir=$PWD;
	cd "/Users/charlieporto/realshit/cppstuff/templates";
	m=(*/*.cpp);
	p=(*/*.cpp);

	# n_m is equal to count of cpp files in templates folder
	n_m=${#m}+1;	
	
	# clean one of the lists for name matching
	integer i=1;
	while ((i < n_m))
	do
		m[$i]=$(clean_path $m[$i]);
		i+=1;
	done

	# check if asking for info
	if [[ "$a" == "info" ]]
	then
		echo 'cleaned list: ';
		echo $m;
	fi

	match=$(get_match $a $m -i);
	item_relpath=$p[$match];

	# copy and move item
	cp $item_relpath $current_dir;
	cd $current_dir;

	if [[ "$b" == "-t" ]] # if target is tools folder 
	then
		mv $m[$match] tools/{$m[$match]};
	fi
	
	#say it worked
	echo "$m[$match] moved to project";
}	


# manually move template files
movecpptemplate () {
	current_dir=$PWD
	oif;
	cd ; cda real; cda cpp; open templates
	cd $current_dir;
}


#-------------------- Compile c++ file to a target file --------------------------
compcpp () {		#(comp_file, make_file, tag)
	# Parameters: 
	comp_file=$1	# file being compiled
	make_file=$2	# make file (target file)
	tag=$3			# custom tag; i.e. sdl (includes SDL library for compiling)
	
	comp_command="g++ ${comp_file} -std=c++17 -o ${make_file}.o"
	if [[ $tag ]]
	then
	if [[ "$tag" == "-sdl" ]]
	then
		comp_command+=" -I include -L lib -l SDL2-2.0.0 -l SDL2_image-2.0.0"
	fi
	fi
	
	${(z)comp_command}
}


touchcpp () {		#(new_file_name, spec)
	# Parameters:
	newfile=$1		# name of .cpp file being created
	spec=$2 		# sdl? random?
	if_spec=0		# 1 if specs

	fullname="$newfile.cpp"
	touch $fullname
	defname="$newfile"
	defname+=_cpp

	mac1="#ifndef $defname"
	mac2="#define $defname"
	mac3="#endif /* $defname */"
	sdl1=''
	sdl2=''

	if [[ "$spec" == "sdl" ]]
	then
		if_spec=1
		sdl1='#include <SDL2_include/SDL2/SDL.h>'
		sdl2='#include <SDL2_include/SDL2/SDL_image.h>'
	fi

	local put() {echo $1 >> $fullname}

	put $mac1
	put $mac2
	put ""

	if [[ "$if_spec" == "1" ]]
	then 
		put $sdl1
		put $sdl2
	fi


	put ""
	put "/*----------------------------------------------------------------|"
	put "--------------------- Module Description -------------------------|"
	put ""
	put "-----------------------------------------------------------------*/"


	put ""
	put ""
	put ""
	put ""
	put ""
	put ""
	put $mac3

	echo "Successfully created new c++ file: $fullname"
}

# make .cpp testfile
testcpp() {
	a="test.cpp"
	touch $a
	echo '#include <iostream>' >> $a
	echo 'int main() {' >> $a
	echo '' >> $a
	echo ''>> $a
	echo 'std::cout << ' >> $a
	echo ' >> std::endl;' >> $a
	echo '	return 0;' >> $a
	echo '}' >> $a
	
	nano test.cpp
}

endcpptest() {
	rm test.cpp
	rm testexe.o
	
	echo 'success: test files deleted.'
}

# comp + run testfile
compft() {
	echo 'compiling test file'
	compcpp test.cpp testexe;
	f='./testexe.o'
	${(v)f}
}
	

return_to_prevcd() {
	cd $prevcd
}

cdz () {
	cd ../
	ls
}
cdzz () {
	cd ../
	cd ../
	ls
}
cdzzz () {
	cd ../
	cd ../
	cd ../
	ls
}
cdzzzz () {
	cd ../
	cd ../
	cd ../
	cd ../
	ls
}
cdzzzzz () {
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	ls
}
cdzzzzzz () {
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	ls
}
cdzzzzzzz () {
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	cd ../
	ls
}

# can now take 10 inputs
cda () {
	#Parameters
	x1=$1
	items=("$x1")
	integer cnt=2;
	x2="null"
	x3="null"
	x4="null"
	x5="null"
	x6="null"
	x7="null"
	x8="null"
	x9="null"
	x10="null"
	journey="-";
	
	# assign other input variables, if they exist (currently 10 maximum)
	if [[ $2 ]]; then x2=$2; items+=("$x2"); cnt+=1; fi;
	if [[ $3 ]]; then x3=$3; items+=("$x3"); cnt+=1; fi;
	if [[ $4 ]]; then x4=$4; items+=("$x4"); cnt+=1; fi;
	if [[ $5 ]]; then x5=$5; items+=("$x5"); cnt+=1; fi;
	if [[ $6 ]]; then x6=$6; items+=("$x6"); cnt+=1; fi;
	if [[ $7 ]]; then x7=$7; items+=("$x7"); cnt+=1; fi;
	if [[ $8 ]]; then x8=$8; items+=("$x8"); cnt+=1; fi;
	if [[ $9 ]]; then x9=$9; items+=("$x9"); cnt+=1; fi;
	if [[ $10 ]]; then x10=$10; items+=("$x10"); cnt+=1; fi;

	integer k=1;
	while ((k < cnt))
	do
		a=${items[$k]}
		#variables
		integer l=${#a}+1
		p=(*)

		integer n=${#p}+1
		target_item=${items[$k]};
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
			i+=$n
		else
			i+=1
		fi

		done
		# END OF SECOND LAYER WHILE LOOP

		if [[ $if_match -eq 1 ]] 
		then 
			journey+=("--->  $target_item   ")
			cd $target_item
		else
			echo "error: no match found"
			k=$cnt
			break
		fi
	k+=1
	done
	# END OF TOP LAYER WHILE LOOP
	echo ${journey}
	ls
}

# start at code, go from there 
cdcod () {
	#Parameters
	x1=$1
	items=("$x1")
	integer cnt=2;
	x2="null"
	x3="null"
	x4="null"
	x5="null"
	x6="null"
	x7="null"
	x8="null"
	x9="null"
	x10="null"
	journey="--->  code  ";

	cd ~/realshit/telematics/code
	
	#assign other input variables, if they exist (currently 6 maximum)
	if [[ $2 ]]; then x2=$2; items+=("$x2"); cnt+=1; fi;
	if [[ $3 ]]; then x3=$3; items+=("$x3"); cnt+=1; fi;
	if [[ $4 ]]; then x4=$4; items+=("$x4"); cnt+=1; fi;
	if [[ $5 ]]; then x5=$5; items+=("$x5"); cnt+=1; fi;
	if [[ $6 ]]; then x6=$6; items+=("$x6"); cnt+=1; fi;
	if [[ $7 ]]; then x7=$7; items+=("$x7"); cnt+=1; fi;
	if [[ $8 ]]; then x8=$8; items+=("$x8"); cnt+=1; fi;
	if [[ $9 ]]; then x9=$9; items+=("$x9"); cnt+=1; fi;
	if [[ $10 ]]; then x10=$10; items+=("$x10"); cnt+=1; fi;

	integer k=1;
	while ((k < cnt))
	do
		a=${items[$k]}
		#variables
		integer l=${#a}+1
		p=(*)

		integer n=${#p}+1
		target_item=${items[$k]};
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
			i+=$n
		else
			i+=1
		fi

		done
		# END OF BIG WHILE LOOP
		
		if [[ $if_match -eq 1 ]] 
		then 
			journey+=("--->  $target_item   ")
			cd $target_item
		else
			k=$cnt
			break
		fi
	k+=1
	done
	echo $journey
	ls
}


oa () {
	#Parameters
	a=$1
	
	#variables
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
		open $target_item
	else
		echo "error: no match found"
	fi
}


cata () {
	#Parameters
	a=$1
	
	#variables
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
		echo '_______________________________________________________________' 
		cat $target_item
		echo '==============================================================='
	else
		echo "error: no match found"
	fi
}

# functions for journal
makejournal() {
	cd ~/Desktop/new_journal/english;
	journal_date=$(date);
	date_name=$(date '+%Y-%m-%d')
	doc_name="journal_$date_name.txt";
	touch $doc_name;
	echo "$journal_date" >> $doc_name;
	open $doc_name;
}






coda () {
	#Parameters
	a=$1
	
	#variables
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
}

vima () {
	#Parameters
	a=$1
	
	#variables
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
		echo "opening in vim: " $target_item
		vim $target_item
	else
		echo "error: no match found"
	fi
}
# return match from list 
get_match(){

	#Parameters
	local s_item=$1;
	local s_list=(${2[@]});
	local item_to_grab=$3;
	echo item: $s_item;
	echo "list: ${s_list[@]}";
	
	#variables
	local integer l=${#s_item}+1
	local integer n=${#s_list}+1

	local target_item=$s_item;
	local integer if_match=0	
	
	local integer i=1
	while ((i < n))
	do
		c=$s_list[$i]
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
					if [[ "$item_to_grab" == "-i" ]]
					then
						target_item=$i;
					fi
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
		echo $target_item
	else
		echo "no match"
	fi
}

# color formatting

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}


COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '
COLOR_DIR='%F{64}'

# run main file
# purpose: runs a specific command based on the current directory
rmf()
{
	# check if tag attached (only tag as of right now: 'info' -- prints command that'll be run
	a="null";
	if [[ $1 ]]; then a=$1; fi; 

	# MAP COMMANDS TO DIRECTORIES
	rmf_key_map=(
		# if no match
		"n/a" "echo no_match" 

		# run vue_nimbus 
		"/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/vimbus/vue_nimbus" "npm run serve"

		"/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/exploration" "npm run serve"

		# open fX.html (javascript practice)
		"/Users/charlieporto/realshit/js_stuff/react_learning/f4" "open f4.html" 
		"/Users/charlieporto/realshit/js_stuff/react_learning/f5" "open f5.html" 
		"/Users/charlieporto/realshit/js_stuff/react_learning/f6" "open f6.html" 

		# run nimbus
		"/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/nimbus/django_nimbus" "pipenv run python manage.py runserver 192.168.0.154:8080"

		# run nimbus test
		"/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/testing_nimbus" "pipenv run python testnimbus.py"

		# cpp stuff
		"/Users/charlieporto/realshit/cppstuff/games_SDL2/snake_with_esc" "./main.o"
	)

	current_dir=$PWD;
	integer rmf_map_count=${#rmf_key_map};
	integer i=1;
	integer command_index=2;

	while ((i<rmf_map_count))
	do
		# check if match
		if [[ "$current_dir" == "${rmf_key_map[$i]}" ]]
		then
			integer command_index=$i+1;
			break;
		fi
		# increment i
		i+=2;
		
	done
	# end of primary while loop (above)

	command="${rmf_key_map[$command_index]}"

	if [[ "$a" == "info" ]]
	then
		echo "command to be run: $command";
	else
		echo "running command: $command";
		${(z)command};
	fi
}



#============== colors and whatnot =============#

rotate_eldia () {

	date_name=$(date '+%Y-%m-%d');
	doc_name="ndaily_${date_name}.txt";	

	mv eldia.txt "ndaily/${doc_name}";
	mv manana.txt eldia.txt;
	touch manana.txt;
}

rotate_scrum () {

	date_name=$(date '+%Y-%m-%d');
	doc_name="dscrum_${date_name}.txt";	

	mv scrum.txt "scrumdaily/${doc_name}";
	touch scrum.txt;
	echo "============ yesterday ============" >> scrum.txt;
	echo " " >> scrum.txt;
	echo "============== today ==============" >> scrum.txt;
	vim scrum.txt;
}

touchvue () {
	touch $1;
	echo "<script>" >> $1
	echo "export default {" >> $1
	echo " " >> $1
	echo "}" >> $1
	echo " " >> $1
	echo "</script>" >> $1

	echo " " >> $1
	echo " " >> $1
	echo " " >> $1
	echo " " >> $1
	
	echo "<template>" >> $1
	echo "<div>" >> $1
	echo " " >> $1
	echo "</div> " >> $1
	echo "</template>" >> $1

	echo " " >> $1
	echo " " >> $1
	echo " " >> $1
	echo " " >> $1

	echo "<style>" >> $1
	echo "</style>" >> $1
	
}


cdgo () {

	# MAP KEYS TO DIRECTORIES
	cdl_key_map=(
		# if no match
		"n/a" "echo no_match" 

		# d20 
		"cod" "/Users/charlieporto/realshit/telematics/code/python_projs/chapter2"
		"vimbus" "/Users/charlieporto/realshit/telematics/code/python_projs/chapter2/vimbus"

		# cpp
		"cpp" "/Users/charlieporto/realshit/cppstuff"
	);

	start_dir=$1;
	integer cdl_map_count=${#cdl_key_map};
	integer i=1;
	integer command_index=2;

	while ((i<cdl_map_count))
	do
		# check if match
		if [[ "$start_dir" == "${cdl_key_map[$i]}" ]]
		then
			integer command_index=$i+1;
			break;
		fi
		# increment i
		i+=2;
		
	done

	command="${cdl_key_map[$command_index]}"
	cd ${command};
}

cal () {
	#Parameters
	x1=$1
	items=()
	integer cnt=1;
	x2="null"
	x3="null"
	x4="null"
	x5="null"
	x6="null"
	x7="null"
	x8="null"
	x9="null"
	x10="null"
	journey="===> ${x1}";

	cdgo $1
	
	# assign other input variables, if they exist (currently 10 maximum)
	if [[ $2 ]]; then x2=$2; items+=("$x2"); cnt+=1; fi;
	if [[ $3 ]]; then x3=$3; items+=("$x3"); cnt+=1; fi;
	if [[ $4 ]]; then x4=$4; items+=("$x4"); cnt+=1; fi;
	if [[ $5 ]]; then x5=$5; items+=("$x5"); cnt+=1; fi;
	if [[ $6 ]]; then x6=$6; items+=("$x6"); cnt+=1; fi;
	if [[ $7 ]]; then x7=$7; items+=("$x7"); cnt+=1; fi;
	if [[ $8 ]]; then x8=$8; items+=("$x8"); cnt+=1; fi;
	if [[ $9 ]]; then x9=$9; items+=("$x9"); cnt+=1; fi;
	if [[ $10 ]]; then x10=$10; items+=("$x10"); cnt+=1; fi;

	integer k=1;
	while ((k < cnt))
	do
		a=${items[$k]}
		#variables
		integer l=${#a}+1
		p=(*)

		integer n=${#p}+1
		target_item=${items[$k]};
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
			i+=$n
		else
			i+=1
		fi

		done
		# END OF BIG WHILE LOOP
		
		if [[ $if_match -eq 1 ]] 
		then 
			journey+=("--->  $target_item   ")
			cd $target_item
		else
			k=$cnt
			break
		fi
	k+=1
	done
	echo $journey
	ls
}