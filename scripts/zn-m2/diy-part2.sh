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
#优先安装 passwall 源
#./scripts/feeds install -a -f -p passwall_packages
#./scripts/feeds install -a -f -p passwall_luci
# 移除源码自带的新版wireguard（不兼容4.4内核）
rm -rf package/network/services/wireguard
# 拉取 sdf8057 适配ipq6000 4.4的wireguard包
git clone https://mirror.ghproxy.com/https://github.com/sdf8057/wireguard.git package/network/services/wireguard
