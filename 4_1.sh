#!/bin/bash
if [ -f $1 ] ; then
	file=$1
	if [[ $file == *.tar.bz2  ]]; then
		tar xjf $file	
	elif [[ $file == *.tar.gz  ]]; then
		tar xzf $file
	elif [[ $file == *.tar.xz  ]]; then
		tar -xf $file
	elif [[ $file == *.rar  ]]; then
		rar x $file
	elif [[ $file == *.gz  ]]; then
		gunzip $file
	elif [[ $file == *.bz2  ]]; then
		bunzip2 $file
	elif [[ $file == *.tar  ]]; then
		tar xf $file
	elif [[ $file == *.tgz  ]]; then
		tar xzf $file
	elif [[ $file == *.tbz2  ]]; then
		tar xjf $file
	elif [[ $file == *.zip  ]]; then
		unzip $file
	elif [[ $file == *.xz  ]]; then
		xz -d $file
	elif [[ $file == *.Z  ]]; then
		uncompress $file
	elif [[ $file == *.jar  ]]; then
		jar xvf $file
	else
		echo "Cannot Extract contents of" $file
	fi
else
	echo $1 " doesn't exist OR is not a compressed file"
fi