LOCAL_PATH := $(call my-dir)
IW_SOURCE_DIR := $(LOCAL_PATH)

include $(CLEAR_VARS)

NO_PKG_CONFIG=y
#include $(LOCAL_PATH)/Makefile

OBJS := iw.c genl.c event.c info.c phy.c \
	interface.c ibss.c station.c survey.c util.c \
	mesh.c mpath.c scan.c reg.c version.c \
	reason.c status.c connect.c link.c offch.c ps.c cqm.c \
	bitrate.c wowlan.c coalesce.c roc.c p2p.c
OBJS += sections.c
OBJS += hwsim.c

LOCAL_SRC_FILES := $(OBJS) android-nl.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	external/libnl-headers/

LOCAL_CFLAGS += -DCONFIG_LIBNL20
LOCAL_LDFLAGS := -Wl,--no-gc-sections
#LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libnl_2
LOCAL_MODULE := iw

$(IW_SOURCE_DIR)/version.c:
	$(IW_SOURCE_DIR)/version.sh $(IW_SOURCE_DIR)/version.c

include $(BUILD_EXECUTABLE)
