#!/bin/bash
# ./4_4.sh ~/dir/dir2 all ---------this will move all extensions files
# ./4_4.sh ~/dir/dir2     ---------this will move all extensions files
# ./4_4.sh ~/dir/dir2 mp4    ---------this will move all mp4 files
# ./4_4.sh ~/dir/dir2 mp4 txt doc    --this will move mp4 txt doc files in corresp

#this function check if given argument is valid directory
checkDir(){
	if [[ -e $1 ]] && [[ -d $1 ]]; then
		echo "1"
	else
		echo "0"
	fi
}

#this function check wheather to move all files or files with extentions given
traverseDir(){
	# echo "Entered Directory: " $1
	if [[ -z $2 ]] || [[ "$2" == "all" ]] ; then
		moveAll $@
	else
		moveSelected $@
	fi
}

#This function moves files whose extensions are provided as argument
moveSelected(){
	# echo "moveSelected"
	dir=$1"/*"
	for i in $@; do
		if [[ $i == $1 ]]; then
			continue
		fi
		for file in $dir ; do

			if [[ -f $file ]]; then
				#removing / by prefix end by /
				tmp=${file#*\/}
				#get extension
				ext=${tmp##*.}
				ext=${ext^^}
				i=${i^^}
				if [[ "$ext" == "$i" ]]; then
					#get filename
					filename="${tmp%.*}"
					#uppercase
					filename=${filename^^}
					if [[ "$filename" != "$ext" ]]; then
						if [[ -e $1/$ext ]]; then
							$(mv $file $1/$ext)
						else
							$(mkdir $1/$ext)
							$(mv $file $1/$ext)
						fi
					fi	
				fi
			fi
		done
	done		
}

#This function moves all files in corresponding extension folder
moveAll(){
	# echo "move"
	dir=$1"/*"
	for file in $dir ; do
		if [[ -f $file ]]; then
			#removing / by prefix end by /
			tmp=${file#*\/}
			#get extension
			ext=${tmp##*.}
			#uppercase
			ext=${ext^^}
			#get filename
			filename="${tmp%.*}"
			#uppercase
			filename=${filename^^}
			# echo $ext
			# echo $filename
			if [[ "$filename" != "$ext" ]]; then
				if [[ -e $1/$ext ]]; then
					$(mv $file $1/$ext)
				else
					$(mkdir $1/$ext)
					$(mv $file $1/$ext)
				fi
			fi
		fi
	done
}

noOfArs=$#
if [[ $noOfArs -eq 0 ]]; then
	echo "Please provide directory path"
	exit
fi
if [[ $noOfArs -eq 1 ]]; then
	ret=$(checkDir $1)
	if [[ "$ret" != "1" ]]; then
		echo $1 "directory not exists "	
		exit 0
	fi
	if [[ ret -eq 1 ]]; then
		traverseDir $@ 
	fi
fi
if [[ $noOfArs -ge 2 ]]; then
	ret=$(checkDir $1)
	# echo $ret
	if [[ "$ret" != "1" ]]; then
		echo $1 "directory not exists "	
		exit 0
	fi
	traverseDir $@
fi