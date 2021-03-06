ifeq ($(BR2_PACKAGE_ISP2_IPC),y)
ISP2_IPC_SITE = $(TOPDIR)/../external/isp2-ipc
ISP2_IPC_SITE_METHOD = local
ISP2_IPC_INSTALL_STAGING = YES
ISP2_IPC_DEPENDENCIES = libglib2 dbus
ISP2_IPC_TARGET_INSTALL_DIR = $(TARGET_DIR)

ifeq ($(BR2_PACKAGE_RK_OEM), y)
 ISP2_IPC_INSTALL_TARGET_OPTS = DESTDIR=$(BR2_PACKAGE_RK_OEM_INSTALL_TARGET_DIR) install/fast
 ISP2_IPC_DEPENDENCIES += rk_oem
 ISP2_IPC_TARGET_INSTALL_DIR = $(BR2_PACKAGE_RK_OEM_INSTALL_TARGET_DIR)
 ISP2_IPC_CONF_OPTS += -DCONFIG_OEM=1
endif

ifeq ($(BR2_PACKAGE_DBUS_GLIB), y)
 ISP2_IPC_CONF_OPTS += -DCONFIG_DBUS=1
endif

ifeq ($(BR2_PACKAGE_DBSERVER), y)
 ISP2_IPC_CONF_OPTS += -DCONFIG_DBSERVER=1
 ISP2_IPC_DEPENDENCIES += libIPCProtocol
endif

endif
$(eval $(cmake-package))
