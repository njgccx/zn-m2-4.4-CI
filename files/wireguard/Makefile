include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard
PKG_VERSION:=1.0.20220627
PKG_RELEASE:=1

PKG_SOURCE:=wireguard-linux-compat-$(PKG_VERSION).tar.xz

PKG_MAINTAINER:=Jason A. Donenfeld <Jason@zx2c4.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/wireguard
  SUBMENU:=Network Support
  TITLE:=WireGuard compat 1.0.20220627 (Linux‑4.4)
  DEPENDS:=+kmod-crypto-aead +kmod-crypto-chacha20poly1305 +kmod-crypto-hash
  FILES:=$(PKG_BUILD_DIR)/wireguard.ko
  AUTOLOAD:=$(call AutoProbe,wireguard)
endef

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	# 解压到build_dir，内层目录 wireguard-linux-compat-xxx
	$(TAR) -xJf $(DL_DIR)/$(PKG_SOURCE) -C $(BUILD_DIR)
	# 移动到 PKG_BUILD_DIR
	mv $(BUILD_DIR)/wireguard-linux-compat-$(PKG_VERSION)/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)" modules
endef

$(eval $(call KernelPackage,wireguard))
