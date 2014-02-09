#include <player/audio.h>

//================================================================================
//		Playback
//================================================================================

static SLObjectItf s_EngineObject = NULL;
static SLEngineItf s_EngineEngine = NULL;

//static int s_CpuScore = 0;
//static int s_SampleRate = -1;
//static int s_SoundCardBufferMSec = -1;
//static int s_HandleAec = -1;
static int s_HardwareSampleRate;
static int s_HardwareBufferSizeInSamples;

static void FinishAudio()
{
	DLogFunction();
    // destroy engine object, and invalidate all associated interfaces
    if (s_EngineObject != NULL) {
        (*s_EngineObject)->Destroy(s_EngineObject);
        s_EngineObject = NULL;
        s_EngineEngine = NULL;
    }
}

static int StartAudio()
{
    int result;
    
    if (s_EngineObject != NULL) {
    	DLog(("NativeAudio already opened"));
    	return 0;
    }
    
	s_HardwareSampleRate = 44100;
	s_HardwareBufferSizeInSamples = 8192;
    
    CHKERR( slCreateEngine(&s_EngineObject, 0, NULL, 0, NULL, NULL));			// create engine
    CHKERR( (*s_EngineObject)->Realize(s_EngineObject, SL_BOOLEAN_FALSE));		// realize the engine
    CHKERR( (*s_EngineObject)->GetInterface(s_EngineObject, SL_IID_ENGINE, &s_EngineEngine));
    
    return result;
err:
	FinishAudio();
	return result;
}

//================================================================================
AudioSession AudioSession::g_AudioSession;

//////////////////////
AudioSession::AudioSession()
{
    _bqOutputMixObject = NULL;
    _bqPlayerObject = NULL;
    _bqPlayerPlay = NULL;
    _bqPlayerBufferQueue = NULL;
    _bqPlayerEffectSend = NULL;
    _bqPlayerVolume = NULL;
    _streamType = SL_ANDROID_STREAM_VOICE;
    
    _isOpen = false;
    
    memset(_playbackBuffers, 0, sizeof(_playbackBuffers));
    
    _playbackBufSizeInSamples = _hardwareFrameSizeInSamples = 0;
    
    _frameBufSizeInSamples = 0;
    _frameBuf = _frameBufCur = NULL;
    
}


static int StopAudio()
{
	DLogFunction();
    FinishAudio();
    
	return 0;
}

bool AudioSession::Init()
{
    
}

bool AudioSession::Start()
{
    assert(!isOpen());
    
    int result;
    
    if (_bqPlayerObject != NULL)
        return false;

    _isOpen = true;
    
    CHK(StartAudio());
    
    // create output mix, with environmental reverb specified as a non-required interface
    CHKR( (*s_EngineEngine)->CreateOutputMix(s_EngineEngine, &_bqOutputMixObject, 0, NULL, NULL));
    CHKR( (*_bqOutputMixObject)->Realize(_bqOutputMixObject, SL_BOOLEAN_FALSE) );					// realize the output mix
    
    // configure audio source
    SLDataLocator_AndroidSimpleBufferQueue loc_bufq = {SL_DATALOCATOR_ANDROIDSIMPLEBUFFERQUEUE, MaxPlaybackBuffers};
    SLDataFormat_PCM format_pcm = {SL_DATAFORMAT_PCM, 1, SL_SAMPLINGRATE_8,
        SL_PCMSAMPLEFORMAT_FIXED_16, SL_PCMSAMPLEFORMAT_FIXED_16,
        SL_SPEAKER_FRONT_CENTER, SL_BYTEORDER_LITTLEENDIAN};
    SLDataSource audioSrc = {&loc_bufq, &format_pcm};
    
    format_pcm.samplesPerSec = s_HardwareSampleRate*1000;
    
    // configure audio sink
    SLDataLocator_OutputMix loc_outmix = {SL_DATALOCATOR_OUTPUTMIX, _bqOutputMixObject};
    SLDataSink audioSnk = {&loc_outmix, NULL};
    
    // create audio player
    
    const SLInterfaceID ids[3] = {SL_IID_BUFFERQUEUE, SL_IID_VOLUME, SL_IID_ANDROIDCONFIGURATION};
    const SLboolean req[3] = {SL_BOOLEAN_TRUE, SL_BOOLEAN_TRUE, SL_BOOLEAN_TRUE};
    
    SLAndroidConfigurationItf playerConfig;
    
    
    CHKR( (*s_EngineEngine)->CreateAudioPlayer(s_EngineEngine, &_bqPlayerObject, &audioSrc, &audioSnk, 3, ids, req));
    CHKR( (*_bqPlayerObject)->GetInterface(_bqPlayerObject, SL_IID_ANDROIDCONFIGURATION, &playerConfig));
    CHKR( (*playerConfig)->SetConfiguration(playerConfig, SL_ANDROID_KEY_STREAM_TYPE, &_streamType, sizeof(SLint32)));
    
    CHKR( (*_bqPlayerObject)->Realize(_bqPlayerObject, SL_BOOLEAN_FALSE));										// realize the player
    CHKR( (*_bqPlayerObject)->GetInterface(_bqPlayerObject, SL_IID_PLAY, &_bqPlayerPlay));						// get the play interface
    CHKR( (*_bqPlayerObject)->GetInterface(_bqPlayerObject, SL_IID_BUFFERQUEUE, &_bqPlayerBufferQueue));		// get the buffer queue interface
    
    CHKR( (*_bqPlayerBufferQueue)->RegisterCallback(_bqPlayerBufferQueue, AudioSession::Callback, this));		// register callback on the buffer queue
    
    CHKR( (*_bqPlayerObject)->GetInterface(_bqPlayerObject, SL_IID_VOLUME, &_bqPlayerVolume));					// get the volume interface
    CHKR((*_bqPlayerVolume)->SetVolumeLevel(_bqPlayerVolume, 0));
    

    _playbackBufSizeInSamples = s_HardwareBufferSizeInSamples;
    _hardwareFrameSizeInSamples = s_HardwareSampleRate / 50;
    
    _frameBufSizeInSamples = 0;
    _frameBuf = (short*) malloc(_hardwareFrameSizeInSamples*sizeof(short));
    _frameBufCur = _frameBuf;
    if (!_frameBuf) {
        DLog(("Error Allocate _frameBuf"));
        return -123;
    }
    
    for (int i=0;i<MaxPlaybackBuffers; ++i) {
        _playbackBuffers[i] = (short*) calloc(_playbackBufSizeInSamples, sizeof(short));
        if (!_playbackBuffers[i]) {
            DLog(("Error Allocate _playbackBuffers"));
            return -124;
        }
    }
    
    _indxPlaybackBuf = 0;
    _indxRingBufWrite = _indxRingBufRead = 0;
    CHKR( (*_bqPlayerPlay)->SetPlayState(_bqPlayerPlay, SL_PLAYSTATE_PLAYING));							// set the player's state to playing
    
    
    for (int i=0; i<MaxPlaybackBuffers; ++i)
    {
        CHKR( (*_bqPlayerBufferQueue)->Enqueue(_bqPlayerBufferQueue, _playbackBuffers[i], _playbackBufSizeInSamples*sizeof(short)));
    }
    
    memset(_ringBuffers, 0, sizeof(_ringBuffers));

    return result;
}


int AudioSession::close()
{
    DLog(("AudioSession::closing(%d)", handle));
    
    _isOpen = false;
    
    // destroy buffer queue audio player object, and invalidate all associated interfaces
    if (_bqPlayerObject != NULL) {
        (*_bqPlayerObject)->Destroy(_bqPlayerObject);
        _bqPlayerObject = NULL;
        _bqPlayerPlay = NULL;
        _bqPlayerBufferQueue = NULL;
        _bqPlayerEffectSend = NULL;
        //	        _bqPlayerMuteSolo = NULL;
        _bqPlayerVolume = NULL;
    }
    
    // destroy output mix object, and invalidate all associated interfaces
    if (_bqOutputMixObject != NULL) {
        (*_bqOutputMixObject)->Destroy(_bqOutputMixObject);
        _bqOutputMixObject = NULL;
    }
    
    
    StopAudio();
    
    if (_frameBuf)
        free(_frameBuf);
    
    _frameBuf = _frameBufCur = NULL;
    
    for (int i=0;i< MaxPlaybackBuffers;++i)
        if (_playbackBuffers[i])
            free(_playbackBuffers[i]);
    
    memset(_playbackBuffers, 0, sizeof(_playbackBuffers));
    
    
    DLog(("AudioSession::closed(%d)", handle));
    return 0;
}


void AudioSession::onCallback(SLAndroidSimpleBufferQueueItf bq)
{
    assert(bq == _bqPlayerBufferQueue);
    
    short* playbackPcm16 = _playbackBuffers[_indxPlaybackBuf];
    int sizeToFillInSamples = _playbackBufSizeInSamples;
    
    while (sizeToFillInSamples > 0)
    {
        if (_frameBufSizeInSamples > 0) {
            int szInSamples = sizeToFillInSamples < _frameBufSizeInSamples ? sizeToFillInSamples : _frameBufSizeInSamples;
            
            memcpy(playbackPcm16, _frameBufCur, szInSamples*sizeof(short));
            playbackPcm16 += szInSamples;
            sizeToFillInSamples -= szInSamples;
            _frameBufCur += szInSamples;
            _frameBufSizeInSamples -= szInSamples;
        }
        
        if (_frameBufSizeInSamples <= 0) {
            _frameBufCur = _frameBuf;
            
            short inPcm16[PLAYBACK_FRAME_SIZE_IN_SAMPLES];
            
            if ((_isOpen >= 0) && (_indxRingBufWrite != _indxRingBufRead)) {
                short* pRingBuf = _ringBuffers[_indxRingBufRead];
                memcpy(_frameBufCur, pRingBuf, PLAYBACK_FRAME_SIZE_IN_BYTES);
                int nextIndx = _indxRingBufRead + 1;
                if (nextIndx >= MaxRingBuffers)
                    nextIndx = 0;
                _indxRingBufRead = nextIndx;
            } else
                memset(_frameBufCur, 0, PLAYBACK_FRAME_SIZE_IN_BYTES);

            _frameBufSizeInSamples = PLAYBACK_FRAME_SIZE_IN_SAMPLES;
        }
    }
    
    (*_bqPlayerBufferQueue)->Enqueue(_bqPlayerBufferQueue, _playbackBuffers[_indxPlaybackBuf], _playbackBufSizeInSamples*sizeof(short));
    
    if (++_indxPlaybackBuf >= MaxPlaybackBuffers)
        _indxPlaybackBuf = 0;
}



bool AudioSession::Play(const void* pBuf, unsigned inArrSize)
{
	int iOffset = 0;
    const short* inPcm16buff = (const short*) pBuf;
    
	while (inArrSize > 0 && isOpen())
	{
		int iFrameSizeInSamples = PLAYBACK_FRAME_SIZE_IN_SAMPLES;
		if (iFrameSizeInSamples > inArrSize)
			iFrameSizeInSamples = inArrSize;
        
		short* outPcm16Frame = getRingBuffer();
        
		if (outPcm16Frame == NULL)
			return -1;
        
        memcpy(outPcm16Frame, inPcm16buff + iOffset, iFrameSizeInSamples);
		enqueueRingBuffer(outPcm16Frame, iFrameSizeInSamples*sizeof(short));
  
        iOffset += iFrameSizeInSamples;
		inArrSize -= iFrameSizeInSamples;
	}
    
	return true;
}


