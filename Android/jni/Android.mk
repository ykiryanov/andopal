LOCAL_PATH := $(call my-dir)

$(warning $(TARGET_C_INCLUDES))

##################PTLIB STATIC LIBRARY COMPILE##################
include $(CLEAR_VARS)

LOCAL_MODULE := libptlibs

#LOCAL_EXPORT_C_INCLUDES := ../include
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../../ptlib/include \
	$(TARGET_C_INCLUDES)

PTLIB_SRC_PATH := ../../ptlib/src/ptlib
PTCLIB_SRC_PATH := ../../ptlib/src/ptclib

LOCAL_SRC_FILES := \
	$(PTLIB_SRC_PATH)/unix/opensl_es.cxx \
	$(PTLIB_SRC_PATH)/unix/assert.cxx \
	$(PTLIB_SRC_PATH)/unix/channel.cxx \
	$(PTLIB_SRC_PATH)/unix/config.cxx \
	$(PTLIB_SRC_PATH)/unix/osutil.cxx \
	$(PTLIB_SRC_PATH)/unix/pipechan.cxx \
	$(PTLIB_SRC_PATH)/unix/socket.cxx \
	$(PTLIB_SRC_PATH)/unix/svcproc.cxx \
	$(PTLIB_SRC_PATH)/unix/tlib.cxx \
	$(PTLIB_SRC_PATH)/unix/udll.cxx \
	$(PTLIB_SRC_PATH)/common/jidctflt.cxx \
	$(PTLIB_SRC_PATH)/common/tinyjpeg.cxx \
	$(PTLIB_SRC_PATH)/common/collect.cxx \
	$(PTLIB_SRC_PATH)/common/contain.cxx \
	$(PTLIB_SRC_PATH)/common/getdate.c \
	$(PTLIB_SRC_PATH)/common/notifier_ext.cxx \
	$(PTLIB_SRC_PATH)/common/object.cxx \
	$(PTLIB_SRC_PATH)/common/osutils.cxx \
	$(PTLIB_SRC_PATH)/common/pluginmgr.cxx \
	$(PTLIB_SRC_PATH)/common/ptime.cxx \
	$(PTLIB_SRC_PATH)/common/pvidchan.cxx \
	$(PTLIB_SRC_PATH)/common/safecoll.cxx \
	$(PTLIB_SRC_PATH)/common/sockets.cxx \
	$(PTLIB_SRC_PATH)/common/sound.cxx \
	$(PTLIB_SRC_PATH)/common/syslog.cxx \
	$(PTLIB_SRC_PATH)/common/vconvert.cxx \
	$(PTLIB_SRC_PATH)/common/vfakeio.cxx \
	$(PTLIB_SRC_PATH)/common/videoio.cxx \
	$(PTCLIB_SRC_PATH)/tonedev.cxx \
	$(PTCLIB_SRC_PATH)/gstreamer.cxx \
	$(PTCLIB_SRC_PATH)/jscript.cxx \
	$(PTCLIB_SRC_PATH)/script.cxx \
	$(PTCLIB_SRC_PATH)/ssdp.cxx \
	$(PTCLIB_SRC_PATH)/vcard.cxx \
	$(PTCLIB_SRC_PATH)/asner.cxx \
	$(PTCLIB_SRC_PATH)/cli.cxx \
	$(PTCLIB_SRC_PATH)/cypher.cxx \
	$(PTCLIB_SRC_PATH)/delaychan.cxx \
	$(PTCLIB_SRC_PATH)/dtmf.cxx \
	$(PTCLIB_SRC_PATH)/enum.cxx \
	$(PTCLIB_SRC_PATH)/ftp.cxx \
	$(PTCLIB_SRC_PATH)/ftpclnt.cxx \
	$(PTCLIB_SRC_PATH)/ftpsrvr.cxx \
	$(PTCLIB_SRC_PATH)/guid.cxx \
	$(PTCLIB_SRC_PATH)/html.cxx \
	$(PTCLIB_SRC_PATH)/http.cxx \
	$(PTCLIB_SRC_PATH)/httpclnt.cxx \
	$(PTCLIB_SRC_PATH)/httpform.cxx \
	$(PTCLIB_SRC_PATH)/httpsrvr.cxx \
	$(PTCLIB_SRC_PATH)/httpsvc.cxx \
	$(PTCLIB_SRC_PATH)/inetmail.cxx \
	$(PTCLIB_SRC_PATH)/inetprot.cxx \
	$(PTCLIB_SRC_PATH)/ipacl.cxx \
	$(PTCLIB_SRC_PATH)/lua.cxx \
	$(PTCLIB_SRC_PATH)/memfile.cxx \
	$(PTCLIB_SRC_PATH)/pasn.cxx \
	$(PTCLIB_SRC_PATH)/pdns.cxx \
	$(PTCLIB_SRC_PATH)/pffvdev.cxx \
	$(PTCLIB_SRC_PATH)/pils.cxx \
	$(PTCLIB_SRC_PATH)/pldap.cxx \
	$(PTCLIB_SRC_PATH)/pnat.cxx \
	$(PTCLIB_SRC_PATH)/podbc.cxx \
	$(PTCLIB_SRC_PATH)/psasl.cxx \
	$(PTCLIB_SRC_PATH)/psnmp.cxx \
	$(PTCLIB_SRC_PATH)/psoap.cxx \
	$(PTCLIB_SRC_PATH)/psockbun.cxx \
	$(PTCLIB_SRC_PATH)/pssl.cxx \
	$(PTCLIB_SRC_PATH)/pstun.cxx \
	$(PTCLIB_SRC_PATH)/pstunsrvr.cxx \
	$(PTCLIB_SRC_PATH)/ptts.cxx \
	$(PTCLIB_SRC_PATH)/pvfiledev.cxx \
	$(PTCLIB_SRC_PATH)/pvidfile.cxx \
	$(PTCLIB_SRC_PATH)/pwavfile.cxx \
	$(PTCLIB_SRC_PATH)/pwavfiledev.cxx \
	$(PTCLIB_SRC_PATH)/pxml.cxx \
	$(PTCLIB_SRC_PATH)/pxmlrpc.cxx \
	$(PTCLIB_SRC_PATH)/pxmlrpcs.cxx \
	$(PTCLIB_SRC_PATH)/qchannel.cxx \
	$(PTCLIB_SRC_PATH)/random.cxx \
	$(PTCLIB_SRC_PATH)/rfc1155.cxx \
	$(PTCLIB_SRC_PATH)/shttpsvc.cxx \
	$(PTCLIB_SRC_PATH)/snmp.cxx \
	$(PTCLIB_SRC_PATH)/snmpclnt.cxx \
	$(PTCLIB_SRC_PATH)/snmpserv.cxx \
	$(PTCLIB_SRC_PATH)/socks.cxx \
	$(PTCLIB_SRC_PATH)/telnet.cxx \
	$(PTCLIB_SRC_PATH)/threadpool.cxx \
	$(PTCLIB_SRC_PATH)/url.cxx \
	$(PTCLIB_SRC_PATH)/vartype.cxx \
	$(PTCLIB_SRC_PATH)/vxml.cxx \
	$(PTCLIB_SRC_PATH)/xmpp.cxx \
	$(PTCLIB_SRC_PATH)/xmpp_c2s.cxx \
	$(PTCLIB_SRC_PATH)/xmpp_muc.cxx \
	$(PTCLIB_SRC_PATH)/xmpp_roster.cxx

include $(BUILD_STATIC_LIBRARY)
################################################################

##################OPAL STATIC LIBRARY COMPILE###################
include $(CLEAR_VARS)

#LOCAL_EXPORT_C_INCLUDES := ../include
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include\
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/../../opal/include \
	$(TARGET_C_INCLUDES)

OPAL_SRC_PATH := ../../opal/src
H264_SRC_PATH := $(OPAL_SRC_PATH)/codec/ipp264codec

LOCAL_SRC_FILES := \
	$(OPAL_SRC_PATH)/ep/skinnyep.cxx \
	$(OPAL_SRC_PATH)/ep/gstendpoint.cxx \
	$(OPAL_SRC_PATH)/ep/opalmixer.cxx \
	$(OPAL_SRC_PATH)/ep/ivr.cxx \
	$(OPAL_SRC_PATH)/ep/localep.cxx \
	$(OPAL_SRC_PATH)/ep/opalvxml.cxx \
	$(OPAL_SRC_PATH)/ep/pcss.cxx \
	$(OPAL_SRC_PATH)/java/java_msvc_wrapper.cxx \
	$(OPAL_SRC_PATH)/rtp/h235_session.cxx \
	$(OPAL_SRC_PATH)/rtp/rtpconn.cxx \
	$(OPAL_SRC_PATH)/rtp/rtpep.cxx \
	$(OPAL_SRC_PATH)/rtp/jitter.cxx \
	$(OPAL_SRC_PATH)/rtp/metrics.cxx \
	$(OPAL_SRC_PATH)/rtp/pcapfile.cxx \
	$(OPAL_SRC_PATH)/rtp/rtp.cxx \
	$(OPAL_SRC_PATH)/rtp/rtp_session.cxx \
	$(OPAL_SRC_PATH)/rtp/srtp_session.cxx \
	$(OPAL_SRC_PATH)/rtp/zrtpudp.cxx \
	$(OPAL_SRC_PATH)/asn/gcc.cxx \
	$(OPAL_SRC_PATH)/asn/h225_1.cxx \
	$(OPAL_SRC_PATH)/asn/h225_2.cxx \
	$(OPAL_SRC_PATH)/asn/h235.cxx \
	$(OPAL_SRC_PATH)/asn/h235_srtp.cxx \
	$(OPAL_SRC_PATH)/asn/h245_1.cxx \
	$(OPAL_SRC_PATH)/asn/h245_2.cxx \
	$(OPAL_SRC_PATH)/asn/h245_3.cxx \
	$(OPAL_SRC_PATH)/asn/h248.cxx \
	$(OPAL_SRC_PATH)/asn/h4501.cxx \
	$(OPAL_SRC_PATH)/asn/h45010.cxx \
	$(OPAL_SRC_PATH)/asn/h45011.cxx \
	$(OPAL_SRC_PATH)/asn/h4502.cxx \
	$(OPAL_SRC_PATH)/asn/h4503.cxx \
	$(OPAL_SRC_PATH)/asn/h4504.cxx \
	$(OPAL_SRC_PATH)/asn/h4505.cxx \
	$(OPAL_SRC_PATH)/asn/h4506.cxx \
	$(OPAL_SRC_PATH)/asn/h4507.cxx \
	$(OPAL_SRC_PATH)/asn/h4508.cxx \
	$(OPAL_SRC_PATH)/asn/h4509.cxx \
	$(OPAL_SRC_PATH)/asn/h501.cxx \
	$(OPAL_SRC_PATH)/asn/mcs.cxx \
	$(OPAL_SRC_PATH)/asn/t38.cxx \
	$(OPAL_SRC_PATH)/asn/x880.cxx \
	$(OPAL_SRC_PATH)/codec/h261mf.cxx \
	$(OPAL_SRC_PATH)/codec/h263mf.cxx \
	$(OPAL_SRC_PATH)/codec/h264mf.cxx \
	$(OPAL_SRC_PATH)/codec/mpeg4mf.cxx \
	$(OPAL_SRC_PATH)/codec/g711.c \
	$(OPAL_SRC_PATH)/codec/g711a1_plc.cxx \
	$(OPAL_SRC_PATH)/codec/g711codec.cxx \
	$(OPAL_SRC_PATH)/codec/g7221mf.cxx \
	$(OPAL_SRC_PATH)/codec/g7222mf.cxx \
	$(OPAL_SRC_PATH)/codec/g722mf.cxx \
	$(OPAL_SRC_PATH)/codec/g7231mf.cxx \
	$(OPAL_SRC_PATH)/codec/g726mf.cxx \
	$(OPAL_SRC_PATH)/codec/g728mf.cxx \
	$(OPAL_SRC_PATH)/codec/g729mf.cxx \
	$(OPAL_SRC_PATH)/codec/gsm0610mf.cxx \
	$(OPAL_SRC_PATH)/codec/gsmamrmf.cxx \
	$(OPAL_SRC_PATH)/codec/ilbcmf.cxx \
	$(OPAL_SRC_PATH)/codec/opalpluginmgr.cxx \
	$(OPAL_SRC_PATH)/codec/opalwavfile.cxx \
	$(OPAL_SRC_PATH)/codec/ratectl.cxx \
	$(OPAL_SRC_PATH)/codec/rfc2435.cxx \
	$(OPAL_SRC_PATH)/codec/rfc2833.cxx \
	$(OPAL_SRC_PATH)/codec/rfc4175.cxx \
	$(OPAL_SRC_PATH)/codec/silencedetect.cxx \
	$(OPAL_SRC_PATH)/codec/vidcodec.cxx \
	$(OPAL_SRC_PATH)/codec/codectest.cxx \
	$(OPAL_SRC_PATH)/h224/h224.cxx \
	$(OPAL_SRC_PATH)/h224/h281.cxx \
	$(OPAL_SRC_PATH)/h224/h323h224.cxx \
	$(OPAL_SRC_PATH)/h224/q922.cxx \
	$(OPAL_SRC_PATH)/h323/h235dh.cxx \
	$(OPAL_SRC_PATH)/h323/channels.cxx \
	$(OPAL_SRC_PATH)/h323/gkclient.cxx \
	$(OPAL_SRC_PATH)/h323/gkserver.cxx \
	$(OPAL_SRC_PATH)/h323/h225ras.cxx \
	$(OPAL_SRC_PATH)/h323/h235auth.cxx \
	$(OPAL_SRC_PATH)/h323/h235auth1.cxx \
	$(OPAL_SRC_PATH)/h323/h323.cxx \
	$(OPAL_SRC_PATH)/h323/h323annexg.cxx \
	$(OPAL_SRC_PATH)/h323/h323caps.cxx \
	$(OPAL_SRC_PATH)/h323/h323ep.cxx \
	$(OPAL_SRC_PATH)/h323/h323neg.cxx \
	$(OPAL_SRC_PATH)/h323/h323pdu.cxx \
	$(OPAL_SRC_PATH)/h323/h323rtp.cxx \
	$(OPAL_SRC_PATH)/h323/h323trans.cxx \
	$(OPAL_SRC_PATH)/h323/h450pdu.cxx \
	$(OPAL_SRC_PATH)/h323/h501pdu.cxx \
	$(OPAL_SRC_PATH)/h323/peclient.cxx \
	$(OPAL_SRC_PATH)/h323/q931.cxx \
	$(OPAL_SRC_PATH)/h323/svcctrl.cxx \
	$(OPAL_SRC_PATH)/h323/transaddr.cxx \
	$(OPAL_SRC_PATH)/h460/h4601.cxx \
	$(OPAL_SRC_PATH)/h460/h46018.cxx \
	$(OPAL_SRC_PATH)/h460/h46019.cxx \
	$(OPAL_SRC_PATH)/h460/h4609.cxx \
	$(OPAL_SRC_PATH)/h460/h460p.cxx \
	$(OPAL_SRC_PATH)/h460/h460pres.cxx \
	$(OPAL_SRC_PATH)/h460/h460tm.cxx \
	$(OPAL_SRC_PATH)/h460/h460_std19.cxx \
	$(OPAL_SRC_PATH)/h460/h46024b.cxx \
	$(OPAL_SRC_PATH)/h460/h460_std18.cxx \
	$(OPAL_SRC_PATH)/h460/h460_std23.cxx \
	$(OPAL_SRC_PATH)/h460/h460_std24.cxx \
	$(OPAL_SRC_PATH)/iax2/callprocessor.cxx \
	$(OPAL_SRC_PATH)/iax2/frame.cxx \
	$(OPAL_SRC_PATH)/iax2/iax2con.cxx \
	$(OPAL_SRC_PATH)/iax2/iax2ep.cxx \
	$(OPAL_SRC_PATH)/iax2/iax2medstrm.cxx \
	$(OPAL_SRC_PATH)/iax2/iedata.cxx \
	$(OPAL_SRC_PATH)/iax2/ies.cxx \
	$(OPAL_SRC_PATH)/iax2/processor.cxx \
	$(OPAL_SRC_PATH)/iax2/receiver.cxx \
	$(OPAL_SRC_PATH)/iax2/regprocessor.cxx \
	$(OPAL_SRC_PATH)/iax2/remote.cxx \
	$(OPAL_SRC_PATH)/iax2/safestrings.cxx \
	$(OPAL_SRC_PATH)/iax2/sound.cxx \
	$(OPAL_SRC_PATH)/iax2/specialprocessor.cxx \
	$(OPAL_SRC_PATH)/iax2/transmit.cxx \
	$(OPAL_SRC_PATH)/im/im_mf.cxx \
	$(OPAL_SRC_PATH)/im/msrp.cxx \
	$(OPAL_SRC_PATH)/im/rfc4103.cxx \
	$(OPAL_SRC_PATH)/im/sipim.cxx \
	$(OPAL_SRC_PATH)/im/t140.cxx \
	$(OPAL_SRC_PATH)/lids/lid.cxx \
	$(OPAL_SRC_PATH)/lids/lidep.cxx \
	$(OPAL_SRC_PATH)/lids/lidpluginmgr.cxx \
	$(OPAL_SRC_PATH)/opal/mediasession.cxx \
	$(OPAL_SRC_PATH)/opal/call.cxx \
	$(OPAL_SRC_PATH)/opal/connection.cxx \
	$(OPAL_SRC_PATH)/opal/console_mgr.cxx \
	$(OPAL_SRC_PATH)/opal/endpoint.cxx \
	$(OPAL_SRC_PATH)/opal/guid.cxx \
	$(OPAL_SRC_PATH)/opal/manager.cxx \
	$(OPAL_SRC_PATH)/opal/mediafmt.cxx \
	$(OPAL_SRC_PATH)/opal/mediastrm.cxx \
	$(OPAL_SRC_PATH)/opal/mediatype.cxx \
	$(OPAL_SRC_PATH)/opal/opal_c.cxx \
	$(OPAL_SRC_PATH)/opal/patch.cxx \
	$(OPAL_SRC_PATH)/opal/pres_ent.cxx \
	$(OPAL_SRC_PATH)/opal/recording.cxx \
	$(OPAL_SRC_PATH)/opal/transcoders.cxx \
	$(OPAL_SRC_PATH)/opal/transports.cxx \
	$(OPAL_SRC_PATH)/sip/handlers.cxx \
	$(OPAL_SRC_PATH)/sip/sdp.cxx \
	$(OPAL_SRC_PATH)/sip/sipcon.cxx \
	$(OPAL_SRC_PATH)/sip/sipep.cxx \
	$(OPAL_SRC_PATH)/sip/sippdu.cxx \
	$(OPAL_SRC_PATH)/sip/sippres.cxx \
	$(OPAL_SRC_PATH)/t38/h323t38.cxx \
	$(OPAL_SRC_PATH)/t38/sipt38.cxx \
	$(OPAL_SRC_PATH)/t38/t38mf.cxx \
	$(OPAL_SRC_PATH)/t38/t38proto.cxx

# LOCAL_H264_FILES := $(H264_SRC_PATH)/ipp264codec.cpp

LOCAL_STATIC_LIBRARIES := libptlibs
LOCAL_MODULE := libopals

include $(BUILD_STATIC_LIBRARY)
##################################################################

#####################OPAL SHARE LIBRARY COMPILE###################
include $(CLEAR_VARS)

LOCAL_MODULE := libandopal
LOCAL_SRC_FILES := opal-jni.cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/../../opal/include \
	$(TARGET_C_INCLUDES)

LOCAL_STATIC_LIBRARIES := libptlibs
LOCAL_STATIC_LIBRARIES += libopals

LOCAL_LDLIBS := -lOpenSLES -ldl -lc -lm -llog -lgcc
#LOCAL_LDFLAGS := -nostdlib -Wl,--no-undefined  

include $(BUILD_SHARED_LIBRARY)

#$(call import-module, libptlibs)
#$(call import-module, libopals)
##################################################################