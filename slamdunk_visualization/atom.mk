LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ros-slamdunk-visualization
LOCAL_CATEGORY_PATH := ros_packages
LOCAL_DESCRIPTION := Parrot S.L.A.M.dunk ROS visualization tools

LOCAL_LIBRARIES := \
	ros-indigo-export \
	ros-slamdunk-msgs

SLAMDUNK_ROS_SDK_BUILD_DIR := $(call local-get-build-dir)/../ros-slamdunk/devel

LOCAL_EXPAND_CUSTOM_VARIABLES := 1
LOCAL_CMAKE_CONFIGURE_ARGS = \
	-DCATKIN_DEVEL_PREFIX=$(SLAMDUNK_ROS_SDK_BUILD_DIR) \
	%{CUSTOM_ROS_INDIGO_CMAKE_CONFIGURE_ARGS}

ifeq ("$(TARGET_CPU)", "tegrak1")
LOCAL_CMAKE_CONFIGURE_ARGS += -DCMAKE_INSTALL_PREFIX=/opt/ros-slamdunk/
endif

LOCAL_EXTRA_DEPENDENCIES := \
	src/SLAMDunkQualityDisplay.cpp \
	src/SLAMDunkPoseDisplay.hpp \
	src/SLAMDunkQualityDisplay.hpp \
	src/SLAMDunkPanel.cpp \
	src/SLAMDunkPoseDisplay.cpp \
	src/SLAMDunkPanel.hpp

include $(BUILD_CMAKE)
