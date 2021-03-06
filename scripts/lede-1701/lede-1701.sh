#!/bin/bash

fun_backup_defaultsettings(){
	echo "\n-----backup start-----"
	cp /build/lede-1701/package/lean/default-settings/files/zzz-default-settings /build/lede-1701/package/lean/default-settings/files/zzz-default-settings.bak
	echo "\n-----backup successful------"
}

fun_sync_sourecode(){
	echo "\n-----sync_sourecode start-----"
	cd /build/lede-1701/package/lean/
	rm -rf luci-theme-argon
	git clone https://github.com/jerrykuku/lua-maxminddb.git
	git clone https://github.com/jerrykuku/luci-app-vssr.git 
	git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
	svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash luci-app-openclash
	svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ openwrt-passwall
	svn co https://github.com/QiuSimons/openwrt-mos/trunk/mosdns mosdns
	svn co https://github.com/QiuSimons/openwrt-mos/trunk/luci-app-mosdns luci-app-mosdns
	echo "\n-----sync_sourecode successful------"
}

fun_del_snapshot(){
	echo "\n-----del_snapshot start-----"
	sed -i 's,-SNAPSHOT,,g' /build/lede-1701/include/version.mk
	sed -i 's,-SNAPSHOT,,g' /build/lede-1701/package/base-files/image-config.in
	echo "\n-----del_snapshot successful------"
}

fun_del_passwd(){
	echo "\n-----del_passwd start-----"
	sed -i '/CYXluq4wUazHjmCDBCqXF/d'  /build/lede-1701/package/lean/default-settings/files/zzz-default-settings
	echo "\n-----del_passwd successful------"
}
 
fun_import_rules(){
	echo "\n-----import_rules start-----"
	svn co https://github.com/we2oxy/OpenWrtConfig/trunk/files/etc /build/lede-1701/files/etc
	cd /build/lede-1701/files/etc/
	cp -R ssrplus/ vssr/
	rm -rf .svn/
	ls -lahR /build/lede-1701/files/
	echo "\n-----import_rules successful------"
 }

fun_vssr(){
	echo "\n-----modify vssr start-----"
	sed -i '/result.encrypt_method/a\        result.fast_open = "1"' /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/subscribe.lua
	sed -i 's,ispip.clang.cn/all_cn.txt,cdn.jsdelivr.net/gh/QiuSimons/Chnroute@master/dist/chnroute/chnroute.txt,g' /build/lede-1701/package/lean/luci-app-vssr/luasrc/controller/vssr.lua
	sed -i 's,ispip.clang.cn/all_cn.txt,cdn.jsdelivr.net/gh/QiuSimons/Chnroute@master/dist/chnroute/chnroute.txt,g' /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/update.lua
	echo "\nresult.fast_open /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/subscribe.lua\n"
	grep -C 2 "result.fast_open" /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/subscribe.lua
	echo "\nraw.githubusercontent.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt /build/lede-1701/package/lean/luci-app-vssr/luasrc/controller/vssr.lua\n"
	grep -C 2 "chnroute.txt" /build/lede-1701/package/lean/luci-app-vssr/luasrc/controller/vssr.lua
	echo "\nraw.githubusercontent.com/QiuSimons/Chnroute/master/dist/chnroute/chnroute.txt /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/update.lua\n"
	grep -C 2 "chnroute.txt" /build/lede-1701/package/lean/luci-app-vssr/root/usr/share/vssr/update.lua
	echo "\n-----modify vssr successful------"
 }
 

fun_ssrplus(){
	echo "\n-----modify ssrplus start-----"
	cd /build/lede-1701/feeds/helloworld/
	rm -rf luci-app-ssr-plus/po/zh_Hans
	sed -i '/result.encrypt_method/a\                result.fast_open = "1"' luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
	sed -i 's,ispip.clang.cn/all_cn,cdn.jsdelivr.net/gh/QiuSimons/Chnroute@master/dist/chnroute/chnroute.txt,' luci-app-ssr-plus/root/etc/init.d/shadowsocksr
	sed -i 's,YW5vbnltb3Vz/domain-list-community/release/gfwlist.txt,Loyalsoldier/v2ray-rules-dat/release/gfw.txt,'  luci-app-ssr-plus/root/etc/init.d/shadowsocksr
	sed -i '/Clang.CN.CIDR/a\o:value("https://cdn.jsdelivr.net/gh/QiuSimons/Chnroute@master/dist/chnroute/chnroute.txt", translate("QiuSimons/Chnroute"))\' luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/advanced.lua
	echo "\nresult.fast_open root/usr/share/shadowsocksr/subscribe.lua\n"
	grep -C 2 "result.fast_open" luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
	echo "\nLoyalsoldier/v2ray-rules-dat root/etc/init.d/shadowsocksr\n"
	grep -C 2 "chnroute.txt" luci-app-ssr-plus/root/etc/init.d/shadowsocksr
	echo "\nLoyalsoldier/v2ray-rules-dat  root/etc/init.d/shadowsocksr\n"
	grep -C 2 "Loyalsoldier/v2ray-rules-dat"  luci-app-ssr-plus/root/etc/init.d/shadowsocksr
	echo "\ntranslate("QiuSimons/Chnroute") luasrc/model/cbi/shadowsocksr/advanced.lua\n"
	grep -C 2 'translate("QiuSimons/Chnroute")' luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/advanced.lua
	echo "\n-----modify ssrplus successful------"
 }
 
fun_check_privilege(){
	echo "\n-----check_privilege start-----"
	cd /
	sudo chown -R runner:runner /build/
	echo "\n-----check_privilege successful------"
 }

fun_backup_defaultsettings
fun_del_passwd
fun_sync_sourecode
fun_import_rules
fun_vssr
fun_ssrplus
