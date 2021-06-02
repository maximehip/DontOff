FINALPACKAGE = 1

THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222

ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DontOff

DontOff_FILES = Tweak.x
$(TWEAK_NAME)_FRAMEWORKS = UIKit LocalAuthentication
DontOff_CFLAGS = -fobjc-arc
DontOff_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk
