#!/bin/bash

#sed -i 's|/jdcloud,re-cp-03)/ {n; /\(lan1 lan2 lan3 lan4\)|\1 lan5|g' target/linux/mediatek/mt7986/base-files/etc/board.d/02_network

#sed -i '/jdcloud,re-cp-03)/ {n; s/lan1 lan2 lan3 lan4/lan0 lan1 lan2 lan3 lan4 lan5/}' target/linux/mediatek/mt7986/base-files/etc/board.d/02_network
cd ${GITHUB_WORKSPACE}/openwrt

cp -af ./feeds/mtk_openwrt_feed/21.02/files/* .
cp -af ./feeds/mtk_openwrt_feed/tools .
for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-base -name "*.patch" | sort); do patch -f -p1 -i ${file}; done
for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-feeds -name "*.patch" | sort); do patch -f -p1 -i ${file}; done

pwd
cp ${GITHUB_WORKSPACE}/JDCloud-AX6000-Baili/mt7986a-jdcloud-re-cp-03.dts ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-jdcloud-re-cp-03.dts

cp ${GITHUB_WORKSPACE}/JDCloud-AX6000-Baili/mt7986a-glinet-gl-mt6000.dts ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-glinet-gl-mt6000.dts

cp ${GITHUB_WORKSPACE}/JDCloud-AX6000-Baili/mt7986a-emmc-rfb.dts ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-emmc-rfb.dts


cat ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-jdcloud-re-cp-03.dts

cat ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-glinet-gl-mt6000.dts

sed -i '/jdcloud,re-cp-03)/ {n; s/lan1 lan2 lan3 lan4/lan0 lan1 lan2 lan3 lan4 lan5/}' target/linux/mediatek/mt7986/base-files/etc/board.d/02_network
cat ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/mt7986/base-files/etc/board.d/02_network

sed -i 's/MT7986_ePAeLNA_EEPROM_AX6000.bin/MT7986_iPAiLNA_EEPROM_AX6000.bin/g' ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/mt7986/base-files/lib/preinit/90_extract_caldata
cat ${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/mt7986/base-files/lib/preinit/90_extract_caldata

exit 0

