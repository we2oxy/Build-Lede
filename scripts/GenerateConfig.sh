#!/bin/bash


function fun_lede_n1(){
	echo "$FUNCNAME action"
	cd /build/lede-N1
	make defconfig
	./scripts/diffconfig.sh > /build/buildinfo/N1-openwrt.buildinfo
	cat /build/buildinfo/N1-openwrt.buildinfo
	echo "$FUNCNAME successful"
}

function fun_lede_R2S(){
	echo "$FUNCNAME action"
	cd /build/lede-R2S
	make defconfig
	./scripts/diffconfig.sh > /build/buildinfo/R2S-lede.buildinfo
	cat /build/buildinfo/R2S-lede.buildinfo
	echo "$FUNCNAME successful"
}

function fun_lede_x64(){
	echo "$FUNCNAME action"
	cd /build/lede-x64
	make defconfig
	./scripts/diffconfig.sh > /build/buildinfo/x86-lede.buildinfo
	cat /build/buildinfo/x86-lede.buildinfo
	echo "$FUNCNAME successful"
}

function fun_lede_1701(){
	echo "$FUNCNAME action"
	cd /build/lede-1701
	make defconfig
	./scripts/diffconfig.sh > /build/buildinfo/x86-lede-1701.buildinfo
	cat /build/buildinfo/x86-lede-1701.buildinfo
	echo "$FUNCNAME successful"
}

function fun_md5_ck(){
	ls -lh /build/buildinfo/*
	md5sum /build/buildinfo/*.buildinfo
}

fun_lede_n1
fun_lede_R2S
fun_lede_x64
fun_lede_1701
fun_md5_ck







