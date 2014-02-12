/*
 *  BoneCodecTest.cpp
 *  BoneLib
 *
 *  Created by Sergey Bezruchkin and Yuri Kiryanov.
 *  Copyright 2008-2013 Dinsk. All rights reserved.
 *
 */

#include <ptlib.h>
#include <math.h>
#include <rtp/rtpconn.h>

#include <codec/vidcodec.h>
#include <codec/opalpluginmgr.h>

#include <player/codectest.h>

// #include "ippdefs.h"

#include <player/udplistener.h>

int codecTestTraceLevel = 5;

extern "C" {
unsigned int Opal_StaticCodec_VIC_H261_GetAPIVersion();
struct PluginCodec_Definition * Opal_StaticCodec_VIC_H261_GetCodecs(unsigned * count, unsigned /*version*/);
};

#ifdef BONEPLAYER
#include <player/Mpeg2TS.h>

class Mpeg2TSListener : public UdpListener, public IPlaybackSource
{
public:
    static void yuv420PlaybackCallback(void* opaque, u8* pYUV, int frameWidth, int frameHeight)
    {
        Mpeg2TSListener* pThis = (Mpeg2TSListener*) opaque;
        if(pThis && pThis->isStarted() && pThis->getVideoDisplay())
        {
            PBoolean ok = (frameWidth >= 16 && frameHeight >= 16 && frameWidth < 65536 && frameHeight < 65536);
            if(ok)
                pThis->getVideoDisplay()->SetFrameSize(frameWidth, frameHeight);

            pThis->getVideoDisplay()->SetFrameData(0, 0, frameWidth, frameHeight, pYUV, PTrue);
        }
    }
    
    static void pcmPlaybackCallback(void* opaque, u8* pBuffer, unsigned nBufSize)
    {
        Mpeg2TSListener* pThis = (Mpeg2TSListener*) opaque;
        if(pThis && pThis->isStarted() && pThis->getAudioPlayer())
        {
            pThis->getAudioPlayer()->Write(pBuffer, nBufSize);
        }
    }
    
    static void onReceiveCallback(void* _opaque, u8* pData, uint nDataSize)
    {
        Mpeg2TSListener* pThis = (Mpeg2TSListener*) _opaque;
        if(pThis->isStarted())
            pThis->m_tsParser.processNetData((u8*) pData, nDataSize);
    }
    
    Mpeg2TSListener(BoneCodecTest* mgr): UdpListener(), _mgr(mgr)
    {
        this->_opaque = this;
        this->_onReceive = onReceiveCallback;
        
        m_tsParser._opaque = this;
        m_tsParser._yuv420PlaybackCallback = yuv420PlaybackCallback;
        m_tsParser._pcmPlaybackCallback = pcmPlaybackCallback;

#ifdef PLAYER_VIDEO
        m_tsParser._decoder = new H264TSVideoDecoder();
#endif
        
    }

    PVideoOutputDevice *getVideoDisplay() const
    {
        return _mgr->m_video.display;
    }
    
    PSoundChannel *getAudioPlayer() const
    {
        return _mgr->m_audio.player;
    }

    bool StartVideoDisplay() {
        
        return getVideoDisplay() ? getVideoDisplay()->Start() : false;
    }
    
    virtual int openSocket(u32 nIp, u16 nPort)
    {
        int nSocket =  UdpListener::openSocket(nIp, nPort);
        return nSocket;
    }
    
    // From IPlaybackSource
    virtual bool GotFrame(unsigned iTypeAudioVideo) { return true; }
    virtual bool GetFrame(unsigned iTypeAudioVideo, RTP_DataFrame & frame) { return true; }


private:
    friend class BoneCodecTest;
    BoneCodecTest* _mgr;
    Mpeg2TS m_tsParser;
};

#endif

#include <android/native_window.h>
extern ANativeWindow* _native_window;

BoneCodecTest::BoneCodecTest(const PString& pstrArguments, void* native_window)
: monitorThread(NULL),
	m_audio(this, 0),
	m_video(this, 0),
    m_pPlaybackBuf(NULL),
    m_nPlaybackBufSize(0),
    m_nPlaybackCurPos(0),
    m_nVideoRecSize(0),
    m_bAudioOnPlayback(false)
#ifdef BONEPLAYER
    //,m_rtpEP(NULL)
    ,m_udpListener(NULL)
#endif
{
    memset(m_pSyncPoint, 0, sizeof(m_pSyncPoint));
	m_arguments = pstrArguments;
    
	PFactory<PPluginModuleManager>::Worker<OpalPluginCodecManager>* pluginFactory =
    new PFactory<PPluginModuleManager>::Worker<OpalPluginCodecManager>("PluginCodecManager", true);
	OpalPluginCodecManager* pluginManager = PFactory<PPluginModuleManager>::CreateInstanceAs<OpalPluginCodecManager>("PluginCodecManager");

	printf("H.261 version: %d", Opal_StaticCodec_VIC_H261_GetAPIVersion());
	pluginManager->RegisterStaticCodec("H.261",
			Opal_StaticCodec_VIC_H261_GetAPIVersion,
						(PluginCodec_GetCodecFunction) Opal_StaticCodec_VIC_H261_GetCodecs);

	_native_window = (ANativeWindow*) native_window;

	monitorThread = PThread::Create(PCREATE_NOTIFIER(MonitorMain), "Bone Codec Test Monitor");
}

BoneCodecTest::~BoneCodecTest()
{
    //ShutDownEndpoints();
#ifdef BONEPLAYER
    if(m_udpListener)
    {
        m_udpListener->stop();
        m_udpListener->WaitForTermination(10000);
        delete m_udpListener;
        m_udpListener = NULL;
    }
#endif
    
    if(monitorThread)
	{
		monitorExit.Signal();
		PAssert(monitorThread->WaitForTermination(10000), "Bone Codec Test thread did not terminate!");
		delete monitorThread;
		monitorThread = NULL;
	}

    delete m_pSyncPoint[0];
    delete m_pSyncPoint[1];
    delete [] m_pPlaybackBuf;
    
}

void BoneCodecTest::MonitorMain(PThread &, INT)
{
	PArgList args(m_arguments);

	args.Parse("b-bit-rate:"
		"c-crop."
		"C-rate-control."
		"D-display-device:"
		"-display-driver:"
	    "-preview-device:"
	    "-preview-driver:"
		"-parent:"
		"F-audio-frames:"
		"G-grab-device:"
		"-grab-driver:"
		"-grab-format:"
		"-grab-channel:"
		"h-help."
		"m-suppress-marker."
		"M-force-marker."
		"O-option:"
		"p-payload-size:"
		"P-play-device:"
		"-play-driver:"
		"-play-buffers:"
		"r-frame-rate:"
		"R-record-device:"
		"-record-driver:"
		"s-frame-size:"
		"-playback-file:"
        "-listen-address:"
        "-listen-port:"
		"-snr."
		, FALSE);

	PTRACE(codecTestTraceLevel, "CodTest\tInitializing.");
    
    bool bAudio = false;
	bool bVideo = false;

	bool bNetworkPlayer = false;

    // Check network parameters
    if (args.HasOption("listen-address")) {
#ifdef BONEPLAYER
        
        PString strListenPort = "65000";
        m_listenFullAddress = args.GetOptionString("listen-address");
        if (m_listenFullAddress.IsEmpty())
            m_listenFullAddress = "*";
        
        if (args.HasOption("listen-port")) {
            strListenPort = args.GetOptionString("listen-port");
        }

        bNetworkPlayer = true;
        
        // Listen for broadcasts
        PIPSocket::Address ipa(m_listenFullAddress);
        m_udpListener = new Mpeg2TSListener(this);
        if(m_udpListener)
        {

#if PLAYER_VIDEO
        	m_video.SetPlaybackSource(m_udpListener);
            m_video.m_nPlaybackWidth = 640;
            m_video.m_nPlaybackHeight = 360;
            
            m_video.Initialise(args);
#endif
            
            NetIpAddress addr(ipa.Byte4(), ipa.Byte3(), ipa.Byte2(), ipa.Byte1(), atoi(strListenPort));
            m_udpListener->start(addr.nIp, addr.nPort);
            
            m_udpListener->StartVideoDisplay();
            m_udpListener->Resume();
                
            // wait for exit
            monitorExit.Wait();
        
        }
#endif
    }
    else
    {
            //bAudio = m_audio.Initialise(args);
            bVideo = m_video.Initialise(args);
        
        if (!bAudio && !bVideo)
            return;

        if (m_pPlaybackBuf != NULL) {
            if (bAudio) m_pSyncPoint[0] = new PSyncPoint();
            if (bVideo) m_pSyncPoint[1] = new PSyncPoint();
            BoneCodecTest::StartReadNextFrame();
        }

        PTRACE(codecTestTraceLevel, "CodTest\tInitialized, resuming...");
        
        if (bAudio) m_audio.Resume();
        if (bVideo) m_video.Resume();
        
        // wait for exit
        monitorExit.Wait();
    }
    
	PTRACE(codecTestTraceLevel, "CodTest\tExiting.");
    
    if (m_pPlaybackBuf) {
        m_nPlaybackCurPos = m_nPlaybackBufSize;
        
        if (m_pSyncPoint[0] != NULL)
            m_pSyncPoint[0]->Signal();
        
        if (m_pSyncPoint[1] != NULL)
            m_pSyncPoint[1]->Signal();
    }

	if (bAudio) m_audio.Stop();
	if (bVideo) m_video.Stop();

	if (bAudio) m_audio.WaitForTermination();
	if (bVideo) m_video.WaitForTermination();
}

int TranscoderThread::InitialiseCodec(PArgList & args, const OpalMediaFormat & rawFormat)
{
	if (args.HasOption('m'))
		markerHandling = SuppressMarkers;
	else if (args.HasOption('M'))
		markerHandling = ForceMarkers;

	framesToTranscode = -1;
	PString s = args.GetOptionString("count");
	if (!s.IsEmpty())
		framesToTranscode = s.AsInteger();

	calcSNR = args.HasOption("snr");

	PTRACE(codecTestTraceLevel, "Args: '" << setfill('\n') << args << "'");

	for (PINDEX i = 0; i < args.GetCount(); i++) {
		OpalMediaFormat mediaFormat = args[i];
		if (mediaFormat.IsEmpty()) {
			PTRACE(codecTestTraceLevel, "Unknown media format name \"" << args[i] << '"');
			return 0;
		}

		if (mediaFormat.GetMediaType() == rawFormat.GetMediaType()) {
			if (rawFormat == mediaFormat) {
				decoder = NULL;
				encoder = NULL;
			}
			else {
				OpalMediaFormat adjustedRawFormat = rawFormat;
				if (rawFormat == OpalPCM16) {
					if (mediaFormat.GetClockRate() != rawFormat.GetClockRate())
						adjustedRawFormat = OpalPCM16_16KHZ;
					if (args.HasOption('F')) {
						unsigned fpp = args.GetOptionString('F').AsUnsigned();
						if (fpp > 0)
							mediaFormat.SetOptionInteger(OpalAudioFormat::TxFramesPerPacketOption(), fpp);
					}
				}


                if ((encoder = BoneOpalTranscoder::Create(adjustedRawFormat, mediaFormat)) == NULL) {
                    PTRACE(codecTestTraceLevel, "Could not create encoder for media format \"" << mediaFormat << '"');
                    return false;
                }

				if ((decoder = BoneOpalTranscoder::Create(mediaFormat, adjustedRawFormat)) == NULL) {
					PTRACE(codecTestTraceLevel, "Could not create decoder for media format \"" << mediaFormat << '"');
					return false;
				}
			}

			return -1;
		}
	}

	return 1;
}


void TranscoderThread::SetOptions(PArgList & args, OpalMediaFormat & mediaFormat)
{
	PStringArray options = args.GetOptionString('O').Lines();
	for (PINDEX opt = 0; opt < options.GetSize(); ++opt) {
		PString option = options[opt];
		PINDEX equal = option.Find('=');
		if (equal == P_MAX_INDEX)
			PTRACE(codecTestTraceLevel, "Error\tIllegal option \"" << option << "\" used.");
		else {
			PString name = option.Left(equal);
			PString value = option.Mid(equal+1);
			if (mediaFormat.SetOptionValue(name, value))
				PTRACE(codecTestTraceLevel, "Option \"" << name << "\" set to \"" << value << "\".");
			else
				PTRACE(codecTestTraceLevel, "Error\tCould not set option \"" << name << "\" to \"" << value << "\".");
		}
	}

	mediaFormat.ToCustomisedOptions();
}

static int udiff(unsigned int const subtrahend, unsigned int const subtractor) 
{
	return subtrahend - subtractor;
}


static double square(double const arg) 
{
	return(arg*arg);
}

static double CalcSNR(const BYTE * src1, const BYTE * src2, PINDEX dataLen)
{
	double diff2 = 0.0;
	for (PINDEX i = 0; i < dataLen; ++i) 
		diff2 += square(udiff(*src1++, *src2++));

	double const snr = diff2 / dataLen / 255;

	return snr;
}

bool AudioThread::Initialise(PArgList & args)
{
	switch (InitialiseCodec(args, OpalPCM16)) {
	case 0 :
		return false;
	case 1 :
		return true;
	}

	OpalMediaFormat mediaFormat;
	
    if (!IsPlaybackMode()) 
    {
	    readSize = encoder != NULL ? encoder->GetOptimalDataFrameSize(TRUE) : 480;
		OpalMediaFormat mediaFormat = encoder != NULL ? encoder->GetOutputFormat() : OpalPCM16;

	    PTRACE(codecTestTraceLevel, "Audio media format set to " << mediaFormat);

	    // Audio recorder
	    PString driverName = args.GetOptionString("record-driver");
	    PString deviceName = args.GetOptionString("record-device");

	    recorder = PSoundChannel::CreateOpenedChannel(driverName, deviceName, PSoundChannel::Recorder, 1, mediaFormat.GetClockRate());
	    if (recorder == NULL) {
#if PTRACING
		    PTRACE(codecTestTraceLevel, "Error\tCannot use ");
		    if (driverName.IsEmpty() && deviceName.IsEmpty())
            {PTRACE(codecTestTraceLevel, "Error\tdefault ");}
		    PTRACE(codecTestTraceLevel, "audio recorder");
		    if (!driverName)
            {PTRACE(codecTestTraceLevel, "Error\t, driver \"" << driverName << '"');}
		    if (!deviceName)
            {PTRACE(codecTestTraceLevel, "Error\tdevice \"" << deviceName << '"');}
		    PTRACE(codecTestTraceLevel, "Error\tmust be one of:");
		    PStringList devices = PSoundChannel::GetDriversDeviceNames("*", PSoundChannel::Recorder);
		    for (PINDEX i = 0; i < devices.GetSize(); i++)
			    PTRACE(codecTestTraceLevel, "Error\t   " << devices[i]);
#endif
		    return false;
	    }

	    unsigned bufferCount = args.GetOptionString("record-buffers", "8").AsUnsigned();

	    PTRACE(codecTestTraceLevel, "Audio Recorder ");
	    if (!driverName.IsEmpty())
        {PTRACE(codecTestTraceLevel, "driver \"" << driverName << "\" and ");}

	    PTRACE(codecTestTraceLevel, "device \"" << recorder->GetName() << "\" using "
		    << bufferCount << 'x' << readSize << " byte buffers ");

	    if (!recorder->SetBuffers(readSize, bufferCount)) {
		    PTRACE(codecTestTraceLevel, "could not be set.");
		    return false;
	    }

	    PTRACE(codecTestTraceLevel, "opened and initialised.");
    }

	// Audio player
	PString driverName = args.GetOptionString("play-driver");
	PString deviceName = args.GetOptionString("play-device");

	player = PSoundChannel::CreateOpenedChannel(driverName, deviceName, PSoundChannel::Player);
	if (player == NULL) {
		PTRACE(codecTestTraceLevel, "Error\tCannot use ");
		if (driverName.IsEmpty() && deviceName.IsEmpty())
        {PTRACE(codecTestTraceLevel, "Error\tdefault ");}
		PTRACE(codecTestTraceLevel, "Error\taudio player");
		if (!driverName)
        {PTRACE(codecTestTraceLevel, "Error\tdriver \"" << driverName << '"');}
		if (!deviceName)
        {PTRACE(codecTestTraceLevel, "Error\t, device \"" << deviceName << '"');}
		PTRACE(codecTestTraceLevel, "Error\t, must be one of:");
		PStringList devices = PSoundChannel::GetDriversDeviceNames("*", PSoundChannel::Player);
		for (PINDEX i = 0; i < devices.GetSize(); i++)
			PTRACE(codecTestTraceLevel, "Error\t   " << devices[i]);

		return false;
	}

	unsigned bufferCount = args.GetOptionString("play-buffers", "8").AsUnsigned();

	PTRACE(codecTestTraceLevel, "Audio Player ");
	if (!driverName.IsEmpty())
    {PTRACE(codecTestTraceLevel, "driver \"" << driverName << "\" and ");}

	PTRACE(codecTestTraceLevel, "device \"" << player->GetName() << "\" using "
		<< bufferCount << 'x' << readSize << " byte buffers ");

	if (!player->SetBuffers(readSize, bufferCount)) {
		PTRACE(codecTestTraceLevel, "could not be set.");
		return false;
	}

	if (encoder == NULL) 
		frameTime = mediaFormat.GetFrameTime();
	else {
		OpalMediaFormat mediaFormat = encoder->GetOutputFormat();
		SetOptions(args, mediaFormat);
		encoder->UpdateMediaFormats(OpalMediaFormat(), mediaFormat);
	}

	PTRACE(codecTestTraceLevel, "opened and initialised.");

	return true;
}

bool VideoThread::Initialise(PArgList & args)
{
	PString deviceName;
	PString driverName;
	
	switch (InitialiseCodec(args, OpalYUV420P)) {
	case 0 :
		return false;
	case 1 :
		return true;
	}

	OpalMediaFormat mediaFormat = encoder != NULL ? encoder->GetOutputFormat() : OpalYUV420P;

	// Configure sizes/speeds
	unsigned width = 352, height = 288;
	if (args.HasOption("frame-size")) {
		PString sizeString = args.GetOptionString("frame-size");
		if (!PVideoFrameInfo::ParseSize(sizeString, width, height)) {
			PTRACE(codecTestTraceLevel, "Error\tIllegal video frame size \"" << sizeString << '"');
			return false;
		}
	}

    PTRACE(codecTestTraceLevel, "CodTest\tVideo media format set to " << mediaFormat);

    if (!IsPlaybackMode())
    {
        PVideoDevice::OpenArgs grabberArgs;
        grabberArgs.deviceName = args.GetOptionString("grab-device");
        grabberArgs.driverName = args.GetOptionString("grab-driver");
        grabberArgs.videoFormat = PVideoDevice::Auto;
        grabberArgs.width = 352;
        grabberArgs.height = 288;
        grabberArgs.channelNumber = 0;
        grabberArgs.rate = 30;

        grabberArgs.width = width;
        grabberArgs.height = height;

        grabber = PVideoInputDevice::CreateDeviceByName(grabberArgs.deviceName, grabberArgs.driverName, 0);
        if(grabber != NULL)
        {
            grabber->SetFrameSize(width, height);

            if( !grabber->Open(grabberArgs.deviceName) )
            {
                PTRACE(1, "Cannot open device '" << grabberArgs.deviceName << "', try fake.");
                delete grabber;

                grabber = PVideoInputDevice::CreateOpenedDevice("fakevideo", "fake", FALSE);
                if( grabber == NULL )
                {
                    PTRACE(1, "Cannot open capture device 'fake', exiting.");
                    return false;
                }

                // Set channel 2
                grabber->SetChannel(2);
            }
        }
        
        if (grabber == NULL) {
            PTRACE(codecTestTraceLevel, "Error\tCannot use ");
            if (driverName.IsEmpty() && deviceName.IsEmpty())
            {PTRACE(codecTestTraceLevel, "Error\tdefault ");}
            PTRACE(codecTestTraceLevel, "Error\tcapture device");
            if (!driverName)
            {PTRACE(codecTestTraceLevel, "Error\tdriver \"" << driverName << '"');}
            if (!deviceName)
            {PTRACE(codecTestTraceLevel, "Error\t, device \"" << deviceName << '"');}
            PTRACE(codecTestTraceLevel, "Error\t, must be one of:");
            PStringList devices = PVideoInputDevice::GetDriversDeviceNames("*");
            for (PINDEX i = 0; i < devices.GetSize(); i++)
                PTRACE(codecTestTraceLevel, "Error\t   " << devices[i]);
            return false;
        }

        PTRACE(codecTestTraceLevel, "CodTest\tVideo Grabber ");
        if (!driverName.IsEmpty())
        {PTRACE(codecTestTraceLevel, "driver \"" << driverName << "\" and ");}
        PTRACE(codecTestTraceLevel, "device \"" << grabber->GetDeviceName() << "\" opened.");

        if (args.HasOption("grab-format")) {
            PVideoDevice::VideoFormat format;
            PCaselessString formatString = args.GetOptionString("grab-format");
            if (formatString == "PAL")
                format = PVideoDevice::PAL;
            else if (formatString == "NTSC")
                format = PVideoDevice::NTSC;
            else if (formatString == "SECAM")
                format = PVideoDevice::SECAM;
            else if (formatString == "Auto")
                format = PVideoDevice::Auto;
            else {
                PTRACE(codecTestTraceLevel, "Error\tIllegal video grabber format name \"" << formatString << '"');
                return false;
            }
            if (!grabber->SetVideoFormat(format)) {
                PTRACE(codecTestTraceLevel, "Error\tVideo grabber device could not be set to input format \"" << formatString << '"');
                return false;
            }
        }
        PTRACE(codecTestTraceLevel, "CodTest\tGrabber input format set to " << grabber->GetVideoFormat());

        if (args.HasOption("grab-channel")) {
            int videoInput = args.GetOptionString("grab-channel").AsInteger();
            if (!grabber->SetChannel(videoInput)) {
                PTRACE(codecTestTraceLevel, "Error\tVideo grabber device could not be set to channel " << videoInput);
                return false;
            }
        }

        PTRACE(codecTestTraceLevel, "CodTest\tGrabber channel set to " << grabber->GetChannel());

        if (args.HasOption("frame-rate"))
            frameRate = args.GetOptionString("frame-rate").AsUnsigned();
        else
            frameRate = grabber->GetFrameRate();

        mediaFormat.SetOptionInteger(OpalVideoFormat::FrameTimeOption(), mediaFormat.GetClockRate()/frameRate);

        if (!grabber->SetFrameRate(frameRate)) {
            PTRACE(codecTestTraceLevel, "Error\tVideo grabber device could not be set to frame rate " << frameRate);
            return false;
        }

        PTRACE(codecTestTraceLevel, "CodTest\tGrabber frame rate set to " << grabber->GetFrameRate());
    }
    
	driverName = args.GetOptionString("display-driver");
	deviceName = args.GetOptionString("display-device");

	display = PVideoOutputDevice::CreateOpenedDevice(driverName, deviceName, NULL);
    
	if (display == NULL) {
		PTRACE(1, "Cannot use ");
		if (driverName.IsEmpty() && deviceName.IsEmpty())
        {PTRACE(1, "default ");}
		PTRACE(1, "video display");
		if (!driverName)
        {PTRACE(1, ", driver \"" << driverName << '"');}
		if (!deviceName)
        {PTRACE(1, ", device \"" << deviceName << '"');}
		PTRACE(1, ", must be one of:\n");
		PStringList devices = PVideoOutputDevice::GetDriversDeviceNames("*");
		for (PINDEX i = 0; i < devices.GetSize(); i++)
			PTRACE(1, "   " << devices[i] << '\n');
		return false;
	}

	PTRACE(codecTestTraceLevel, "CodTest\tDisplay ");
	if (!driverName.IsEmpty())
    {PTRACE(codecTestTraceLevel, "driver \"" << driverName << "\" and ");}

	PTRACE(codecTestTraceLevel, "device \"" << display->GetDeviceName() << "\" opened.");
	
	if (grabber) 
		grabber->GetFrameSize(width, height);
    else if (IsPlaybackMode()) 
    {
        width = m_nPlaybackWidth;
        height = m_nPlaybackHeight;
    }
    else 
        return false;
        

	mediaFormat.SetOptionInteger(OpalVideoFormat::FrameWidthOption(), width);
	mediaFormat.SetOptionInteger(OpalVideoFormat::FrameHeightOption(), height);

    PVideoFrameInfo::ResizeMode resizeMode = args.HasOption("crop") ? PVideoFrameInfo::eCropCentre : PVideoFrameInfo::eScale;
    
    if (!IsPlaybackMode())
    {
        if (!grabber->SetFrameSizeConverter(width, height, resizeMode)) {
            PTRACE(codecTestTraceLevel, "Error\tVideo grabber device could not be set to size " << width << 'x' << height);
            return false;
        }
        PTRACE(codecTestTraceLevel, "CodTest\tGrabber frame size set to " << grabber->GetFrameWidth() << 'x' << grabber->GetFrameHeight());
    }

	if  (!display->SetFrameSizeConverter(width, height, resizeMode)) {
		PTRACE(codecTestTraceLevel, "Error\tVideo display device could not be set to size " << width << 'x' << height);
		return false;
	}

	PTRACE(codecTestTraceLevel, "CodTest\tDisplay frame size set to " << display->GetFrameWidth() << 'x' << display->GetFrameHeight());
    
    if (grabber)
    {

        if (!grabber->SetColourFormatConverter("YUV420P") ) {
            PTRACE(codecTestTraceLevel, "Error\tVideo grabber device could not be set to colour format YUV420P");
            return false;
        }

        PTRACE(codecTestTraceLevel, "CodTest\tGrabber colour format set to " << grabber->GetColourFormat() << " (");

        if (grabber->GetColourFormat() == "YUV420P")
            PTRACE(codecTestTraceLevel, "native");
        else
            PTRACE(codecTestTraceLevel, "converted to YUV420P");
        PTRACE(codecTestTraceLevel, ')');
    }

    if(display)
    {
        if (!display->SetColourFormatConverter("YUV420P")) {
                PTRACE(codecTestTraceLevel, "Error\tVideo display device could not be set to colour format YUV420P");
                return false;
            }
    }
    
	PTRACE(codecTestTraceLevel, "CodTest\tDisplay colour format set to " << display->GetColourFormat() << " (");
	if (display->GetColourFormat() == "YUV420P")
		PTRACE(codecTestTraceLevel, "native");
	else
		PTRACE(codecTestTraceLevel, "converted from YUV420P");

	PTRACE(codecTestTraceLevel, ')');

	if (args.HasOption("bit-rate")) {
		PString str = args.GetOptionString("bit-rate");
		double bitrate = str.AsReal();
		switch (str[str.GetLength()-1]) {
	  case 'K' :
	  case 'k' :
		  bitrate *= 1000;
		  break;
	  case 'M' :
	  case 'm' :
		  bitrate *= 1000000;
		  break;
		}
		if (bitrate < 100 || bitrate > INT_MAX) {
			PTRACE(codecTestTraceLevel, "Error\tCould not set bit rate to " << str);
			return false;
		}
		mediaFormat.SetOptionInteger(OpalVideoFormat::TargetBitRateOption(), (unsigned)bitrate);
		if (mediaFormat.GetOptionInteger(OpalVideoFormat::MaxBitRateOption()) < bitrate)
			mediaFormat.SetOptionInteger(OpalVideoFormat::MaxBitRateOption(), (unsigned)bitrate);
	}

	PTRACE(codecTestTraceLevel, "CodTest\tTarget bit rate set to " << mediaFormat.GetOptionInteger(OpalVideoFormat::TargetBitRateOption()) << " bps");

	if (args.HasOption('T')) {
		frameFn  = "frame_stats.csv";
		packetFn = "packet_stats.csv";
	}


#ifdef USE_OPALRATECONTROLER
	if (args.HasOption('C')) {
		rcEnable = true;
		unsigned rate = mediaFormat.GetOptionInteger(OpalVideoFormat::TargetBitRateOption());
		rateController.Open(mediaFormat);
		PTRACE(codecTestTraceLevel, "CodTest\tVideo rate controller enabled for bit rate " << rate << " bps");
	}
#endif

	SetOptions(args, mediaFormat);

	if (encoder == NULL) 
		frameTime = mediaFormat.GetFrameTime();
	else {
		encoder->UpdateMediaFormats(OpalMediaFormat(), mediaFormat);
		if (args.HasOption('p'))
			encoder->SetMaxOutputSize(args.GetOptionString('p').AsUnsigned());
	}

	singleStep = args.HasOption('S');

	sumYSNR = sumCbSNR = sumCrSNR = 0.0;
	snrCount = 0;

	return true;
}


void AudioThread::Main()
{
    if (pPlaybackSource == NULL) 
    {
        if (recorder == NULL || player == NULL) 
        {
            PTRACE(codecTestTraceLevel, "Error\tAudio cannot open recorder or player");
            return;
        }
    } 
    else 
    {
        if (player == NULL)
        {
            PTRACE(codecTestTraceLevel, "Error\tAudio cannot open recorder or player");
            return;
        }       
    }
	TranscoderThread::Main();
	
	if (player != NULL) 
		player->Close();

	if (recorder != NULL) 
		recorder->Close();
}


void VideoThread::Main()
{
    if (pPlaybackSource == NULL) 
    {
        if (grabber == NULL || display == NULL)
        {
            PTRACE(codecTestTraceLevel, "Error\tAudio cannot open recorder or player");
            return;
        }
    }
    else {
        
        if (display == NULL)
        {
            PTRACE(codecTestTraceLevel, "Error\tVideo cannot open display");
            return;
        }
    }

	if (grabber)
        grabber->Start();

	display->Start();

	forceIFrame = false;
	TranscoderThread::Main();
	
	if(grabber != NULL)
		grabber->Stop();
	
	if(display != NULL)
		display->Stop();
	
	if(display != NULL)
		display->Close();
	
	if(grabber != NULL)
		grabber->Close();
}

void TranscoderThread::OnTranscoderCommand(OpalMediaCommand & cmd, INT)
{
	if (PIsDescendant(&cmd, OpalVideoUpdatePicture)) {
		PTRACE(codecTestTraceLevel, "decoder lost sync");
		forceIFrame = true;
		((OpalVideoTranscoder *)encoder)->ForceIFrame();
	}
	else {
		PTRACE(codecTestTraceLevel, "unknown decoder command " << cmd.GetName());
	}
}

void VideoThread::CalcSNR(const RTP_DataFrame & src, const RTP_DataFrame & dst)
{
	if (src.GetPayloadSize() < sizeof(OpalVideoTranscoder::FrameHeader) || dst.GetPayloadSize() < sizeof(OpalVideoTranscoder::FrameHeader))
		return;

	const BYTE * src1 = src.GetPayloadPtr();
	const BYTE * src2 = dst.GetPayloadPtr();

	const OpalVideoTranscoder::FrameHeader * hdr1 = (OpalVideoTranscoder::FrameHeader *)src1;
	const OpalVideoTranscoder::FrameHeader * hdr2 = (OpalVideoTranscoder::FrameHeader *)src2;

	if (hdr1->height != hdr2->height || hdr1->width != hdr2->width)
		return;

	if (hdr1->height != snrHeight || hdr1->width != snrWidth) {
		sumYSNR = sumCbSNR = sumCrSNR = 0.0;
		snrCount = 0;
		snrHeight = hdr1->height;
		snrWidth  = hdr1->width;
	}

	unsigned size = snrHeight * snrWidth;

	int tsize = sizeof(OpalVideoTranscoder::FrameHeader) + size*3/2;

	if (src.GetPayloadSize() < tsize || dst.GetPayloadSize() < tsize)
		return;

	src1 += sizeof(OpalVideoTranscoder::FrameHeader);
	src2 += sizeof(OpalVideoTranscoder::FrameHeader);

	sumYSNR  = ::CalcSNR(src1, src2, size);
	src1 += size;
	src2 += size;

	size = size / 4;
	sumCbSNR = ::CalcSNR(src1, src2, size);
	src1 += size;
	src2 += size;

	sumCrSNR = ::CalcSNR(src1, src2, size);

	++snrCount;
}

void VideoThread::ReportSNR()
{
	// The PSNR is the mean of the sum of squares of the differences,
	//   normalized to the range 0..1

	double const yPsnr = sumYSNR / snrCount;

	if (yPsnr <= 1e-9)
		PTRACE(codecTestTraceLevel, "Y  color component identical");
	else
		PTRACE(codecTestTraceLevel, psprintf("Y  color component avg SNR : %.2f dB\n", 10 * log10(1/yPsnr)));

	double const cbPsnr = sumCbSNR / snrCount;

	if (cbPsnr <= 1e-9)
		PTRACE(codecTestTraceLevel, "Cb color component identical");
	else
		PTRACE(codecTestTraceLevel, psprintf("Cb color component avg SNR : %.2f dB\n", 10 * log10(1/cbPsnr)));

	double const crPsnr = sumCrSNR / snrCount;

	if (crPsnr <= 1e-9)
		PTRACE(codecTestTraceLevel, "Cr color component identical");
	else
		PTRACE(codecTestTraceLevel, psprintf("Cr color component avg SNR : %.2f dB\n", 10 * log10(1/crPsnr)));
}

void TranscoderThread::Main()
{
	PUInt64 byteCount = 0;
	PUInt64 frameCount = 0;
	PUInt64 packetCount = 0;
	WORD sequenceNumber = 0;
	bool oldSrcState = true;
	bool oldOutState = true;
	bool oldEncState = true;
	bool oldDecState = true;
    timestamp = 0L;

	PTimeInterval startTick = PTimer::Tick();
	while ((running && (framesToTranscode < 0))
           || (framesToTranscode-- > 0)) 
	{
		RTP_DataFrame srcFrame(2048);
        
		bool state = Read(srcFrame);
		if (oldSrcState != state) {
			oldSrcState = state;
			PTRACE(codecTestTraceLevel, "Error\tSource " << (state ? "restor" : "fail") << "ed at frame " << frameCount);
		}

        timestamp += 10L; // frameTime;

#ifdef USE_OPALRATECONTROLER
		bool skip;
		if (rcEnable && rateController.SkipFrame(skip)) {
			PTRACE(codecTestTraceLevel, "Error\tRate controller forced frame skip");
			continue;
		}
#endif

		RTP_DataFrameList encFrames;
		if (encoder == NULL) 
			encFrames.Append(new RTP_DataFrame(srcFrame)); 
		else {
			state = encoder->ConvertFrames(srcFrame, encFrames);
			if (oldEncState != state) {
				oldEncState = state;
				PTRACE(codecTestTraceLevel, "Error\tEncoder " << (state ? "restor" : "fail") << "ed at frame " << frameCount);
				continue;
			}
		}

		for (PINDEX i = 0; i < encFrames.GetSize(); i++) {
			encFrames[i].SetSequenceNumber(++sequenceNumber);
		}

		unsigned long frameSize = 0;
		unsigned long framePacketCount = 0;
		for (PINDEX i = 0; i < encFrames.GetSize(); i++) {
			RTP_DataFrameList outFrames;
			if (encoder == NULL)
				outFrames = encFrames;
			else {
				switch (markerHandling) {
                    case SuppressMarkers :
                        encFrames[i].SetMarker(false);
                        break;
                    case ForceMarkers :
                        encFrames[i].SetMarker(true);
                        break;
                    default:
                        ;
				}

                state = decoder->ConvertFrames(encFrames[i], outFrames);

				if (oldDecState != state) {
					oldDecState = state;
					PTRACE(codecTestTraceLevel, "Error\tDecoder " << (state ? "restor" : "fail") << "ed at packet " << packetCount);
					continue;
				}
				UpdateStats(encFrames[i]);
			}

			for (PINDEX j = 0; j < outFrames.GetSize(); j++) {

				if (calcSNR) 
					CalcSNR(srcFrame, outFrames[j]);

				state = Write(outFrames[j]);
				if (oldOutState != state) {
					oldOutState = state;
					PTRACE(codecTestTraceLevel, "Error\tFrame display " << (state ? "restor" : "fail") << "ed at packet " << packetCount);
				}
			}
			byteCount += encFrames[i].GetPayloadSize();
			frameSize += encFrames[i].GetPayloadSize() + encFrames[i].GetHeaderSize();
			framePacketCount++;
			packetCount++;
		}

#ifdef USE_OPALRATECONTROLER
		if (rcEnable)
			rateController.AddFrame(frameSize, framePacketCount);
#endif
		if (pause.Wait(0)) {
			pause.Acknowledge();
			resume.Wait();
		}

		frameCount++;
	}

	PTimeInterval duration = PTimer::Tick() - startTick;
	if(!duration.GetSeconds())
		return;

	PTRACE(codecTestTraceLevel, fixed << setprecision(1));
	if (byteCount < 10000ULL)
		PTRACE(codecTestTraceLevel, byteCount << ' ');
	else if (byteCount < 10000000ULL)
		PTRACE(codecTestTraceLevel, byteCount/1000.0 << " k");
	else if (byteCount < 10000000000ULL)
    {PTRACE(codecTestTraceLevel, byteCount/1000000.0 << " M");}

	PTRACE(codecTestTraceLevel, "bytes, "
		<< packetCount << " packets, "
		<< frameCount << " frames over " << duration << " seconds at "
		<< (frameCount*1000.0/duration.GetMilliSeconds()) << " f/s and ");

	PUInt64 bitRate = byteCount*8/duration.GetSeconds();
	if (bitRate < 10000ULL)
		PTRACE(codecTestTraceLevel, bitRate << ' ');
	else if (bitRate < 10000000ULL)
    {PTRACE(codecTestTraceLevel, bitRate/1000.0 << " k");}
	else if (bitRate < 10000000000ULL)
    {PTRACE(codecTestTraceLevel, bitRate/1000000.0 << " M");}

	PTRACE(codecTestTraceLevel, "bits/s.");

	if (calcSNR) 
		ReportSNR();
}


bool AudioThread::Read(RTP_DataFrame & frame)
{
    if (running && pPlaybackSource && pPlaybackSource->GotFrame(0))
        return pPlaybackSource->GetFrame(0, frame);

    frame.SetPayloadSize(readSize);
    if(!recorder->Read(frame.GetPayloadPtr(), readSize))
	    return false;

#ifdef SB_AEC
	if(m_aecEnable)
		m_echoReceiveHandler(frame, 0);	// remove echo
#endif //SB_AEC
	
    return true;
}


bool AudioThread::Write(RTP_DataFrame & frame)
{
#ifdef SB_AEC	
	if (m_aecEnable)
		m_echoSendHandler(frame, 0);		// give AEC a copy
#endif //SB_AEC
	
	if(!player->Write(frame.GetPayloadPtr(), frame.GetPayloadSize()))
		return false;
	
	return true;
}


void AudioThread::Stop()
{
	running = false;
	
	WaitForTermination();
}


bool VideoThread::Read(RTP_DataFrame & data)
{
    if (running && pPlaybackSource && pPlaybackSource->GotFrame(1))
        return pPlaybackSource->GetFrame(1,data);

    if (singleStep)
	    frameWait.Wait();

    data.SetPayloadSize(grabber->GetMaxFrameBytes()+sizeof(OpalVideoTranscoder::FrameHeader));
    data.SetMarker(TRUE);

    unsigned width, height;
    grabber->GetFrameSize(width, height);
    OpalVideoTranscoder::FrameHeader * frame = (OpalVideoTranscoder::FrameHeader *)data.GetPayloadPtr();
    frame->x = frame->y = 0;
    frame->width = width;
    frame->height = height;

    return grabber->GetFrameData(OPAL_VIDEO_FRAME_DATA_PTR(frame));
}


bool VideoThread::Write(RTP_DataFrame & data)
{
	const OpalVideoTranscoder::FrameHeader * frame = (const OpalVideoTranscoder::FrameHeader *)data.GetPayloadPtr();
    PBoolean ok = (frame->width >= 16 && frame->height >= 16 && frame->width < 65536 && frame->height < 65536);
    if(ok)
        display->SetFrameSize(frame->width, frame->height);
    
	return ok? display->SetFrameData(frame->x, frame->y,
        frame->width, frame->height,
        OPAL_VIDEO_FRAME_DATA_PTR(frame), data.GetMarker()) : PTrue;
}


void VideoThread::Stop()
{
	running = false;
	frameWait.Signal();

	WaitForTermination();
}

void VideoThread::InitStats()
{
	packetCount= 0;
	frameCount = 0;
	frameBytes = 0;
	totalFrameBytes = 0;
}

void VideoThread::UpdateStats(RTP_DataFrame & frame)
{
	if (!packetFn.IsEmpty()) {
		if (packetStatFile.Open(packetFn, PFile::WriteOnly))
			packetStatFile << "PacketNum,PacketSize\n";
		packetFn.MakeEmpty();
	}

	packetCount++;
	frameBytes      += frame.GetPayloadSize();
	totalFrameBytes += frame.GetPayloadSize();

	if (packetStatFile.IsOpen()) 
		packetStatFile << packetCount << ','
		<< frame.GetPayloadSize() << endl;

	if (frame.GetMarker()) 
		UpdateFrameStats();
}

PInt64 BpsTokbps(PInt64 Bps);

PInt64 BpsTokbps(PInt64 Bps)
{
	return ((Bps * 8) + 500) / 1000;
}

void VideoThread::UpdateFrameStats()
{
	if (!frameFn.IsEmpty()) {
		if (frameStatFile.Open(frameFn, PFile::WriteOnly))
			frameStatFile << "FrameNum,FrameBits,FrameKBPS,TotalKBPS\n";
		frameFn.MakeEmpty();
	}

	frameCount++;

	if (frameStatFile.IsOpen()) {
		frameStatFile << frameCount << ','
			<< (frameBytes * 8) << ','
			<< BpsTokbps(frameBytes * frameRate) << ','
			<< BpsTokbps((totalFrameBytes * frameRate) / frameCount) << endl;
	}

	frameBytes = 0;
}

PBoolean VideoThread::SetCodecOption(const char* szCodec, const char* szOption, const char* szValue)
{
	PBoolean bResult = PFalse;
	OpalMediaFormat mediaFormat = encoder != NULL ? encoder->GetOutputFormat() : OpalYUV420P;
	if(encoder 
		&& szCodec 
		&& *szCodec 
		&& mediaFormat == PString(szCodec))
	{
		bResult = mediaFormat.SetOptionValue(szOption, szValue);
		encoder->UpdateMediaFormats(OpalMediaFormat(), mediaFormat);
	}

	return bResult;
}

static int iCountFrame = 0;

bool BoneCodecTest::StopPlayback(int iErr)
{
    m_nPlaybackCurPos = m_nPlaybackBufSize;
    monitorExit.Signal();
    return false;
}

bool BoneCodecTest::GetFrame(unsigned iTypeAudioVideo, RTP_DataFrame& frame)
{
    PAssert(iTypeAudioVideo>=0 && iTypeAudioVideo<=1, "Wrong Type channel");
    PTRACE(1, "BoneCodecTest::GetFrame " << ++iCountFrame << " CurPos=" << m_nPlaybackCurPos);
  
    if (    (m_pPlaybackBuf == NULL) 
        ||  (m_pSyncPoint[iTypeAudioVideo] == NULL)
        ||  ((m_nPlaybackCurPos + sizeof(long)) >= m_nPlaybackBufSize))
    {
        monitorExit.Signal();
        return false;
    }
    
    m_pSyncPoint[iTypeAudioVideo]->Wait();
    
    if ((m_nPlaybackCurPos + sizeof(long)) >= m_nPlaybackBufSize)
        return StopPlayback(0);
    

    unsigned long lVal;
    memcpy(&lVal, m_pPlaybackBuf + m_nPlaybackCurPos, sizeof(lVal));
    
    if (iTypeAudioVideo==1) {
        if (lVal != m_nVideoRecSize)
            return StopPlayback(1);
        if (!m_bAudioOnPlayback)
            PThread::Sleep(300);
    } else
        m_bAudioOnPlayback = true;
    
    m_nPlaybackCurPos += sizeof(lVal);
   
    if (m_nPlaybackCurPos + lVal > m_nPlaybackBufSize) {
        m_nPlaybackCurPos = m_nPlaybackBufSize;
        return false;
    }
        
    frame.SetPayloadSize(lVal);
    
    memcpy(frame.GetPayloadPtr(), m_pPlaybackBuf + m_nPlaybackCurPos, lVal);
    frame.SetMarker(PTrue);
    
    m_nPlaybackCurPos += lVal;

    if (!StartReadNextFrame()) 
        m_nPlaybackCurPos = m_nPlaybackBufSize;
        
	return true;
}
  
bool BoneCodecTest::StartReadNextFrame()
{
    if (m_pPlaybackBuf == NULL)
        return false;

    unsigned long lVal;
    for (;;) {
        if ((m_nPlaybackCurPos +  sizeof(lVal)) > m_nPlaybackBufSize)
            return false;
        
        memcpy(&lVal, m_pPlaybackBuf + m_nPlaybackCurPos, sizeof(lVal));
        m_nPlaybackCurPos += sizeof(lVal);

        if (lVal >= 2)
            return false;
        
        if (m_pSyncPoint[lVal]) {
            m_pSyncPoint[lVal]->Signal();
            return true;
        }

        memcpy(&lVal, m_pPlaybackBuf + m_nPlaybackCurPos, sizeof(lVal));
        m_nPlaybackCurPos += sizeof(lVal);
        
        if (m_nPlaybackCurPos + lVal > m_nPlaybackBufSize)
            return false;
        
        m_nPlaybackCurPos += lVal;            
    }
}

#if DBG_TEST_PLAYBACK

union UniPntr {
    char*           p;
    unsigned long*  pUL;
    signed short*   pSS;
};

static bool CreateImageFile(unsigned& nImageSize,char*& pImage)
{
    unsigned nImageSizeMax = 10000000;
    nImageSize = 0;
    
    pImage = new char [nImageSizeMax];
    if (!pImage)
        return false;
    
    UniPntr p;
    p.p = pImage;
    char* pEnd = p.p + nImageSizeMax;
    BoneRecordHdr* pHdr = (BoneRecordHdr*) pImage;
    pHdr->hdrSignature = BoneRecordHdr_Signature;
    pHdr->nVideoWidth = 352;
    pHdr->nVideoHeight = 288;
    
    p.p += sizeof(BoneRecordHdr);
    
    int n = 0;
    int nVideoFrame = 0;
    for (;;)
    {
        if (n++ < 10)
        {
            if (p.p + 8 + 320 >= pEnd)
                break;
            *p.pUL ++ = 0;
            *p.pUL ++ = 320;
            for (int i=0;i<160;i++) {
                if ( (i% 16) < 8)
                    *p.pSS ++ = 25000;
                else
                    *p.pSS ++ = -25000;
            }
        }
        else
        {
            n = 0;
            if ( p.p + 8 + 16 + 352*288*3/2 > pEnd)
                break;
            *p.pUL ++ = 1;
            *p.pUL ++ = 16 + 352*288*3/2;
            *p.pUL ++ = 0;
            *p.pUL ++ = 0;
            *p.pUL ++ = 352;
            *p.pUL ++ = 288;
            /*
             static unsigned char Y = 64;
             static unsigned char U = 128;
             static unsigned char V = 128;
             Y += 7; if(Y>192) Y = 64;
             U += 1; if(U>192) U = 64;
             V += 3; if(V<192) V = 64;
             */
            
            ++nVideoFrame;
            
            unsigned char y = (nVideoFrame & 1) ? 50 : 200;
            unsigned char u = (nVideoFrame & 1) ? 64 : 150;
            unsigned char v = (nVideoFrame & 1) ? 150 : 64;
            
            memset(p.p, y, 352*288);
            p.p += 352*288;
            memset(p.p, u, 352*288/4);
            p.p += 352*288/4;
            memset(p.p, v, 352*288/4);
            p.p += 352*288/4;
        }
    }
    
    nImageSize = p.p - pImage;
    return true;
}
#endif

