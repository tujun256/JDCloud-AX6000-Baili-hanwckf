#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
##-----------------Del duplicate packages------------------
#rm -rf feeds/packages/net/open-app-filter
##-----------------Add OpenClash dev core------------------
#curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
#tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
#chmod +x /tmp/clash >/dev/null 2>&1
#mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
#mv /tmp/clash feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash >/dev/null 2>&1
#rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
##-----------------Delete DDNS's examples-----------------
#sed -i '/myddns_ipv4/,$d' feeds/packages/net/ddns-scripts/files/etc/config/ddns
##-----------------Manually set CPU frequency for MT7986A-----------------
#sed -i '/"mediatek"\/\*|\"mvebu"\/\*/{n; s/.*/\tcpu_freq="2.0GHz" ;;/}' package/emortal/autocore/files/generic/cpuinfo
cp JDCloud-AX6000-Baili/mt7986a-jdcloud-re-cp-03.dts openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-jdcloud-re-cp-03.dts
cd openwrt
sed -i '/jdcloud,re-cp-03)/ {n; /lan1 lan2 lan3 lan4/lan1 lan2 lan3 lan4 lan5/g' $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/mt7986/base-files/etc/board.d/02_network
sed -i 's/MT7986_ePAeLNA_EEPROM_AX6000.bin/MT7986_iPAiLNA_EEPROM_AX6000.bin/g' $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/mt7986/base-files/lib/preinit/90_extract_caldata
cat $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/mt7986/base-files/lib/preinit/90_extract_caldata
