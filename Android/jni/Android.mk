LOCAL_PATH := $(call my-dir)

#$(warning $(TARGET_C_INCLUDES))

##################PTLIB STATIC LIBRARY COMPILE##################
include $(CLEAR_VARS)

LOCAL_MODULE := libptlibs

SDL_PATH := SDL2-2.0.1

#LOCAL_EXPORT_C_INCLUDES := ../include
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/$(SDL_PATH)/include \
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


OPAL_SRC_PATH := ../../opal/src
H264_SRC_PATH := $(OPAL_SRC_PATH)/codec/ipp264codec
H264_DEC_PATH := $(OPAL_SRC_PATH)/codec/ipp264codec/codec/h264_dec/src
H261_SRC_PATH := ../../opal/plugins/video/H.261-vic

#LOCAL_EXPORT_C_INCLUDES := ../include
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include\
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/../../opal/include \
	$(TARGET_C_INCLUDES)

AAC_SRC_PATH := $(OPAL_SRC_PATH)/codec/aac

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

# $(H264_SRC_PATH)/ipp264codec.cpp 
LOCAL_H264_FILES := $(H264_SRC_PATH)/h264decode.asm

LOCAL_H261_FILES := 	$(H261_SRC_PATH)/h261vic.cxx \
			$(H261_SRC_PATH)/vic/bv.c \
			$(H261_SRC_PATH)/vic/dct.cxx \
			$(H261_SRC_PATH)/vic/encoder-h261.cxx \
			$(H261_SRC_PATH)/vic/huffcode.c \
			$(H261_SRC_PATH)/vic/p64.cxx \
			$(H261_SRC_PATH)/vic/p64encoder.cxx \
			$(H261_SRC_PATH)/vic/transmitter.cxx \
			$(H261_SRC_PATH)/vic/vid_coder.cxx

LOCAL_AAC_FILES := $(AAC_SRC_PATH)/codec/fixpt/decoder/aacdec.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/aactabs.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/pns.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/stproc.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/tns.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/buffers.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/decelmnt.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/dequant.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/filefmt.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/imdct.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/noiseless.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/bitstream.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/dct4.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/fft.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/huffman.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/hufftabs.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbr.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrfft.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrfreq.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrhfadj.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrhfgen.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrhuff.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrimdct.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrmath.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrqmf.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrside.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/sbrtabs.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/trigtabs.c \
			$(AAC_SRC_PATH)/codec/fixpt/decoder/real/trigtabs_fltgen.c \
			$(AAC_SRC_PATH)/common/src/aac_dec_api.c \
                        $(AAC_SRC_PATH)/common/src/aac_dec_stream_elements.c \
                        $(AAC_SRC_PATH)/common/src/aac_enc_elements.c \
                        $(AAC_SRC_PATH)/common/src/aac_enc_huff_tables.c \
                        $(AAC_SRC_PATH)/common/src/aac_enc_search.c \
                        $(AAC_SRC_PATH)/common/src/aac_filterbank_fp.c \
                        $(AAC_SRC_PATH)/common/src/aac_sfb_tables.c \
                        $(AAC_SRC_PATH)/common/src/aac_win_tables_fp.c \
                        $(AAC_SRC_PATH)/common/src/aaccmn_adif.c \
                        $(AAC_SRC_PATH)/common/src/aaccmn_adts.c \
                        $(AAC_SRC_PATH)/common/src/aaccmn_chmap.c \
                        $(AAC_SRC_PATH)/common/src/aaccmn_huff.c \
                        $(AAC_SRC_PATH)/common/src/mp4cmn_config.c \
                        $(AAC_SRC_PATH)/common/src/mp4cmn_const.c \
                        $(AAC_SRC_PATH)/common/src/mp4cmn_pce.c \
                        $(AAC_SRC_PATH)/common/src/ps_dec_parser.c \
                        $(AAC_SRC_PATH)/common/src/ps_huff_tabs.c \
                        $(AAC_SRC_PATH)/common/src/sbr_dec_env_decoding.c \
                        $(AAC_SRC_PATH)/common/src/sbr_dec_parser.c \
                        $(AAC_SRC_PATH)/common//src/sbr_dec_reset.c \
                        $(AAC_SRC_PATH)/common/src/sbr_freq_tabs.c \
                        $(AAC_SRC_PATH)/common/src/sbr_huff_tabs.c \
                        $(AAC_SRC_PATH)/common/src/sbr_pow_vec.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_api_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_decoding_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_huff_tables_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_ltp_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_ps_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_sbr_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_ssr_fp.c \
                        $(AAC_SRC_PATH)/dec/src/aac_dec_tns_fp.c \
                        $(AAC_SRC_PATH)/dec/src/als_dec_api.c \
                        $(AAC_SRC_PATH)/dec/src/als_dec_parsers.c \
                        $(AAC_SRC_PATH)/dec/src/als_dec_reconstruct.c \
                        $(AAC_SRC_PATH)/dec/src/als_dec_tables.c \
                        $(AAC_SRC_PATH)/dec/src/bsac_dec_api.c \
                        $(AAC_SRC_PATH)/dec/src/bsac_dec_tables.c \
                        $(AAC_SRC_PATH)/dec/src/ps_dec_tabs_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_dequant_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_filter_qmf_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_hf_adjust_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_hf_gen_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_noise_tabs_fp.c \
                        $(AAC_SRC_PATH)/dec/src/sbr_dec_qmf_tabs_fp.c \
                        $(AAC_SRC_PATH)/dec/src/umc_aac_decoder.cpp

SDL_PATH := SDL2-2.0.1
SDL_SRC_PATH := $(SDL_PATH)/src

LOCAL_SDL_FILES :=  	$(PTCLIB_SRC_PATH)/vsdl.cxx \
			$(SDL_SRC_PATH)/SDL.c \
			$(SDL_SRC_PATH)/core/android/SDL_android.c \
			$(SDL_SRC_PATH)/SDL_assert.c \
                        $(SDL_SRC_PATH)/SDL_error.c \
                        $(SDL_SRC_PATH)/SDL_hints.c \
                        $(SDL_SRC_PATH)/SDL_log.c \
                        $(SDL_SRC_PATH)/atomic/SDL_atomic.c \
			$(SDL_SRC_PATH)/atomic/SDL_spinlock.c \
			$(SDL_SRC_PATH)/audio/SDL_audio.c \
                        $(SDL_SRC_PATH)/audio/SDL_audiocvt.c \
                        $(SDL_SRC_PATH)/audio/SDL_audiodev.c \
                        $(SDL_SRC_PATH)/audio/SDL_audiotypecvt.c \
                        $(SDL_SRC_PATH)/audio/SDL_mixer.c \
                        $(SDL_SRC_PATH)/audio/SDL_wave.c \
			$(SDL_SRC_PATH)/audio/dummy/SDL_dummyaudio.c \
			$(SDL_SRC_PATH)/audio/android/SDL_androidaudio.c \
			$(SDL_SRC_PATH)/cpuinfo/SDL_cpuinfo.c \
                        $(SDL_SRC_PATH)/events/SDL_clipboardevents.c \
                        $(SDL_SRC_PATH)/events/SDL_dropevents.c \
                        $(SDL_SRC_PATH)/events/SDL_events.c \
                        $(SDL_SRC_PATH)/events/SDL_gesture.c \
                        $(SDL_SRC_PATH)/events/SDL_keyboard.c \
                        $(SDL_SRC_PATH)/events/SDL_mouse.c \
                        $(SDL_SRC_PATH)/events/SDL_quit.c \
                        $(SDL_SRC_PATH)/events/SDL_touch.c \
                        $(SDL_SRC_PATH)/events/SDL_windowevents.c \
                        $(SDL_SRC_PATH)/file/SDL_rwops.c \
                        $(SDL_SRC_PATH)/haptic/SDL_haptic.c \
                        $(SDL_SRC_PATH)/haptic/dummy/SDL_syshaptic.c \
                        $(SDL_SRC_PATH)/joystick/SDL_gamecontroller.c \
                        $(SDL_SRC_PATH)/joystick/SDL_joystick.c \
                        $(SDL_SRC_PATH)/joystick/android/SDL_sysjoystick.c \
                        $(SDL_SRC_PATH)/loadso/dummy/SDL_sysloadso.c \
			$(SDL_SRC_PATH)/power/SDL_power.c \
                        $(SDL_SRC_PATH)/power/android/SDL_syspower.c \
                        $(SDL_SRC_PATH)/filesystem/dummy/SDL_sysfilesystem.c \
                        $(SDL_SRC_PATH)/render/SDL_render.c \
                        $(SDL_SRC_PATH)/render/SDL_yuv_mmx.c \
                        $(SDL_SRC_PATH)/render/SDL_yuv_sw.c \
                        $(SDL_SRC_PATH)/render/software/SDL_blendfillrect.c \
                        $(SDL_SRC_PATH)/render/software/SDL_blendline.c \
                        $(SDL_SRC_PATH)/render/software/SDL_blendpoint.c \
                        $(SDL_SRC_PATH)/render/software/SDL_drawline.c \
                        $(SDL_SRC_PATH)/render/software/SDL_drawpoint.c \
                        $(SDL_SRC_PATH)/render/software/SDL_render_sw.c \
                        $(SDL_SRC_PATH)/render/software/SDL_rotate.c \
			$(SDL_SRC_PATH)/render/opengles2/SDL_render_gles2.c \
                        $(SDL_SRC_PATH)/render/opengles2/SDL_shaders_gles2.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_getenv.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_iconv.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_malloc.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_qsort.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_stdlib.c \
                        $(SDL_SRC_PATH)/stdlib/SDL_string.c \
                        $(SDL_SRC_PATH)/thread/SDL_thread.c \
                        $(SDL_SRC_PATH)/thread/generic/SDL_sysmutex.c \
                        $(SDL_SRC_PATH)/thread/generic/SDL_syssem.c \
                        $(SDL_SRC_PATH)/thread/generic/SDL_systhread.c \
                        $(SDL_SRC_PATH)/thread/generic/SDL_systls.c \
			$(SDL_SRC_PATH)/thread/generic/SDL_syscond.c \
                        $(SDL_SRC_PATH)/timer/SDL_timer.c \
                        $(SDL_SRC_PATH)/timer/unix/SDL_systimer.c \
                        $(SDL_SRC_PATH)/video/SDL_RLEaccel.c \
                        $(SDL_SRC_PATH)/video/SDL_blit.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_0.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_1.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_A.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_N.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_auto.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_copy.c \
                        $(SDL_SRC_PATH)/video/SDL_blit_slow.c \
                        $(SDL_SRC_PATH)/video/SDL_bmp.c \
                        $(SDL_SRC_PATH)/video/SDL_clipboard.c \
                        $(SDL_SRC_PATH)/video/SDL_egl.c \
                        $(SDL_SRC_PATH)/video/SDL_fillrect.c \
                        $(SDL_SRC_PATH)/video/SDL_pixels.c \
                        $(SDL_SRC_PATH)/video/SDL_rect.c \
                        $(SDL_SRC_PATH)/video/SDL_shape.c \
                        $(SDL_SRC_PATH)/video/SDL_stretch.c \
                        $(SDL_SRC_PATH)/video/SDL_surface.c \
                        $(SDL_SRC_PATH)/video/SDL_video.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidclipboard.c \
			$(SDL_SRC_PATH)/video/android/SDL_androidevents.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidgl.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidkeyboard.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidtouch.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidvideo.c \
                        $(SDL_SRC_PATH)/video/android/SDL_androidwindow.c 

LOCAL_H264_DEC_FILES := $(H264_DEC_PATH)/umc_h264_dec_bitstream.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_bitstream_cabac.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_conversion.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_decode_pic.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_defs_yuv.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_ippwrap.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_sei.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_slice_decoder_decode_pic.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_tables.cpp \
                        $(H264_DEC_PATH)/umc_h264_dec_tables_cabac.cpp \
                        $(H264_DEC_PATH)/umc_h264_direct_pred.cpp \
                        $(H264_DEC_PATH)/umc_h264_frame.cpp \
                        $(H264_DEC_PATH)/umc_h264_frame_list.cpp \
                        $(H264_DEC_PATH)/umc_h264_heap.cpp \
                        $(H264_DEC_PATH)/umc_h264_log.cpp \
                        $(H264_DEC_PATH)/umc_h264_nal_spl.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_cabac_mt.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_cavlc_mt.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_deblocking.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_deblocking_mbaff.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_deblocking_prepare.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_deblocking_table.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_decode_mb.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_decode_mb_cabac.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_decode_mb_types.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_decode_mb_types_cabac.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_hp.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_mblevel_calc.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_mt.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_decoder_mt_reconstruct_mv.cpp \
                        $(H264_DEC_PATH)/umc_h264_segment_store.cpp \
                        $(H264_DEC_PATH)/umc_h264_slice_decoding.cpp \
                        $(H264_DEC_PATH)/umc_h264_task_broker.cpp \
                        $(H264_DEC_PATH)/umc_h264_task_supplier.cpp \
                        $(H264_DEC_PATH)/umc_h264_thread.cpp


#LOCAL_PLAYER_FILES :=  $(OPAL_SRC_PATH)/player/mpeg2ts.cxx \
			$(OPAL_SRC_PATH)/player/udplistener.cxx \
			$(OPAL_SRC_PATH)/player/audio.cxx

#LOCAL_PLAYER_FILES +=	$(OPAL_SRC_PATH)/player/h264TSDec.cxx $(LOCAL_H264_DEC_FILES) 
#LOCAL_PLAYER_FILES +=	$(LOCAL_H264_FILES)

LOCAL_STATIC_LIBRARIES := libptlibs
LOCAL_MODULE := libopals

include $(BUILD_STATIC_LIBRARY)
##################################################################

##################OPAL STATIC LIBRARY COMPILE###################
#include $(CLEAR_VARS)
#LOCAL_STATIC_LIBRARIES := libptlibs 
#LOCAL_MODULE := libh263

##LOCAL_ARM_MODE := arm
##APP_ABI := armeabi armeabi-v7a

H263_SRC_PATH := ../../opal/src/codec/ipp263codec
IPPCOMMON_SRC_PATH := ../../opal/src/codec/common

IPPASM_SRC_PATH := ../../opal/src/ipp

H263_INCLUDE := \
	$(LOCAL_PATH)/../../opal/src/codec/common \
	$(LOCAL_PATH)/../../opal/src/codec/ipp263codec/h263_dec/include \
	$(LOCAL_PATH)/../../opal/src/codec/ipp263codec/h263_enc/include \
	$(LOCAL_PATH)/../../opal/src/ipp 

H263_LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/../../opal/include \
	$(LOCAL_PATH)/../../opal/include/ipp \
	$(LOCAL_PATH)/../../opal/include/umc \
	$(LOCAL_PATH)/../../opal/include/h264/umc \
	$(LOCAL_PATH)/../../opal/src/codec/aac/codec/fixpt/decoder/pub \
	$(H263_INCLUDE)

UMC_SRC_PATH = $(OPAL_SRC_PATH)/umc
VM_SRC_PATH = $(OPAL_SRC_PATH)/vm/unix

LOCAL_IPP_FILES := \
	$(UMC_SRC_PATH)/umc_base_codec.cpp \
	$(UMC_SRC_PATH)/umc_default_memory_allocator.cpp \
	$(UMC_SRC_PATH)/umc_media_data.cpp \
	$(UMC_SRC_PATH)/umc_video_data.cpp \
	$(UMC_SRC_PATH)/umc_video_decoder.cpp \
	$(VM_SRC_PATH)/vm_debug_linux32.c 

LOCAL_IPP_COMMON_FILES := \
	$(IPPCOMMON_SRC_PATH)/ippCode.cpp \
	$(IPPCOMMON_SRC_PATH)/ippMem.cpp \
	$(IPPCOMMON_SRC_PATH)/ippStatusToText.cpp

LOCAL_H263_FILES := \
	$(IPPASM_SRC_PATH)/ippslib.s \
	$(H263_SRC_PATH)/ipp263codec.cpp \
	$(H263_SRC_PATH)/h263_dec/src/h263decframe.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decframe_ei.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decframe_ep.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decframeb.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decframei.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decframep.c \
	$(H263_SRC_PATH)/h263_dec/src/h263decfuncs.c \
	$(H263_SRC_PATH)/h263_dec/src/h263parse.c \
	$(H263_SRC_PATH)/h263_dec/src/h263stream.c \
	$(H263_SRC_PATH)/h263_dec/src/h263tbl.c \
	$(H263_SRC_PATH)/h263_dec/src/umc_h263_video_decoder.cpp \
	$(H263_SRC_PATH)/h263_enc/src/h263_enc_bitstream.cpp \
	$(H263_SRC_PATH)/h263_enc/src/h263_enc_frame.cpp \
	$(H263_SRC_PATH)/h263_enc/src/h263_enc_headers.cpp \
	$(H263_SRC_PATH)/h263_enc/src/h263_enc_misc.cpp \
	$(H263_SRC_PATH)/h263_enc/src/h263_enc_tables.cpp \
	$(H263_SRC_PATH)/h263_enc/src/umc_h263_video_encoder.cpp

H263_LOCAL_SRC_FILES := $(LOCAL_H263_FILES)

#include $(BUILD_STATIC_LIBRARY)
##################################################################



#####################OPAL SHARE LIBRARY COMPILE###################
include $(CLEAR_VARS)

##LOCAL_ARM_MODE := arm
##APP_ABI := armeabi armeabi-v7a

#APP_CFLAGS += -Wno-error=format-security

LOCAL_MODULE := libandopal
LOCAL_SRC_FILES := opal-jni.cpp \
			$(OPAL_SRC_PATH)/player/codectest.cxx \
			$(OPAL_SRC_PATH)/player/video.cxx \
			$(OPAL_SRC_PATH)/player/yuv2rgb.cxx \
			$(LOCAL_H261_FILES) \
			$(LOCAL_H263_FILES) \
			$(LOCAL_IPP_COMMON_FILES) \
			$(LOCAL_IPP_FILES)


#LOCAL_SRC_FILES += $(LOCAL_SDL_FILES) 
#LOCAL_SRC_FILES += $(LOCAL_AAC_FILES)
#LOCAL_SRC_FILES += $(LOCAL_PLAYER_FILES)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../../ptlib/include \
	$(LOCAL_PATH)/../../opal/include \
	$(LOCAL_PATH)/../../opal/include/ipp \
	$(LOCAL_PATH)/../../opal/include/umc \
	$(LOCAL_PATH)/../../opal/include/h264/umc \
	$(LOCAL_PATH)/../../opal/src/codec/aac/codec/fixpt/decoder/pub \
	$(LOCAL_PATH)/../../opal/plugins/video/common \
	$(H263_INCLUDE) \
	$(LOCAL_PATH)/$(SDL_PATH)/include \
	$(TARGET_C_INCLUDES)

LOCAL_STATIC_LIBRARIES := libptlibs
LOCAL_STATIC_LIBRARIES += libopals
LOCAL_STATIC_LIBRARIES += android_native_app_glue 

LOCAL_CFLAGS += -DANDROID -DTARGET_IPHONE_SIMULATOR=0
# -Werror=format-security
LOCAL_LDLIBS := -lOpenSLES -ldl -lc -lm -llog -lgcc -landroid -lEGL -lGLESv2
#LOCAL_LDFLAGS := -nostdlib -Wl,--no-undefined 

LOCAL_CPP_FEATURES += exceptions
#LOCAL_ALLOW_UNDEFINED_SYMBOLS := true

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

#$(call import-module, libptlibs)
#$(call import-module, libopals)
##################################################################
