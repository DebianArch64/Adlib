TARGET := iphone:clang:latest:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = adlib

adlib_FILES = ${wildcard *.x *.m }
adlib_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk