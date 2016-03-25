#!/bin/bash

# start the script with a dot and a space in front, if you want to
# switch to the working directory of your project (I prefer this method):
# ~$ . ./start_project.sh

# dependencies:
# gcc
# wget
# make
# any terminal-based editor

DELAY=0.5;

# change these to your preferred
# working directory and editor:
export WORKING_DIR="$HOME";
export EDITOR="vi";

cd $WORKING_DIR/;

if [ ! -f $WORKING_DIR/.generic_Makefile ];
then
	# this loads a simple generic Makefile
	wget http://kroovy.de/files/.generic_Makefile;
fi

if [ $# -eq 0 ];
then
	if [ ! -f $WORKING_DIR/.project_counter.txt ];
	then
		echo -n 0 > $WORKING_DIR/.project_counter.txt;
	fi
	projectNumber=`cat $WORKING_DIR/.project_counter.txt`;
	projectNumber=$((projectNumber + 1));
	echo -n $projectNumber > $WORKING_DIR/.project_counter.txt;
	echo "";
	echo "> project number getting increased by +1...";
	sleep $DELAY;
	if [ $projectNumber -lt 10 ];
	then
		
		mkdir project_0$projectNumber;
		echo "> project folder \"project_0$projectNumber\" getting created...";
		sleep $DELAY;
		
		cd project_0$projectNumber;
	else
		
		mkdir project_$projectNumber;
		echo "> project folder \"project_$projectNumber\" getting created...";
		sleep $DELAY;
		
		cd project_$projectNumber;
	fi
	
else
	
	mkdir $1;
	echo "";
	echo "> project folder \"$1\" getting created...";
	sleep $DELAY;
	
	cd $1;
	
fi

cp $WORKING_DIR/.generic_Makefile ./Makefile
mkdir include src;
echo "> creating sub-folders \"include/\", \"src/\"...";
sleep $DELAY;
cd src;
touch main.c;
echo "> creating main.c file...";
sleep $DELAY;

cd ../;
echo "> chainging directory to \"`pwd`\"...";
sleep $DELAY;

echo -n "#include <stdio.h>" > src/main.c;

$EDITOR src/main.c;
clear; pwd; ls;
