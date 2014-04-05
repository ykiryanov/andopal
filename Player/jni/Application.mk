# The ARMv7 is significanly faster due to the use of the hardware FPU
APP_ABI := armeabi-v7a
APP_PLATFORM := android-10
APP_STL := gnustl_static
APP_CFLAGS := -Wno-psabi -O0 -fno-strict-aliasing -funswitch-loops -finline-limit=100 -fomit-frame-pointer
APP_CPPFLAGS := -fexceptions -fpic -fstack-protector -frtti -fno-short-enums

