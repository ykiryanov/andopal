APP_ABI := armeabi
APP_PLATFORM := android-14
APP_STL := gnustl_static
NDK_TOOLCHAIN_VERSION := 4.6
APP_CFLAGS := -Wno-psabi -O0 -marm -fno-strict-aliasing -funswitch-loops -finline-limit=100 -fomit-frame-pointer
APP_CPPFLAGS := -fno-exceptions -fpic -fstack-protector -frtti -fno-short-enums