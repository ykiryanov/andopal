#
# ptlib_config.mak
#
# mak rules to be included in a ptlib application Makefile.
#
# Portable Tools Library
#
# Copyright (c) 1993-2013 Equivalence Pty. Ltd.
#
# The contents of this file are subject to the Mozilla Public License
# Version 1.0 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
# the License for the specific language governing rights and limitations
# under the License.
#
# The Original Code is Portable Windows Library.
#
# The Initial Developer of the Original Code is Equivalence Pty. Ltd.
#
# Portions are Copyright (C) 1993 Free Software Foundation, Inc.
# All Rights Reserved.
# 
# Contributor(s): ______________________________________.
#
# $Revision$
# $Author$
# $Date$
#

PTLIB_MAJOR :=2
PTLIB_MINOR :=13
PTLIB_STAGE :=-beta
PTLIB_BUILD :=3

# detected platform
target      := Darwin_x86_64
target_os   := Darwin
target_cpu  := x86_64

# The install directories
ifndef prefix
  prefix := /usr/local
endif
ifndef exec_prefix
  exec_prefix := ${prefix}
endif
ifndef libdir
  libdir := ${exec_prefix}/lib
endif
ifndef includedir
  includedir := ${prefix}/include
endif
ifndef datarootdir
  datarootdir := ${prefix}/share
endif

# Tool names detected by configure
CC      := gcc
CXX     := g++
LD      := g++
AR      := libtool
RANLIB  := 
LN_S    := ln -s
MKDIR_P := mkdir -p
BISON   := /usr/bin/bison
INSTALL := /usr/bin/install -c -C
SVN     := /opt/local/bin/svn

CPPFLAGS          :=  -stdlib=libstdc++ -mmacosx-version-min=10.6 -I/opt/local/include -DP_64BIT -fno-caret-diagnostics -Wno-\#pragma-messages -D_REENTRANT -DPTRACING=2     $(CPPFLAGS)
CXXFLAGS          :=  -fno-exceptions -D_THREAD_SAFE -pthread $(CXXFLAGS)
CFLAGS            :=  -D_THREAD_SAFE -pthread $(CFGLAGS)
LDFLAGS           :=  -stdlib=libstdc++ $(LDFLAGS)
LIBS              := -ldl -lv8 -lexpat -lldap -lsasl2 -lpcap -lresolv  -L/opt/local/lib -framework QTKit -framework CoreVideo -framework AudioUnit -framework AudioToolbox -framework CoreAudio -framework SystemConfiguration -framework Foundation -lobjc -llber -lldap -lsasl2 -lpcap -lresolv  -L/opt/local/lib -framework QTKit -framework CoreVideo -framework AudioUnit -framework AudioToolbox -framework CoreAudio -framework SystemConfiguration -framework Foundation -lobjc  $(LIBS)
SHARED_CPPFLAGS   := -fPIC
SHARED_LDFLAGS     = -dynamiclib
DEBUG_CPPFLAGS    := -D_DEBUG
DEBUG_CFLAGS      :=  -g3 -ggdb -O0
OPT_CPPFLAGS      := -DNDEBUG
OPT_CFLAGS        :=  -O3
ARFLAGS           := -static -o
YFLAGS            := @YFLAGS@

SHAREDLIBEXT      := dylib
STATICLIBEXT      := a

PTLIB_PLUGIN_SUFFIX := _ptplugin

PTLIB_PLUGIN_DIR  := ptlib-2.13.3

HAS_IPV6          := 1
HAS_DNS_RESOLVER  := 1
HAS_PCAP          := 1
HAS_OPENSSL       := 
HAS_SSL           := 
HAS_OPENLDAP      := 1
HAS_LDAP          := 1
HAS_SASL          := 
HAS_SASL2         := 1
HAS_EXPAT         := 1
HAS_REGEX         := 1
HAS_SDL           := 
HAS_PLUGINS       := 1
HAS_SAMPLES       := 

HAS_TTS           := 1
HAS_ASN           := 1
HAS_NAT           := 1
HAS_STUN          := 1
HAS_STUNSRVR      := 1
HAS_PIPECHAN      := 1
HAS_DTMF          := 1
HAS_VCARD         := 1
HAS_WAVFILE       := 1
HAS_SOCKS         := 1
HAS_FTP           := 1
HAS_SNMP          := 1
HAS_TELNET        := 1
HAS_CLI           := 1
HAS_REMCONN       := 1
HAS_SERIAL        := 1
HAS_POP3SMTP      := 1
HAS_AUDIO         := 1
HAS_VIDEO         := 1
HAS_SHM_VIDEO     := 
HAS_SHM_AUDIO     := 
HAS_PORTAUDIO     := 
HAS_SUN_AUDIO     := 
HAS_VFW_CAPTURE   := 
HAS_GSTREAMER     := 

HAS_VXML          := 1
HAS_JABBER        := 1
HAS_XMLRPC        := 1
HAS_SOAP          := 1
HAS_URL           := 1
HAS_HTTP          := 1
HAS_HTTPFORMS     := 1
HAS_HTTPSVC       := 1
HAS_SSDP          := 1
HAS_CONFIG_FILE   := 1
HAS_VIDFILE       := 1
HAS_FFVDEV        := 1
HAS_ODBC          := 
HAS_DIRECTSHOW    := 
HAS_DIRECTSOUND   := 
HAS_LUA           := 
HAS_V8            := 1

HAS_ALSA          := 
HAS_AUDIOSHM      := @HAS_AUDIOSHM@
HAS_OSS           := 
HAS_PULSE         := 
HAS_ESD           := 
HAS_SUNAUDIO      := @HAS_SUNAUDIO@
HAS_V4L           := 
HAS_V4L2          := 
HAS_BSDVIDEOCAP   := 
HAS_AVC1394       := 
HAS_DC1394        := 

ESD_CFLAGS  := 
ESD_LIBS    := 
V4L2_CFLAGS := 
V4L2_LIBS   := 
DC_CFLAGS   := 


# Remember where this make file is, it is the platform specific one and there
# is a corresponding platform specific include file that goes with it
PTLIB_PLATFORM_INC_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))../include)


# End of ptlib_config.mak
