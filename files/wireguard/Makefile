include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard
PKG_VERSION:=1.0.20220627
PKG_RELEASE:=1

PKG_SOURCE:=wireguard-linux-compat-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=
PKG_HASH:=skip

PKG_MAINTAINER:=Jason A. Donenfeld <Jason@zx2c4.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	$(TAR) -xJf $(DL_DIR)/$(PKG_SOURCE) -C $(BUILD_DIR)
	mv $(BUILD_DIR)/wireguard-linux-compat-$(PKG_VERSION) $(PKG_BUILD_DIR)
	sed -i '/static inline void \*skb_put_data/,/^}/d' $(PKG_BUILD_DIR)/src/compat/compat.h
endef

define KernelPackage/wireguard
  SUBMENU:=Network Support
  TITLE:=WireGuard compat 1.0.20220627 (Linux 4.4)
  DEPENDS:=+kmod-crypto-aead +kmod-crypto-chacha20poly1305 +kmod-crypto-hash +kmod-udptunnel4 +IPV6:kmod-udptunnel6
  FILES:=$(PKG_BUILD_DIR)/src/wireguard.ko
  AUTOLOAD:=$(call AutoProbe,wireguard)
endef

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)/src" modules
endef

$(eval $(call KernelPackage,wireguard))
