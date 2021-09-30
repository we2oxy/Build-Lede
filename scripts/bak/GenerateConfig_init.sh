#!/bin/bash


fun_GitSource(){
	echo "\n-----GitSource start-----\n"
	df -hP
	mkdir -pv /home/runner/upload/
	cd "/home/runner/"
	sudo chown -R runner:runner upload/ 
	df -hP
	echo "\n-----GitSource successful-----\n"
}
 
fun_GitSource

