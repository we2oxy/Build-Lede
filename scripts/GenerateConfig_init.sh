#!/bin/bash

function fun_addluciapp(){
	echo "$FUNCNAME action"
	rm -rf tmp/
	echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default
	echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
	cat -n feeds.conf.default
	rm -rf package/lean/luci-theme-argon
	git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
	git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
	git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
	git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner package/lean/luci-app-onliner
	git clone --depth=1 -b master https://github.com/vernesong/OpenClash package/lean/OpenClash
	./scripts/feeds update -a
	./scripts/feeds install -a
	echo "$FUNCNAME successful"
}

function fun_N1(){
	echo "$FUNCNAME action"
	git clone https://github.com/coolsnowwolf/lede.git /build/lede-N1
	cd /build/lede-N1
	fun_addluciapp
	wget -O .config https://raw.githubusercontent.com/we2oxy/Build-Lede/master/buildinfo/N1-openwrt.buildinfo
	echo "$FUNCNAME successful"
	sleep 3
}

function fun_R2S(){
	echo "$FUNCNAME action"
	git clone https://github.com/coolsnowwolf/lede.git /build/lede-R2S
	cd /build/lede-R2S
	fun_addluciapp
	wget -O .config https://raw.githubusercontent.com/we2oxy/Build-Lede/master/buildinfo/R2S-lede.buildinfo
	echo "$FUNCNAME successful"
	sleep 3
}

function fun_x64(){
	echo "$FUNCNAME action"
	git clone https://github.com/coolsnowwolf/lede.git /build/lede-x64
	cd /build/lede-x64
	fun_addluciapp
	wget -O .config https://raw.githubusercontent.com/we2oxy/Build-Lede/master/buildinfo/x86-lede.buildinfo
	echo "$FUNCNAME successful"
	sleep 3
}

function fun_lede1701(){
	echo "$FUNCNAME action"
	git clone --branch lede-17.01 --single-branch  https://github.com/coolsnowwolf/openwrt.git /build/lede-1701
	cd /build/lede-1701
	rm -rf tmp/
	echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall" >> feeds.conf.default
	cat -n feeds.conf.default
	rm -rf package/lean/luci-theme-argon
	git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
	git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
	git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
	git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner package/lean/luci-app-onliner
	git clone --depth=1 -b master https://github.com/vernesong/OpenClash package/lean/OpenClash
	./scripts/feeds update -a
	./scripts/feeds install -a
	wget -O .config https://raw.githubusercontent.com/we2oxy/Build-Lede/master/buildinfo/x86-lede-1701.buildinfo
	echo "$FUNCNAME successful"
	sleep 3
}


fun_init
fun_N1
fun_R2S
fun_x64
fun_lede1701