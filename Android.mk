LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := timekeep.c
LOCAL_MODULE := timekeep
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_MODULE_TAGS := optional
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 25 ))" )))
LOCAL_MODULE_OWNER := sony
LOCAL_INIT_RC_64   := vendor/etc/init/timekeep.rc
LOCAL_PROPRIETARY_MODULE := true
endif
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-java-files-under, src)
LOCAL_PACKAGE_NAME := TimeKeep
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 28 ))" )))
LOCAL_SDK_VERSION := current
endif
LOCAL_PROGUARD_ENABLED := disabled
include $(BUILD_PACKAGE)
