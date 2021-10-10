#!/bin/bash






fun_Check(){
	cd /home/runner/upload/
	ls -lash
	sed -i '/is not set/d' *.txt
	sed -i '/is not set/d' *.buildinfo
	wc -l ./*
	sha1sum ./*
}



fun_Generate_
fun_Generate_
fun_Generate_
fun_Generate_
fun_Generate_
fun_Check
