

include $(TOPDIR)/rules.mk

PKG_NAME:=tunslip
PKG_RELEASE:=1
PKG_REVISION:=1.1
PKG_VERSION:=0.1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/tunslip
	SECTION:=base
	CATEGORY:=Magnetworks
	DEFAULT:=y
	TITLE:=Tunslip, ipv4 SLIP tunnel creator
	URL:=https://github.com/contiki-os/contiki/
endef

define Package/tunslip/description
	Utility to create a tunnel interface for data received via SLIP.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/tunslip/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tunslip $(1)/bin/
endef

$(eval $(call BuildPackage,tunslip))
