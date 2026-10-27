include $(TOPDIR)/rules.mk

PKG_NAME:=wireguard
PKG_VERSION:=0.1.20210315
PKG_RELEASE:=1

PKG_SOURCE:=wireguard-linux-compat-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=file://
PKG_HASH:=f3a0804e4171488b51a332a4b685f043153a3fe46e7d0e47a8b153a2e0995040

PKG_MAINTAINER:=Jason A. Donenfeld <Jason@zx2c4.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/wireguard
  SUBMENU:=Network Support
  TITLE:=WireGuard (Linux 4.4 compat)
  DEPENDS:=+kmod-crypto-aead +kmod-crypto-blake2s +kmod-crypto-chacha20poly1305 +kmod-crypto-curve25519 +kmod-crypto-hash
  FILES:=$(PKG_BUILD_DIR)/wireguard.ko
  AUTOLOAD:=$(call AutoProbe,wireguard)
endef

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)" modules
endef

$(eval $(call KernelPackage,wireguard))
