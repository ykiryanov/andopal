/*
 *  BoneCodecTest.h
 *  BoneLib
 *
 *  Created by Sergey Bezruchkin and Yuri Kiryanov.
 *  Copyright 2008-2013 Dinsk. All rights reserved.
 *
 */

#pragma once
#include <ptlib/thread.h>
#include <ptlib/videoio.h>
#include <ptlib/sound.h>
#include <ptlib/video.h>
#include <ptclib/vsdl.h>
#include <opal/transcoders.h>
#include <codec/opalplugin.h>
#include <codec/opalpluginmgr.h>
#include <codec/vidcodec.h>
#include <opal/patch.h>
#include <rtp/rtpep.h>

//#define BONEPLAYER

class BoneCodecTest;

class Mpeg2TSListener;
//class CTManager;
//class CTRTPEndPoint;

#ifdef USE_OPALRATECONTROLER
#undef USE_OPALRATECONTROLER
#endif

struct IPlaybackSource
{
    virtual bool GotFrame(unsigned iTypeAudioVideo) = 0;
    virtual bool GetFrame(unsigned iTypeAudioVideo, RTP_DataFrame & frame) = 0;
};

class BoneOpalTranscoder : public OpalTranscoder
{
    PCLASSINFO(BoneOpalTranscoder, OpalTranscoder);
  public:
    BoneOpalTranscoder(
      const OpalMediaFormat & inputMediaFormat,  ///<  Input media format
      const OpalMediaFormat & outputMediaFormat  ///<  Output media format
	  ): OpalTranscoder(inputMediaFormat, outputMediaFormat) {};

	PBoolean SetCodecOption(const char* szCodec, const char* szOption, const char* szValue)
	{
		if(szCodec && *szCodec && 
			(P_MAX_INDEX != outputMediaFormat.GetName().Find(szCodec))
			)
		  return outputMediaFormat.SetOptionValue(szOption, szValue);

		return PFalse;
	}

    static BoneOpalTranscoder * Create(
      const OpalMediaFormat & srcFormat,  ///<  Name of source format
      const OpalMediaFormat & dstFormat  ///<  Name of destination format
    ) 
	{ return (BoneOpalTranscoder*) OpalTranscoder::Create(srcFormat, dstFormat); }
};


class TranscoderThread : public PThread
{
public:
	TranscoderThread(BoneCodecTest* test, unsigned _num, const char * name)
		: PThread(5000, NoAutoDeleteThread, NormalPriority, name)
		, running(true)
		, encoder(NULL)
		, decoder(NULL)
		, num(_num)
		, timestamp(0)
		, markerHandling(NormalMarkers)
		, codecTest(test)
		, pPlaybackSource(NULL)
		, framesToTranscode(-1)
#ifdef USE_OPALRATECONTROLER
		, rcEnable(false)
#endif //USE_OPALRATECONTROLER	
    {
    }

    ~TranscoderThread()
    {
      delete encoder;
      delete decoder;
    }

    int InitialiseCodec(PArgList & args, const OpalMediaFormat & rawFormat);

    virtual void Main();

    virtual bool Read(RTP_DataFrame & frame) = 0;
    virtual bool Write(RTP_DataFrame & frame) = 0;
    virtual void Stop() = 0;

    void SetOptions(PArgList & args, OpalMediaFormat & mediaFormat);
    
    virtual void UpdateStats(const RTP_DataFrame &) { }

    virtual void CalcSNR(const RTP_DataFrame & /*src*/, const RTP_DataFrame & /*dst*/)
    {  }

    virtual void ReportSNR()
    {  }

	bool IsPlaybackMode()                       { return pPlaybackSource!=NULL; }
    void SetPlaybackSource(IPlaybackSource* p)  { pPlaybackSource = p;}

    bool running;

    PSyncPointAck pause;
    PSyncPoint    resume;

    BoneOpalTranscoder * encoder;
    BoneOpalTranscoder * decoder;
    unsigned         num;
    DWORD            timestamp;
    enum MarkerHandling {
      SuppressMarkers,
      ForceMarkers,
      NormalMarkers
    } markerHandling;

    PDECLARE_NOTIFIER(OpalMediaCommand, TranscoderThread, OnTranscoderCommand);
    bool forceIFrame;

#ifdef USE_OPALRATECONTROLER
    bool rcEnable;
	
	class BoneVideoRateController : public OpalVideoRateController 
	{
	public:
		virtual bool SkipFrame(
		  bool & forceIFrame
		  ) {};
	}
	rateController;
#endif

	int framesToTranscode;
    int frameTime;
    bool calcSNR;
    IPlaybackSource* pPlaybackSource;
    
protected:
    BoneCodecTest* codecTest;
};


class AudioThread : public TranscoderThread
{
public:
    AudioThread(BoneCodecTest* test, unsigned _num)
		: TranscoderThread(test, _num, "Audio")
		, recorder(NULL)
		, player(NULL)
		, readSize(320)
#ifdef SB_AEC
		, m_aecEnable(PTrue)
		, m_echoReceiveHandler(m_echoCanceler.GetReceiveHandler())
		, m_echoSendHandler(m_echoCanceler.GetSendHandler())
#endif //SB_AEC
    {
#ifdef SB_AEC
		m_echoParams.m_mode = OpalEchoCanceler::Cancelation;
		m_echoCanceler.SetParameters(m_echoParams);
		m_echoCanceler.SetClockRate(8000);
#endif //SB_AEC
    }

    ~AudioThread()
    {
      delete recorder;
      delete player;
    }

    bool Initialise(PArgList & args);

    virtual void Main();
    virtual bool Read(RTP_DataFrame & frame);
    virtual bool Write(RTP_DataFrame & frame);
    virtual void Stop();

    PSoundChannel * recorder;
    PSoundChannel * player;
    PINDEX          readSize;
#ifdef SB_AEC
	// Echo Canceler
	PBoolean m_aecEnable;
	OpalEchoCanceler m_echoCanceler;
	OpalEchoCanceler::Params m_echoParams;
	const PNotifier& m_echoReceiveHandler;
	const PNotifier& m_echoSendHandler;
#endif //SB_AEC
};

class VideoThread :
  public TranscoderThread
{
  public:
    VideoThread(BoneCodecTest* test, unsigned _num)
      : TranscoderThread(test, _num, "Video")
      , grabber(NULL)
      , display(NULL)
      , singleStep(false)
      , frameWait(0, INT_MAX)
      , m_nPlaybackWidth(0)
      , m_nPlaybackHeight(0)
    {
      InitStats();
    }

    ~VideoThread()
    {
	  delete grabber;
	  delete display;
    }

    bool Initialise(PArgList & args);

    virtual void Main();
    virtual bool Read(RTP_DataFrame & frame);
    virtual bool Write(RTP_DataFrame & frame);
    virtual void Stop();

    void InitStats();
    virtual void UpdateStats(RTP_DataFrame &);
    void UpdateFrameStats();

    PVideoInputDevice  * grabber;
    PVideoOutputDevice * display;
 
    bool                 singleStep;
    PSemaphore           frameWait;
    unsigned             frameRate;

    void CalcSNR(const RTP_DataFrame & src, const RTP_DataFrame & dst);
    void ReportSNR();

    PString frameFn;
    PString packetFn;

    PTextFile packetStatFile, frameStatFile;
    PInt64 packetCount;
    PInt64 frameCount;
    PInt64 frameBytes;
    PInt64 totalFrameBytes;

    unsigned snrWidth, snrHeight;
    unsigned m_nPlaybackWidth;
    unsigned m_nPlaybackHeight;

    double sumYSNR;
    double sumCbSNR;
    double sumCrSNR;
    PInt64 snrCount;

   PBoolean SetCodecOption(const char* szCodec, const char* szOption, const char* szValue);
};

class BoneCodecTest : public OpalManager
//    ,public IPlaybackSource
{
    PCLASSINFO(BoneCodecTest, OpalManager)

public:
   BoneCodecTest(const PString& pstrArguments, void* native_window);
   ~BoneCodecTest();

   PDECLARE_NOTIFIER(PThread, BoneCodecTest, MonitorMain);

   PThread      * monitorThread;
   PSyncPoint     monitorExit;

   PBoolean SetVideoCodecOption(const char* szCodec, const char* szOption, const char* szValue)
   {
		PBoolean bResult = PFalse;
	    m_video.Suspend();
		bResult = m_video.SetCodecOption(szCodec, szOption, szValue);
		m_video.Resume();
		return bResult;
   }

#ifdef _WIN32	
	void SetBoneDevice(NewBoneVideoOutputDevice *pBoneDevice, const PBoolean isPreview)
	{
		pBoneDevice->SetBoneVideoEventHandler(this);
		if(isPreview)
			pBoneDevice->SetVideoOutputWindow(&m_wndLocal);
		else
			pBoneDevice->SetVideoOutputWindow(&m_wndRemote);
	}
#endif
	
    virtual bool GetFrame(unsigned iTypeAudioVideo, RTP_DataFrame & frame);
    virtual bool GotFrame(unsigned iTypeAudioVideo) { return true; }; // always has
    bool  StartReadNextFrame(void);
    bool  StopPlayback(int iErr);
    
    virtual int  GetCurPlaybackPosinPersent()  { return (m_nPlaybackBufSize != 0) ?  m_nPlaybackCurPos*100/m_nPlaybackBufSize : 0;} 

    AudioThread& getAudio() { return m_audio; }
    VideoThread& getVideo() { return m_video; }
 
private:
   AudioThread  m_audio;
   VideoThread  m_video;
   PString      m_arguments;
   PString      m_listenFullAddress;
   char*        m_pPlaybackBuf;
   unsigned     m_nPlaybackBufSize;
   unsigned     m_nVideoRecSize;
   unsigned volatile m_nPlaybackCurPos;
   PSyncPoint*  m_pSyncPoint[2];
   bool         m_bAudioOnPlayback;    // if we don't have Audio Show ea

#ifdef	_WIN32
    VideoOutputWindow m_wndRemote;
    VideoOutputWindow m_wndLocal;
#endif
	
#if TARGET_IPHONE_SIMULATOR
	PFile*		m_pPlaybackFile;
#endif	

#ifdef BONEPLAYER
    // End point to listen on rtp
    //CTRTPEndPoint* m_rtpEP;
    //friend CTRTPEndPoint;
#endif
    friend class Mpeg2TSListener;
    Mpeg2TSListener* m_udpListener;
};



