#include <stdafx.h>
#include <streams.h>
#include <combase.h>
#include "debug.h"
#include "VideoCapture.h"

#include <winbase.h>

typedef unsigned int uint;
typedef unsigned char uchar;

//#include <ocidl.h>

#pragma warning(disable:4800)
#pragma warning(disable:4355)

#define PTRACE(a,b)     dbLog(b)
#define capTraceLevel 0


#define CHK(exp) if (FAILED(hr=exp)) { dbLogFL(__FILE__,__LINE__,"CHK err=0x%8.8x(%d) \"%s\"",hr,hr,#exp); return hr;} else 


typedef DWORD (*ColorConvert)(int iwidth, int height, PBYTE pSrc, DWORD szSrc, PBYTE pDst, DWORD szDst);


#include <initguid.h> 
// GUIDs
// {A61B2C8C-7E97-4f6f-8BF8-D93F4B9B61CF}
DEFINE_GUID(CLSID_BoneNullRenderer, 
0xa61b2c8c, 0x7e97, 0x4f6f, 0x8b, 0xf8, 0xd9, 0x3f, 0x4b, 0x9b, 0x61, 0xcf);


// GUIDs
// {30323449-0000-0010-8000-00AA00389B71}
DEFINE_GUID(MEDIASUBTYPE_I420, 
0x30323449, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71);


static HRESULT SetDevice(LPCWSTR pszDevName, IBaseFilter ** ppSrcFilter);

#ifndef _WIN32_WCE
////////////////////////////////////////////////////////////////////////////////
// Capture Events
////////////////////////////////////////////////////////////////////////////////
#define EC_CAP_FILE_COMPLETED			        0x101
#define EC_CAP_SAMPLE_PROCESSED                 0x102
#define EC_BUFFER_FULL                          0x103
#define EC_CAP_FILE_WRITE_ERROR                 0x104
#define EC_BUFFER_DOWNSTREAM_ERROR              0x105
#endif

#define SAFE_RELEASE(p)      { if(p) { (p)->Release(); (p)=NULL; } }



//=============================================================================
//=============================================================================
static GUID pwlib_format_to_media_format(LPCSTR pszFormat);
static LPCSTR media_format_to_pwlib_format(const GUID guid);

//static PVideoInputPluginServiceDescriptor<BoneCapture> BoneCaptureDescriptor;
//PCREATE_PLUGIN(BoneCapture, PVideoInputDevice, &BoneCaptureDescriptor)

////////////////////////////////////////////////////////////////////////////////////////
//
// Some utilities
//
////////////////////////////////////////////////////////////////////////////////////////

static struct {
	const char*  pwlib_format;
	GUID         media_format;
} const formats[] =
{
	{ "Grey"    ,MEDIASUBTYPE_RGB8   },
    { "RGB8"    ,MEDIASUBTYPE_RGB8   },
	{ "BGR32"   ,MEDIASUBTYPE_RGB32  }, // Microsoft assumes that we are in little endian
	{ "BGR24"   ,MEDIASUBTYPE_RGB24  },
	{ "RGB565"  ,MEDIASUBTYPE_RGB565 },
	{ "RGB555"  ,MEDIASUBTYPE_RGB555 },
    { "I420"    ,MEDIASUBTYPE_I420   },
#ifndef _WIN32_WCE
	{ "YUV420P" ,MEDIASUBTYPE_IYUV   },  // YK Defined on WCE locally
    { "IYUV"    ,MEDIASUBTYPE_IYUV   },
    { "I420"    ,MEDIASUBTYPE_IYUV   },
    { "CLPL"    ,MEDIASUBTYPE_CLPL   },
 	{ "YUV422P" ,MEDIASUBTYPE_YUYV   },  // YK Defined on WCE locally
    { "YUYV"    ,MEDIASUBTYPE_YUYV   },
#endif
	{ "YUV411"  ,MEDIASUBTYPE_Y411   },
    { "Y411"    ,MEDIASUBTYPE_Y411   },

	{ "YUV411P" ,MEDIASUBTYPE_Y41P   },
    { "Y41P"    ,MEDIASUBTYPE_Y41P   },
	{ "YUV410P" ,MEDIASUBTYPE_YVU9   },
    { "YVU9"    ,MEDIASUBTYPE_YVU9   },
	{ "YUY2"    ,MEDIASUBTYPE_YUY2   },
    { "YUY2"    ,MEDIASUBTYPE_YUY2   },
	{ "MJPEG"   ,MEDIASUBTYPE_MJPG   },
    { "MJPG"    ,MEDIASUBTYPE_MJPG   },
	{ "UYVY422" ,MEDIASUBTYPE_UYVY   },
    { "UYVY"    ,MEDIASUBTYPE_UYVY   },
    { "YVYU"    ,MEDIASUBTYPE_YVYU   },
    { "Y211"    ,MEDIASUBTYPE_Y211   },
    { "YV12"    ,MEDIASUBTYPE_YV12   },
    { "CLJR"    ,MEDIASUBTYPE_CLJR   },
    { "IF09"    ,MEDIASUBTYPE_IF09   },
    { "CPLA"    ,MEDIASUBTYPE_CPLA   },
    { "TVMJ"    ,MEDIASUBTYPE_TVMJ   },
    { "WAKE"    ,MEDIASUBTYPE_WAKE   },
    { "CFCC"    ,MEDIASUBTYPE_CFCC   },
    { "IJPG"    ,MEDIASUBTYPE_IJPG   },
    { "Plum"    ,MEDIASUBTYPE_Plum   },
    { "DVCS"    ,MEDIASUBTYPE_DVCS   },
    { "DVSD"    ,MEDIASUBTYPE_DVSD   },
    { "MDVF"    ,MEDIASUBTYPE_MDVF   },
    { "RGB1"    ,MEDIASUBTYPE_RGB1   },
    { "RGB4"    ,MEDIASUBTYPE_RGB4   }
};

static GUID pwlib_format_to_media_format(LPCSTR pszFormat)
{
	unsigned int i;
	for (i=0;i<sizeof(formats)/sizeof(formats[0]); i++)
		if (_stricmp(formats[i].pwlib_format, pszFormat) == 0)
			return formats[i].media_format;
	return MEDIATYPE_NULL;
}

static LPCSTR media_format_to_pwlib_format(const GUID guid)
{
	unsigned int i;

	for (i=0; i<sizeof(formats)/sizeof(formats[0]); i++)
	{
		if (guid == formats[i].media_format)
			return formats[i].pwlib_format;
	}

	wchar_t guid_wchar[256];
	static char guid_string[256];
	int guid_wcharlen;

	guid_wcharlen = StringFromGUID2(guid, guid_wchar, sizeof(guid_wchar));
	WideCharToMultiByte(CP_ACP, 0,
		guid_wchar, guid_wcharlen+1,
		guid_string, sizeof(guid_string),
		0, 0);

	return guid_string;
}

static void MyDeleteMediaType(AM_MEDIA_TYPE *pmt)
{
	if (pmt == NULL)
		return;

	if (pmt->cbFormat != 0)
	{
		CoTaskMemFree((PVOID)pmt->pbFormat);
		pmt->cbFormat = 0;
		pmt->pbFormat = NULL;
	}
	if (pmt->pUnk != NULL)
	{
		// Uncessessary because pUnk should not be used, but safest.
		pmt->pUnk->Release();
		pmt->pUnk = NULL;
	}

	CoTaskMemFree(pmt);
}


HRESULT GetCapturePin(IBaseFilter* pFilter, IPin **ppPin)
{
    if (ppPin == NULL)
        return E_POINTER;

    HRESULT hr;

    CComPtr<IEnumPins>  cpEnum;
    CHK( pFilter->EnumPins(&cpEnum));

    IPin* pPin = NULL;
    while (cpEnum->Next(1, &pPin, 0) == S_OK)
    {
        PIN_INFO pinInfo;
        if (SUCCEEDED(pPin->QueryPinInfo(&pinInfo))) {
            dbLog("PinInfo \"%S\"\n", pinInfo.achName);
//            if (_wcsicmp(pinInfo.achName,L"Preview")==0) {
            if (_wcsicmp(pinInfo.achName,L"Capture")==0) {
                *ppPin = pPin;
                return S_OK;
            }
        }
        pPin->Release();
    }

    return E_FAIL;  
}




////////////////////////////////////////////////////////////////////////////////////////
//
// CPropertyBag
//
////////////////////////////////////////////////////////////////////////////////////////
struct VAR_LIST
{
    VARIANT var;
    VAR_LIST *pNext;
    BSTR pBSTRName;
};

class CPropertyBag : public IPropertyBag
{  
public:
    
	CPropertyBag() : _refCount(1), pVar(0)
	{       
	}

	~CPropertyBag()
	{
		VAR_LIST *pTemp = pVar;
		HRESULT hr = S_OK;

		while(pTemp)
		{
			VAR_LIST *pDel = pTemp;
			VariantClear(&pTemp->var);
			SysFreeString(pTemp->pBSTRName);
			pTemp = pTemp->pNext;
			delete pDel;
		}

	}

	HRESULT STDMETHODCALLTYPE
	Read(LPCOLESTR pszPropName, 
					   VARIANT *_pVar, 
					   IErrorLog *pErrorLog)
	{
		VAR_LIST *pTemp = pVar;
		HRESULT hr = S_OK;

		while(pTemp)
		{
			if(0 == wcscmp(pszPropName, pTemp->pBSTRName))
			{
				hr = VariantCopy(_pVar, &pTemp->var);
				break;
			}
			pTemp = pTemp->pNext;
		}
		return hr;
	}


	HRESULT STDMETHODCALLTYPE
	Write(LPCOLESTR pszPropName, 
						VARIANT *_pVar)
	{
		HRESULT hr = S_OK;
		VAR_LIST *pTemp = new VAR_LIST();
		ASSERT(pTemp);

		if( !pTemp )
		{
			return E_OUTOFMEMORY;
		}

		VariantInit(&pTemp->var);
		pTemp->pBSTRName = SysAllocString(pszPropName);
		pTemp->pNext = pVar;
		pVar = pTemp;
		return VariantCopy(&pTemp->var, _pVar);
	}

	ULONG STDMETHODCALLTYPE 
	AddRef() 
	{
		return InterlockedIncrement((LONG *)&_refCount);
	}

	ULONG STDMETHODCALLTYPE 
	Release() 
	{
		ASSERT(_refCount != 0xFFFFFFFF);
		ULONG ret = InterlockedDecrement((LONG *)&_refCount);    
		if(!ret) 
			delete this; 
		return ret;
	}

	HRESULT STDMETHODCALLTYPE 
	QueryInterface(REFIID riid, void** ppv) 
	{
		if(!ppv) 
			return E_POINTER;
		if(riid == IID_IPropertyBag) 
			*ppv = static_cast<IPropertyBag*>(this);	
		else 
			return *ppv = 0, E_NOINTERFACE;

		return AddRef(), S_OK;	
	}

private:
     ULONG _refCount;
     VAR_LIST *pVar;
};


//=============================================================================
// This is the COM object that represents a simple rendering filter. It
// supports IBaseFilter and IMediaFilter and a single input stream (pin)
// The classes that support these interfaces have nested scope NOTE the
// nested class objects are passed a pointer to their owning renderer
// when they are created but they should not use it during construction

class BoneRenderer : public CBaseVideoRenderer
{
    CRendererInputPin  m_InputPin;        // IPin based interfaces
public:
    LONG    m_cRef;
    DWORD   m_dwSampleSize;
    DWORD   m_dwSampleMaxSize;
    PBYTE   m_pSampleData;

    void    SetFormat(LPCSTR pszFormat, int iWidth, int iHeight);
    DWORD   GetFrameSize()          { return m_dwSampleSize;}
    PBYTE   GetFrame()              { return m_pSampleData;}
    void    ReleaseFrame()          { m_dwSampleSize = 0;}
    // Constructor and destructor

//    static CFactoryTemplate s_FactoryTemplate;
//    static CUnknown*  WINAPI CreateInstance(LPUNKNOWN pUnk, HRESULT* phr) {
//        return new BoneRenderer(NAME("Sample Video Renderer"),pUnk,phr);
//    }


    BoneRenderer(TCHAR* pName, HRESULT *phr)
    :   CBaseVideoRenderer(CLSID_BoneNullRenderer, pName, NULL, phr),
        m_InputPin(this, phr, L"Input"),
        m_dwSampleSize(0),
        m_dwSampleMaxSize(0),
        m_pSampleData(NULL),
        m_cRef(0)
    {
        m_pInputPin = &m_InputPin;
    }

    ~BoneRenderer()
    {
        m_dwSampleSize = 0;
        m_dwSampleMaxSize = NULL;
        delete [] m_pSampleData;
        m_pSampleData = NULL;

        m_pInputPin = NULL;
    }

    // Implement the ISpecifyPropertyPages interface
/*
    STDMETHODIMP QueryInterface(REFIID riid, void **ppv) {
        return NonDelegatingQueryInterface(riid,ppv); }

    STDMETHODIMP_(ULONG) AddRef() { return InterlockedIncrement(&m_cRef); }
    STDMETHODIMP_(ULONG) Release() { 
        ULONG cRef=InterlockedDecrement(&m_cRef); 
        if (cRef == 0) 
            delete this; 
        return cRef; 
    }
*/
    DECLARE_IUNKNOWN
    STDMETHODIMP NonDelegatingQueryInterface(REFIID riid,void **ppv)    
        { return CBaseVideoRenderer::NonDelegatingQueryInterface(riid,ppv);}

    CBasePin* GetPin(int n)         { return (n==0) ? &m_InputPin : NULL;}

    HRESULT CheckMediaType(const CMediaType *pmtIn)         { return S_OK;}
    HRESULT DoRenderSample(IMediaSample *pMediaSample);//  { return S_OK;}
}; // BoneRenderer


// DoRenderSample
//
// Have the drawing object render the current image
//
HRESULT BoneRenderer::DoRenderSample(IMediaSample* pMediaSample)
{
    HRESULT hr = S_OK;
    if (m_dwSampleSize != 0)
        return hr;

    DWORD dwLen = pMediaSample->GetActualDataLength();
    if (dwLen > m_dwSampleMaxSize) {
        if ((dwLen < 2) || (m_dwSampleMaxSize == 1)) 
            return S_OK;

        m_dwSampleMaxSize = 0;
        delete [] m_pSampleData;
        m_pSampleData = new BYTE[dwLen];
        if (!m_pSampleData) {
            m_dwSampleMaxSize = 1;
            return S_OK;
        }
        m_dwSampleMaxSize = dwLen;
    }

    PBYTE pbData;
    CHK( pMediaSample->GetPointer(&pbData));

    memcpy(m_pSampleData, pbData, dwLen);
    m_dwSampleSize = dwLen;

	return S_OK;
} // DoRenderSample

void BoneRenderer::SetFormat(LPCSTR pszFormat, int iWidth, int iHeight)
{
    m_dwSampleSize = 0;
    m_dwSampleMaxSize = NULL;
    delete [] m_pSampleData;
    m_pSampleData = NULL;

    if ((_stricmp(pszFormat,"I420")==0)     ||
        (_stricmp(pszFormat,"YUV420P")==0)  ||
        (_stricmp(pszFormat,"YV12")==0)     )
    {
        m_dwSampleMaxSize = abs(iWidth)*abs(iHeight);
        m_dwSampleMaxSize += m_dwSampleMaxSize >> 1;
    }

    if (m_dwSampleMaxSize) {
        m_pSampleData = new BYTE[m_dwSampleMaxSize];
        if (!m_pSampleData) 
            m_dwSampleMaxSize = 0;
    }
}


DWORD yv12_to_yuv410(int iWidth, int iHeight, PBYTE pSrc, DWORD szSrc, PBYTE pDst, DWORD szDst)
{
    DWORD size = abs(iWidth)*abs(iHeight);
    if (szDst < szSrc)
        return 0;

    if (szSrc != (size + (size>>1)))
        return 0;

    memcpy(pDst, pSrc, size);
    pDst += size;
    pSrc += size;
    size >>= 2;

    memcpy(pDst+size, pSrc, size);
    memcpy(pDst, pSrc+size, size);
    return szSrc;
 }

extern void rgb565_to_yuv420(uint width, uint height, uchar* rgb, int rgbPitch, uchar* y, int yPitch, uchar* u, int uPitch, uchar* v, int vPitch);
extern void rgb555_to_yuv420(uint width, uint height, uchar* rgb, int rgbPitch, uchar* y, int yPitch, uchar* u, int uPitch, uchar* v, int vPitch);

DWORD rgb565_to_yuv410(int iWidth, int iHeight, PBYTE pSrc, DWORD szSrc, PBYTE pDst, DWORD szDst)
{
    unsigned width = abs(iWidth);
    unsigned height = abs(iHeight);

    DWORD size = width*height;
    if (szSrc != (size*2))
        return 0;

    if (szDst < (size+(size>>1)))
        return 0;

    rgb565_to_yuv420(width, height,
        pSrc+(size*2)-(width*2), -int(width*2), 
        pDst, width, 
        pDst+size, width>>1, 
        pDst+size+(size>>2), width>>1);
    
    return size + (size>>1);
}

DWORD rgb555_to_yuv410(int iWidth, int iHeight, PBYTE pSrc, DWORD szSrc, PBYTE pDst, DWORD szDst)
{
    unsigned width = abs(iWidth);
    unsigned height = abs(iHeight);

    DWORD size = width*height;
    if (szSrc != (size*2))
        return 0;

    if (szDst < (size+(size>>1)))
        return 0;

    rgb555_to_yuv420(width, height,
        pSrc+(size*2)-(width*2), -int(width*2), 
        pDst, width, 
        pDst+size, width>>1, 
        pDst+size+(size>>2), width>>1);
    
    return size + (size>>1);
}


DWORD CopyImage(int iWidth, int iHeight, PBYTE pSrc, DWORD szSrc, PBYTE pDst, DWORD szDst)
{
    if (szDst < szSrc)
        return 0;

    memcpy(pDst, pSrc, szSrc);
    return szSrc;
 }


struct DirectShowVideoCapture: public IVideoInputDevice
{
private:
    bool                    m_bIsCapturing;
    int                     m_iCurrentFormat;
    GUID                    m_guidWantedFormat;
    GUID                    m_guidCurrentFormat;
    ICaptureGraphBuilder2*  m_pCapture;
    IGraphBuilder*          m_pGraph;
    IBaseFilter*            m_pSrcFilter;
    BoneRenderer*           m_pRenderFilter;
    IMediaControl*          m_pMediaControl;
    IMediaEventEx*          m_pMediaEvent;
    HANDLE                  m_handle[2];
    int                     m_iWidth;
    int                     m_iHeight;
    int                     m_fps;
    LPCSTR                  m_pszFormat;
    ColorConvert            m_funConverter;

    HRESULT    GetCurrentParam();
public:

        DirectShowVideoCapture();
        ~DirectShowVideoCapture();

    virtual bool    IsOpen()            { return m_pCapture != NULL; }
    virtual bool    IsCapturing()       { return m_bIsCapturing; }
    virtual HRESULT Open();
    virtual HRESULT Start();
    virtual HRESULT Stop();
    virtual HRESULT Pause();
    virtual HRESULT SetFormat(LPCSTR pszWantedFormat, int width, int height, int fps);
    virtual HRESULT GetSize(int& iWidth, int& iHeight) { if (m_pszFormat)   { iWidth=m_iWidth; iHeight=m_iHeight; return S_OK;} else return E_FAIL; }
    virtual LPCSTR  GetFormat()                        { return m_pszFormat;}
    virtual void    Close();
    virtual DWORD   GetFrame(PBYTE pData, DWORD size);

    virtual HRESULT Run()               { return ProcessShowEvent(); }

            int     GetBrightness   (void)          { return GetControlCommon(VideoProcAmp_Brightness);}
            int     GetWhiteness    (void)          { return GetControlCommon(VideoProcAmp_Gamma);} 
            int     GetColour       (void)          { return GetControlCommon(VideoProcAmp_Saturation);}
            int     GetContrast     (void)          { return GetControlCommon(VideoProcAmp_Contrast);}
            int     GetHue          (void)          { return GetControlCommon(VideoProcAmp_Hue);}

            HRESULT SetBrightness   (int iVal)      { return SetControlCommon(VideoProcAmp_Brightness, iVal);}
            HRESULT SetWhiteness    (int iVal)      { return SetControlCommon(VideoProcAmp_Gamma, iVal);} 
            HRESULT SetColour       (int iVal)      { return SetControlCommon(VideoProcAmp_Saturation, iVal);}
            HRESULT SetContrast     (int iVal)      { return SetControlCommon(VideoProcAmp_Contrast, iVal);}
            HRESULT SetHue          (int iVal)      { return SetControlCommon(VideoProcAmp_Hue, iVal);}

    HRESULT ProcessShowEvent();
    HRESULT SetControlCommon(long control,int iVal);
    int     GetControlCommon(long control);
};


HRESULT SaveGraphFile(IGraphBuilder *pGraph, WCHAR *wszPath) 
{
    if (pGraph == NULL)
    {
        return E_POINTER;
    }

    const WCHAR wszStreamName[] = L"ActiveMovieGraph"; 
    
    IStorage *pStorage = NULL;
    IStream *pStream = NULL;
    IPersistStream *pPersist = NULL;

    HRESULT hr = StgCreateDocfile(
        wszPath,
        STGM_CREATE | STGM_TRANSACTED | STGM_READWRITE | STGM_SHARE_EXCLUSIVE,
        0, &pStorage);

    if(SUCCEEDED(hr)) 
    {
        hr = pStorage->CreateStream(
            wszStreamName,
            STGM_WRITE | STGM_CREATE | STGM_SHARE_EXCLUSIVE,
            0, 
            0, 
            &pStream);
    }

    if (SUCCEEDED(hr))
    {
        hr = pGraph->QueryInterface(IID_IPersistStream, (void**)&pPersist);
    }

    if (SUCCEEDED(hr))
    {
        hr = pPersist->Save(pStream, TRUE);
    }

    if (SUCCEEDED(hr)) 
    {
        hr = pStorage->Commit(STGC_DEFAULT);
    }

    SAFE_RELEASE(pStorage);
    SAFE_RELEASE(pStream);
    SAFE_RELEASE(pPersist);

    return hr;
}


IVideoInputDevice* GetVideoInputDevice()
{
    DirectShowVideoCapture* pVideo = new DirectShowVideoCapture();
    if (!pVideo || !SUCCEEDED(pVideo->Open())) {
        delete pVideo;
        return NULL;
    }
    return pVideo;
}

DirectShowVideoCapture::DirectShowVideoCapture()
    :   m_bIsCapturing(false),
        m_iCurrentFormat(0),
        m_pCapture(NULL),
        m_pGraph(NULL),
        m_pRenderFilter(NULL),
        m_pSrcFilter(NULL),
        m_pMediaEvent(NULL),
        m_iWidth(160),
        m_iHeight(120),
        m_fps(0),
        m_pszFormat(NULL),
        m_funConverter(CopyImage)

{
    m_handle[0] = NULL;
    m_handle[1] = NULL;

    m_guidCurrentFormat = MEDIASUBTYPE_NULL;
    m_guidWantedFormat  = MEDIASUBTYPE_I420;


#ifndef _WIN32_WCE
	CoInitialize(NULL);
#else
	CoInitializeEx(NULL,COINIT_MULTITHREADED);
#endif

    /*
	m_sampleFrame = NULL;
	m_tempFrame = NULL;
*/
	m_pSrcFilter = NULL;
	m_pGraph = NULL;
	m_pMediaControl = NULL;
	m_pMediaEvent = NULL;
	m_pCapture = NULL;
	//m_pGrabber = NULL;

	//isCapturingNow = PFalse;
	//capturing_duration = 10000; // arbitrary large value suffices

	ZeroMemory( m_handle, sizeof( m_handle ));
	//m_hCommandCompleted = NULL;
	//m_currentCommand = COMMAND_NOCOMMAND;

}

DirectShowVideoCapture::~DirectShowVideoCapture()
{
/*
	if (m_sampleFrame != NULL)
		free(m_sampleFrame);

	if (m_tempFrame != NULL)
		free(m_tempFrame);

	Close();
*/
	::CoUninitialize();
}


HRESULT DirectShowVideoCapture::Open() //(const PString & devName, PBoolean startImmediate)
{
	HRESULT hr;
	
	//	PTRACE(capTraceLevel, "BoneCap\tOpen('" << (const char*) devName << "'," << startImmediate<<")");

	Close();



#if 0
	m_openCloseMutex.Wait();

	deviceName = devName;

    // Create the event that will signal the thread for commands
    m_handle[0] = CreateEvent( NULL, FALSE, FALSE, NULL );
    if( m_handle[0] == NULL )
    {
		PTRACE(capTraceLevel, "DirectShow::Open() CreateEvent for handle failed, hr:" <<  HRESULT_FROM_WIN32( GetLastError() ));
    }
    m_handle[1] = 0;

    // Create the event to sync on to wait for the command to be executed
    m_hCommandCompleted = CreateEvent( NULL, FALSE, FALSE, NULL );
    if( m_hCommandCompleted == NULL )
    {
		PTRACE(capTraceLevel, "DirectShow::Open() CreateEvent for command completed failed, hr:" <<  HRESULT_FROM_WIN32( GetLastError() ));
    }
#endif
// oprn

    CHK( SetDevice(L"QQQ", &m_pSrcFilter) );
	CHK( CoCreateInstance (CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, 
                           IID_IGraphBuilder, (void**) &m_pGraph));
#ifndef _WIN32_WCE
	CHK( CoCreateInstance (CLSID_CaptureGraphBuilder2 , NULL, CLSCTX_INPROC_SERVER,
                           IID_ICaptureGraphBuilder2, (void **) &m_pCapture));
#else
	CHK( CoCreateInstance (CLSID_CaptureGraphBuilder , NULL, CLSCTX_INPROC_SERVER,
                           IID_ICaptureGraphBuilder2, (void **) &m_pCapture));
#endif


    m_pRenderFilter = new BoneRenderer(L"Video Render", &hr);
    if (m_pRenderFilter->GetOwner() != NULL)
        m_pRenderFilter->GetOwner()->AddRef();

	// Obtain interfaces for media control and Video Window
	CHK( m_pGraph->QueryInterface(IID_IMediaControl, (LPVOID *) &m_pMediaControl));
	CHK( m_pGraph->QueryInterface(IID_IMediaEvent, (LPVOID *) &m_pMediaEvent));

	// Attach the filter graph to the capture graph
	CHK( m_pCapture->SetFiltergraph(m_pGraph));

	//Add the filter to the graph
	CHK( m_pGraph->AddFilter(m_pSrcFilter, L"Video Capture"));
    CHK( m_pGraph->AddFilter(m_pRenderFilter, L"Bone Grabber"));

    // SaveGraphFile( m_pGraph, L"c:\\a0.grf");

    //	SetDeliveryBuffer();
    // http://msdn2.microsoft.com/en-us/library/ms784859.aspx
/*
	CHK( m_pCapture->RenderStream(&PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video,
		m_pSrcFilter,	    // Source Filter
		NULL,	            // Intermediate Filter
		m_pRenderFilter	    // Sink Filter
		));
*/

    CComPtr<IPin>   cpCapturePin;
    CHK(GetCapturePin(m_pSrcFilter, &cpCapturePin));
    CHK(cpCapturePin->Connect(m_pRenderFilter->GetPin(0),NULL));

    //
    // Prevent the data from flowing into the capture stream
    //
	LONGLONG dwStart = 0, dwEnd = 0;
    WORD wStartCookie = 1, wEndCookie = 2;
	

    hr = m_pCapture->ControlStream( &PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie );
	//
	// Let's get the handle for DShow events. The main loop will listen to both notifications from 
	// the UI thread and for DShow notifications
	//
    
	// Obtain interfaces for media control and Video Window
	hr = m_pGraph->QueryInterface(IID_IMediaControl,(LPVOID *) &m_pMediaControl);

	//OAEVENT oaEvent;
	//CHK( m_pMediaEvent->GetEventHandle( &oaEvent )) ;
    //m_handle[1] = (HANDLE) oaEvent;
    CHK(GetCurrentParam());
	CHK(m_pMediaControl->Run());

#if 0
	m_thread = PThread::Create(PCREATE_NOTIFIER(HandleCapture), 0,
		PThread::NoAutoDeleteThread, PThread::NormalPriority, // YK
		"BoneCapture:%x");

	m_openCloseMutex.Signal();
	m_started.Wait();

	// Check if init was successful
	if( !IsOpen() )
		return PFalse;

	PWaitAndSignal m(m_openCloseMutex);

	deviceName = devName;

	if (startImmediate)
		return Start();

	return PTrue;
#endif
    return S_OK;
}

void DirectShowVideoCapture::Close()
{
    m_pSrcFilter    = NULL;
    m_pRenderFilter = NULL;
}

HRESULT DirectShowVideoCapture::Start()
{
    HRESULT  hr = S_OK;
	if (IsCapturing())
		return hr;

//	PTRACE(capTraceLevel, "BoneCap\tInternalStart()");

   // To start the video capture, call ICaptureGraphBuilder2::ControlStream. 
	LONGLONG    dwStart = 0;
	LONGLONG    dwEnd = MAXLONGLONG;
    WORD        wStartCookie = 1;
    WORD        wEndCookie = 2;

	CHK( m_pCapture->ControlStream( &PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie ));
//	CHK( m_pCapture->ControlStream( &PIN_CATEGORY_PREVIEW, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie ));
    CHK( m_pMediaControl->Run() );

	m_bIsCapturing = true;

	return hr;
}

HRESULT DirectShowVideoCapture::Pause()
{
    HRESULT hr = S_OK;
	if (!IsCapturing())
		return hr;

	// If running, pause
	if ( m_pMediaControl )
	{
		OAFilterState filterState = State_Stopped;
		m_pMediaControl->GetState(1000, &filterState);
		if (filterState == State_Running)
			m_pMediaControl->Pause();
	}

	return hr;
}

HRESULT DirectShowVideoCapture::Stop()
{
    HRESULT   hr = S_OK;
#if 0
	PTRACE(capTraceLevel, "BoneCap\tInternalStop()");

	if (!IsCapturing())
		return hr;

	// Tell grabber to stop buffer samples


    CComPtr<IMediaSeeking> cpMediaSeeking;
    CHK( m_pGraph->QueryInterface( &cpMediaSeeking ));

    // Stop the capture of the graph
    LONGLONG  dwStart = 0;
    LONGLONG  dwEnd = 0;
    WORD      wStartCookie = 1;
    WORD      wEndCookie   = 2;

	CHK( cpMediaSeeking->GetCurrentPosition( &dwEnd ));
    CHK( m_pCapture->ControlStream( &PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie ));
    m_bIsCapturing = FALSE;
#endif
    return hr;
}

/*
 *
 * Change Colourspace AND FrameSize by looking if the resolution is supported by the hardware.
 *
 */

// Note: as of now devices supported are following: 
// O2: MEDIASUBTYPE_RGB565, size: 176x144 
// ATT 8525: MEDIASUBTYPE_RGB565, size: 160 x -120
// Emulator: MEDIASUBTYPE_RGB565 and MEDIASUBTYPE_YV12

HRESULT DirectShowVideoCapture::SetFormat(LPCSTR pszWantedFormat, int width, int height, int fps)
{
	HRESULT hr = S_OK;

    if (*pszWantedFormat) {
        m_guidWantedFormat = pwlib_format_to_media_format(pszWantedFormat);
        if (m_guidWantedFormat == MEDIATYPE_NULL)
            return E_INVALIDARG;
    }

    CComPtr<IAMStreamConfig> cpStreamConfig;
	CHK( m_pCapture->FindInterface(&PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video,
        m_pSrcFilter, IID_IAMStreamConfig, (void **)&cpStreamConfig));

	int iCount, iSize;
	CHK( cpStreamConfig->GetNumberOfCapabilities(&iCount, &iSize));
    
    VIDEO_STREAM_CONFIG_CAPS    scc;

    // Sanity check: just to be sure that the Streamcaps is a VIDEOSTREAM and not AUDIOSTREAM
	if (sizeof(scc) != iSize)
		return E_UNEXPECTED;

	AM_MEDIA_TYPE* pBestMediaFormat = NULL;
	AM_MEDIA_TYPE* pMediaFormat     = NULL;
    int iBestFormatPrio = 1000;

	for (int i=0; i<iCount && iBestFormatPrio>0; i++, MyDeleteMediaType(pMediaFormat))
	{
		pMediaFormat = NULL;
		hr = cpStreamConfig->GetStreamCaps(i, &pMediaFormat, (BYTE *)&scc);
		if (FAILED(hr))
		{
//			PTRACE(capTraceLevel, "BoneCap\tFailed to GetStreamCaps(" << i <<"): " << ErrorMessage(hr));
			continue;
		}

		if ((pMediaFormat->formattype != FORMAT_VideoInfo)      ||
			(pMediaFormat->cbFormat < sizeof(VIDEOINFOHEADER)) ||
			(pMediaFormat->pbFormat == NULL)                    )
			continue;

		VIDEOINFOHEADER*  VideoInfo = (VIDEOINFOHEADER *) pMediaFormat->pbFormat;
		BITMAPINFOHEADER* BitmapInfo = &(VideoInfo->bmiHeader);
		const int maxfps = (int)(10000000.0/VideoInfo->AvgTimePerFrame);

#ifdef _WIN32_WCE_SB
		// Very special case: if RGB565, then let it know we can convert this format to YUV420
		if( (wanted_guid_format != pMediaFormat->subtype) 
			&& wanted_guid_format == MEDIASUBTYPE_IYUV )
		{
			PTRACE(capTraceLevel, "BoneCap\tWe have reported to support YUV while having RGB565!");
		}
		else
#endif
        dbLog("Find format \"%s\" Width=%d, Height=%d, fps=%d\n",
            media_format_to_pwlib_format(pMediaFormat->subtype),
            BitmapInfo->biWidth,
            BitmapInfo->biHeight,
            maxfps);

        if (width && BitmapInfo->biWidth != width)
			continue;

		if (height && BitmapInfo->biHeight != height)
			continue;

        int iFormatPrio = 0;
		// Generic case



        if (*pszWantedFormat && (m_guidWantedFormat != pMediaFormat->subtype)) {
            if (m_guidWantedFormat != MEDIASUBTYPE_I420)
                continue;
#ifndef _WIN32_WCE
            if (pMediaFormat->subtype == MEDIASUBTYPE_IYUV) 
                iFormatPrio = 1;
            else
#endif
            if (pMediaFormat->subtype == MEDIASUBTYPE_YV12) 
                iFormatPrio = 2;
            else if (pMediaFormat->subtype == MEDIASUBTYPE_RGB565) 
                iFormatPrio = 3;
            else if (pMediaFormat->subtype == MEDIASUBTYPE_RGB555) 
                iFormatPrio = 4;
            else
                continue;
        }

		if (fps && fps <= maxfps)
			VideoInfo->AvgTimePerFrame = (LONGLONG) (10000000.0 / (double)fps);

        if (!pBestMediaFormat || iBestFormatPrio > iFormatPrio) {
            m_iCurrentFormat = i;
            iBestFormatPrio = iFormatPrio;
            MyDeleteMediaType(pBestMediaFormat);
            pBestMediaFormat = pMediaFormat;
            pMediaFormat = NULL;
        }
    }

    if (!pBestMediaFormat)
        return E_FAIL;
    
    OAFilterState filterState = State_Stopped;
	if (m_pMediaControl)
	{
	    hr = m_pMediaControl->GetState(1000, &filterState);
//		PTRACE_IF(capTraceLevel, FAILED(hr), "BoneCap\tGetState failed: " << ErrorMessage(hr));
		m_pMediaControl->StopWhenReady();
    }

    hr = cpStreamConfig->SetFormat(pBestMediaFormat);
    if (FAILED(hr))
    {
//	    PTRACE(capTraceLevel, "BoneCap\tFailed to SetFormat: " << ErrorMessage(hr) << ", fmt:" << media_format_to_pwlib_format(pMediaFormat->subtype));
        return hr;
    }

    MyDeleteMediaType(pBestMediaFormat);
    GetCurrentParam();

//  if (iBestFormatPrio != 0);
//  if (m_guidCurrentFormat !=);    

    if (m_pMediaControl)  
	{
	    if ( filterState == State_Running )
	        m_pMediaControl->Run();
	    else if( filterState == State_Paused)
	        m_pMediaControl->Pause();
	}

    return S_OK;
}


DWORD DirectShowVideoCapture::GetFrame(PBYTE pData, DWORD size)
{
    if (!m_pRenderFilter)
        return 0;

    if (m_pRenderFilter->m_dwSampleSize == 0)
        return 0;

    DWORD dConvert = m_funConverter( 
        m_iWidth, m_iHeight, 
        m_pRenderFilter->m_pSampleData, m_pRenderFilter->m_dwSampleSize,
        pData, size);

    m_pRenderFilter->m_dwSampleSize = 0;

    return dConvert;
}



HRESULT DirectShowVideoCapture::GetCurrentParam()
{
    if (!m_pCapture)
        return E_UNEXPECTED;

    HRESULT hr = S_OK;

    m_iWidth  = 160;
    m_iHeight = 120;
    m_fps = 0;
    m_pszFormat = NULL;

	CComPtr<IAMStreamConfig> cpStreamConfig;

	CHK( m_pCapture->FindInterface(&PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video,
		m_pSrcFilter, IID_IAMStreamConfig, (void**) &cpStreamConfig));

	AM_MEDIA_TYPE* pMediaFormat;
	CHK( cpStreamConfig->GetFormat(&pMediaFormat));

    if ((pMediaFormat->formattype != FORMAT_VideoInfo)      ||
		(pMediaFormat->cbFormat < sizeof(VIDEOINFOHEADER))  ||
		(pMediaFormat->pbFormat == NULL)                    )
        return E_FAIL;

    VIDEOINFOHEADER* pVideoInfo = (VIDEOINFOHEADER*) pMediaFormat->pbFormat;

    m_pszFormat = media_format_to_pwlib_format(pMediaFormat->subtype);
    m_iWidth    = pVideoInfo->bmiHeader.biWidth;
    m_iHeight   = pVideoInfo->bmiHeader.biHeight;
    m_fps       = (int)(10000000.0/pVideoInfo->AvgTimePerFrame);

    if (m_guidCurrentFormat == MEDIATYPE_NULL)
        m_guidCurrentFormat = pMediaFormat->subtype;
    else if (m_guidCurrentFormat != pMediaFormat->subtype)
        return E_FAIL;

    m_funConverter = CopyImage;

    if ( (m_guidWantedFormat != MEDIATYPE_NULL) && (m_guidCurrentFormat != m_guidWantedFormat)) {
        if (m_guidWantedFormat != MEDIASUBTYPE_I420)
            return E_FAIL;
        else if (m_guidCurrentFormat == MEDIASUBTYPE_YV12)
            m_funConverter = yv12_to_yuv410;
        else if (m_guidCurrentFormat == MEDIASUBTYPE_RGB565)
            m_funConverter = rgb565_to_yuv410;
        else if (m_guidCurrentFormat == MEDIASUBTYPE_RGB555)
            m_funConverter = rgb555_to_yuv410;
/*
        else if (m_guidCurrentFormat == MEDIASUBTYPE_IYUV)
            m_funConverter = rgb555_to_yuv410;
        else if (m_guidCurrentFormat == MEDIASUBTYPE_RGB555)
            m_funConverter = rgb555_to_yuv410;
*/
        else 
            return E_FAIL;
    }

	MyDeleteMediaType(pMediaFormat);
/*
    CComPtr<IMediaSeeking>          cpMediaSeeking;
    CComPtr<IAMVideoCompression>    cpAMVideoCompression;
    CComPtr<IAMVideoControl>        cpAMVideoControl;
    CComPtr<IAMVideoProcAmp>        cpAMVideoProcAmp;
    
    m_pSrcFilter->QueryInterface(&cpMediaSeeking);
    m_pSrcFilter->QueryInterface(&cpAMVideoCompression);
    m_pSrcFilter->QueryInterface(&cpAMVideoControl);
    m_pSrcFilter->QueryInterface(&cpAMVideoProcAmp);


    CComPtr<IPin>   cpPin;

    GetCapturePin(m_pSrcFilter, &cpPin);

    if (cpAMVideoControl && cpPin) {
        LONGLONG llActualFrameRate = 0;
        hr = cpAMVideoControl->GetCurrentActualFrameRate(cpPin,&llActualFrameRate);
        dbLog("GetCurrentActualFrameRate = 0x%8.8x , %ld\n",hr,llActualFrameRate);

        SIZE sz;
        sz.cx = m_iWidth;
        sz.cy = m_iHeight;
        long        lListSize;
        LONGLONG*   pFrameRates=NULL;

        hr = cpAMVideoControl->GetFrameRateList( cpPin, m_iCurrentFormat, sz, &lListSize, &pFrameRates);
        if (hr == S_OK) {
            if (pFrameRates) {
                for (int i=0;i<lListSize;++i) 
                    dbLog("FrameRates[%d] = %ld\n",i,pFrameRates[i]);
                CoTaskMemFree(pFrameRates);
            }
        }
    }

    if (cpMediaSeeking) {

    }
    */

    return S_OK;
}

HRESULT DirectShowVideoCapture::ProcessShowEvent()
{
    HRESULT hr = S_OK;

    if( m_pMediaEvent == NULL )
	{
        dbLog("ProcessShowEvent but mc is null!" );
        return E_FAIL;
    }

    for(;;) {
        long  lEventCode, lParam1, lParam2;
        HRESULT hr = m_pMediaEvent->GetEvent( &lEventCode, &lParam1, &lParam2, 0 );
    
        if (hr != S_OK) 
            return S_OK;

        switch (lEventCode) {
        case EC_STREAM_CONTROL_STARTED:  dbLog("ProcessShowEvent EC_STREAM_CONTROL_STARTED\n" );    break;
        case EC_STREAM_CONTROL_STOPPED:  dbLog("ProcessShowEvent EC_STREAM_CONTROL_STOPPED\n" );    break;
        case EC_CAP_FILE_COMPLETED:      dbLog("ProcessShowEvent EC_CAP_FILE_COMPLETED\n" );        break;
        default:                         dbLog("ProcessShowEvent, Event: %d\n",lEventCode);        break;
        }

        m_pMediaEvent->FreeEventParams( lEventCode, lParam1, lParam2 );
    }
}


static HRESULT SetDevice(LPCWSTR pszDevName, IBaseFilter ** ppSrcFilter)
{
	HRESULT hr = S_OK;

	if (!ppSrcFilter)
        return E_INVALIDARG;


//    PTRACE(capTraceLevel, "BoneCap\tSetDevice(" << devName << ")");

#ifndef _WIN32_WCE

	IBaseFilter*            pSrc = NULL;
	CComPtr<ICreateDevEnum> cpDevEnum;
    CComPtr<IEnumMoniker>   cpClassEnum;
	ULONG cFetched;

//	PTRACE(capTraceLevel, "BoneCap\tSetDevice(" << devName << ")");

    // Create the system device enumerator

	CHK( CoCreateInstance (CLSID_SystemDeviceEnum, NULL, CLSCTX_INPROC,
		IID_ICreateDevEnum, (void **) &cpDevEnum));

	// Create an enumerator for the video capture devices

	CHK( cpDevEnum->CreateClassEnumerator(CLSID_VideoInputDeviceCategory, &cpClassEnum, 0) );

	if (cpClassEnum == NULL)
        hr = E_FAIL;

    CHK( hr );

	cpClassEnum->Reset();

	*ppSrcFilter = NULL;
	while (*ppSrcFilter == NULL)
	{
	    CComPtr<IMoniker>  cpMoniker;

		// Get the next device
		hr = cpClassEnum->Next(1, &cpMoniker, &cFetched);
		if (hr != S_OK)
		{
			PTRACE(capTraceLevel,  "BoneCap\tSetDevice() No more video capture device");
			hr = ERROR_DEVICE_NOT_CONNECTED;
			break;
		}

		// Get the property bag
	    CComPtr<IPropertyBag>  cpPropBag;

		hr = cpMoniker->BindToStorage(0, 0, IID_IPropertyBag, (void**)(&cpPropBag));
		if (FAILED(hr))
			continue;

		// Find the description or friendly name.
		CComVariant varDeviceName;

//		VARIANT varDeviceName;
//      VariantInit(&varDeviceName);

		hr = cpPropBag->Read(L"Description", &varDeviceName, 0);

		if (FAILED(hr) || (varDeviceName.vt != VT_BSTR))
			hr = cpPropBag->Read(L"FriendlyName", &varDeviceName, 0);

		if (SUCCEEDED(hr) && (varDeviceName.vt == VT_BSTR))
		{
//			PTRACE(capTraceLevel,  "BoneCap\tSetDevice() current capture device '"<< pDeviceName << "'");
//			if (pDeviceName && (P_MAX_INDEX != devName.Find(pDeviceName)))
			{
				// Bind Moniker to a filter object
				hr = cpMoniker->BindToObject(0, 0, IID_IBaseFilter, (void**)&pSrc);
				if (FAILED(hr))
				{
//					PTRACE(capTraceLevel, "BoneCap\tSetDevice() Couldn't bind moniker to filter object: " << ErrorMessage(hr));
				}
//				PTRACE(capTraceLevel,  "BoneCap\tSetDevice() This one is kept '"<< pDeviceName << "'");
				*ppSrcFilter = pSrc;
			}
		}

//        VariantClear(&varDeviceName);
		// Next Device
    }
#else

	GUID guidCamera = { 0xCB998A05, 0x122C, 0x4166, 0x84, 0x6A, 0x93, 0x3E, 0x4D, 0x7E, 0x3C, 0x86 };
	// Note about the above: The driver material doesn't ship as part of the SDK. This GUID is hardcoded
	// here to be able to enumerate the camera drivers and pass the name of the driver to the video capture filter

	DEVMGR_DEVICE_INFORMATION di;
	ZeroMemory(&di, sizeof(di));
	di.dwSize = sizeof(di);


    // Get first camera driver
	HANDLE handle = FindFirstDevice( DeviceSearchByGuid, &guidCamera, &di );
//  WCHAR* pszDevSearch = L"C*";
//	HANDLE handle = FindFirstDevice( DeviceSearchByDeviceName, pszDevSearch, &di );
	if ((handle == NULL) || (di.hDevice == NULL))
        return HRESULT_FROM_WIN32(GetLastError());

    BOOL bNext = false;
//	WCHAR   wzDeviceName[ MAX_PATH + 1 ];
    CComVariant   varCamName;

    do {
        if (!bNext) 
            varCamName = di.szLegacyName;

//      if (di.hDevice != NULL)
        dbLog("LegacyName=\"%S\",DeviceKey=\"%S\",DeviceName=\"%S\",BusName=\"%S\"\n",  di.szLegacyName, di.szDeviceKey, di.szDeviceName, di.szBusName);
        bNext = FindNextDevice(handle,&di);
    } while (bNext);

    FindClose( handle );

    // Write cap name to prop bag
    if (varCamName.vt != VT_BSTR)
        return E_OUTOFMEMORY;

    //
    // Create and initialize the video capture filter
    //
    CComPtr<IBaseFilter>            cpVideoCapture;
    CHK( CoCreateInstance(CLSID_VideoCapture, NULL, CLSCTX_INPROC, IID_IBaseFilter, (void**) &cpVideoCapture));

    // Get property bag from filter
    CComPtr<IPersistPropertyBag>    cpPropertyBag;
	CHK( cpVideoCapture->QueryInterface(IID_IPersistPropertyBag, (void**) &cpPropertyBag));


	CPropertyBag  PropBag;
    CHK( PropBag.Write( L"VCapName", &varCamName ));   
    CHK( cpPropertyBag->Load( &PropBag, NULL ));


    // Return back the source filter
    *ppSrcFilter = cpVideoCapture;
    (*ppSrcFilter)->AddRef();


#endif
    return hr;
}




/*
* Get brightness, contrast, hue, saturation
*/

#define CHKCNTL(exp)  if (FAILED(exp)) { dbLogFL(__FILE__,__LINE__,"CHKCNTR err=0x%8.8x(%d) \"%s\"",hr,hr,#exp); return -1;} else

int DirectShowVideoCapture::GetControlCommon(long control)
{
    HRESULT hr;

	long Min, Max, Stepping, Def, CapsFlags, Val;

    CComPtr<IAMVideoProcAmp> cpAMVideoProcAmp;

    CHKCNTL(m_pSrcFilter->QueryInterface(&cpAMVideoProcAmp));
    CHKCNTL(cpAMVideoProcAmp->GetRange(control, &Min, &Max, &Stepping, &Def, &CapsFlags));
	CHKCNTL(cpAMVideoProcAmp->Get(control, &Val, &CapsFlags));

	if (CapsFlags == VideoProcAmp_Flags_Auto)
		return -1;
    else
        return ((Val - Min) * 65536) / ((Max-Min));
}


/*
* Set brightness, contrast, hue, saturation
*/

HRESULT DirectShowVideoCapture::SetControlCommon(long control, int newValue)
{
    HRESULT hr;
	long Min, Max, Stepping, Def, CapsFlags, Val;

    CComPtr<IAMVideoProcAmp> cpAMVideoProcAmp;

    CHK(m_pSrcFilter->QueryInterface(&cpAMVideoProcAmp));
    CHK(cpAMVideoProcAmp->GetRange(control, &Min, &Max, &Stepping, &Def, &CapsFlags));

    if (newValue == -1) {
		CHK( cpAMVideoProcAmp->Set(control, 0, VideoProcAmp_Flags_Auto));
    }
	else
	{
		long ValScaled = Min + ((Max-Min) * newValue) / 65536;
		CHK( cpAMVideoProcAmp->Set(control, ValScaled, VideoProcAmp_Flags_Manual));
	}

    CHK(cpAMVideoProcAmp->Get(control, &Val, &CapsFlags));

	if (CapsFlags == VideoProcAmp_Flags_Auto)
		return -1;
    else
        return ((Val - Min) * 65536) / ((Max-Min));
}


#if 0



#ifndef _WIN32_WCE

#if PTRACING

static const char *ErrorMessage(HRESULT hr)
{
	static char string[1024];
    DWORD dwMsgLen;

    memset(string, 0, sizeof(string));
    dwMsgLen = FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM |
			      FORMAT_MESSAGE_IGNORE_INSERTS,
			      NULL,
			      hr,
			      MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
			      (LPSTR)string,
			      sizeof(string)-1,
			      NULL);
    if (dwMsgLen)
	return string;

    memset(string, 0, sizeof(string));
    dwMsgLen = AMGetErrorTextA(hr, string, sizeof(string));
    if (dwMsgLen)
		return string;
#ifdef __MINGW32__  // This function is not recognised in Windows
    snprintf(string, sizeof(string), "0x%8.8x", hr);
	return string;
#else
	return PString();
#endif
}

#endif // PTRACING


#else // _UNICODE
#define ErrorMessage(hr) "0x" << hex << hr << dec
#endif // !_WIN32_WCE

////////////////////////////////////////////////////////////////////////////////////////
//
// BoneCapture
//
////////////////////////////////////////////////////////////////////////////////////////

BoneCapture::BoneCapture() :
	m_rgb565convert(0, 0)
{
	PTRACE(capTraceLevel, "BoneCap\tBoneCapture: constructor" );

#ifndef _WIN32_WCE
	CoInitialize(NULL);
#else
	CoInitializeEx(NULL,COINIT_MULTITHREADED);
#endif

	m_sampleFrame = NULL;
	m_tempFrame = NULL;

	m_pSrcFilter = NULL;
	m_pGraph = NULL;
	m_pMediaControl = NULL;
	m_pMediaEvent = NULL;
	m_pCapture = NULL;

	isCapturingNow = PFalse;
	capturing_duration = 10000; // arbitrary large value suffices

	ZeroMemory( m_handle, sizeof( m_handle ));
	m_hCommandCompleted = NULL;
	m_currentCommand = COMMAND_NOCOMMAND;
}

BoneCapture::~BoneCapture()
{
	if (m_sampleFrame != NULL)
		free(m_sampleFrame);

	if (m_tempFrame != NULL)
		free(m_tempFrame);

	Close();
	::CoUninitialize();
}


HRESULT BoneCapture::SetDeliveryBuffer()
{
	HRESULT hr = S_OK;

	// Set up a delivery buffer for the grabber
	//
	ALLOCATOR_PROPERTIES props;
	props.cBuffers = 1;
	props.cbBuffer = frameWidth * frameHeight *3; // To accomodate up to RGB32
	props.cbAlign = 1;
	props.cbPrefix = 0;

	if (m_sampleFrame)
		free(m_sampleFrame);

	m_sampleFrame = (BYTE*) malloc(props.cbBuffer);

	PAssert(NULL != m_sampleFrame, "BoneCap\tNot enough memory to allocate sampleFrame");

	PAssert(hr == NOERROR, "BoneCap\tError while setting delivery buffer");

#if 0 // This code below not working yet
	// Set a partially specified media type.
	CMediaType mt;
	mt.SetType( &MEDIATYPE_Video );
#ifndef _WIN32_WCE
	mt.SetSubtype( &MEDIASUBTYPE_RGB24 );
#else
	mt.SetSubtype( &GUID_NULL );
#endif
	PAssert(hr == NOERROR, "BoneCap\tError while setting accepted media type");
#endif

	return hr;
}

PBoolean BoneCapture::Open(const PString & devName, PBoolean startImmediate)
{
	PTRACE(capTraceLevel, "BoneCap\tOpen('" << (const char*) devName << "'," << startImmediate<<")");

	Close();

	m_openCloseMutex.Wait();

	deviceName = devName;

    // Create the event that will signal the thread for commands
    m_handle[0] = CreateEvent( NULL, FALSE, FALSE, NULL );
    if( m_handle[0] == NULL )
    {
		PTRACE(capTraceLevel, "DirectShow::Open() CreateEvent for handle failed, hr:" <<  HRESULT_FROM_WIN32( GetLastError() ));
    }
    m_handle[1] = 0;

    // Create the event to sync on to wait for the command to be executed
    m_hCommandCompleted = CreateEvent( NULL, FALSE, FALSE, NULL );
    if( m_hCommandCompleted == NULL )
    {
		PTRACE(capTraceLevel, "DirectShow::Open() CreateEvent for command completed failed, hr:" <<  HRESULT_FROM_WIN32( GetLastError() ));
    }

	m_thread = PThread::Create(PCREATE_NOTIFIER(HandleCapture), 0,
		PThread::NoAutoDeleteThread, PThread::NormalPriority, // YK
		"BoneCapture:%x");

	m_openCloseMutex.Signal();
	m_started.Wait();

	// Check if init was successful
	if( !IsOpen() )
		return PFalse;

	PWaitAndSignal m(m_openCloseMutex);

	deviceName = devName;

	if (startImmediate)
		return Start();

	return PTrue;
}

PBoolean BoneCapture::Start()
{
	PTRACE(capTraceLevel, "BoneCap\tStart()");

    m_currentCommand = COMMAND_STARTCAPTURE;
    SetEvent( m_handle[0] );
    WaitForSingleObject( m_hCommandCompleted, INFINITE );

	return m_hLastResult == NOERROR ? PTrue : PFalse;
}


void BoneCapture::HandleCapture(PThread &, INT)
{
    bool bResult = true;
	HRESULT       hr = S_OK;
    DWORD         dwReturnValue;
    GRAPHCOMMANDS command = COMMAND_NOCOMMAND;

	PTRACE(capTraceLevel, "Enter\tBoneCapture::HandleCapture()"); 

	// Get capture initialized
	if (!SUCCEEDED(InitialiseCapture()))
	{
		PTRACE(capTraceLevel, "Exit\tBoneCapture::HandleCapture() failed, capture not initialized"); 
		bResult = PFalse;
	}
	else
	{
		// Sort the format out
		if(!SUCCEEDED(ListSupportedFormats()))
		{
			PTRACE(capTraceLevel, "Exit\tBoneCapture::HandleCapture() failed, list formats failed"); 
			bResult = PFalse;
		}
		else
		{
			if(!SUCCEEDED(GetDefaultFormat()))
			{
				PTRACE(capTraceLevel, "Exit\tBoneCapture::HandleCapture() failed, get default format failed"); 
				bResult = PFalse;
			}
			else
				bResult = PTrue;
		}
	}
	
	// If no result, close
    if( !bResult )
	{
		InternalShutdown();
		m_started.Signal();
		return ;
	}

	// Let Open() function know we are ready to roll
	m_started.Signal();

	// Wait on DirectShow commands
    while(( command != COMMAND_SHUTDOWN ) && ( hr != S_FALSE ))
    {
        dwReturnValue = WaitForMultipleObjects( 2, m_handle, FALSE, INFINITE );
        switch( dwReturnValue )
        {
            case WAIT_OBJECT_0:
                command = m_currentCommand;
                ProcessCommand();
                break;

            case WAIT_OBJECT_0 + 1:
                ProcessDShowEvent();
                break;

            default:
                break;
        }
    }

}

void BoneCapture::ProcessCommand()
{
	PTRACE(capTraceLevel, "Enter\tBoneCapture::ProcessCommand()"); 

    switch( m_currentCommand )
    {
         case COMMAND_STARTCAPTURE:
			m_hLastResult = InternalStart() ? NOERROR : E_FAIL;
            SetEvent( m_hCommandCompleted );
            break;

        case COMMAND_STOPCAPTURE:
            m_hLastResult = InternalStop() ? NOERROR : E_FAIL;
            SetEvent( m_hCommandCompleted );
            break;
        
        case COMMAND_PAUSECAPTURE:
            m_hLastResult = InternalPause() ? NOERROR : E_FAIL;
            SetEvent( m_hCommandCompleted );
            break;

        case COMMAND_RESUMECAPTURE:
            m_hLastResult = InternalResume() ? NOERROR : E_FAIL;
            SetEvent( m_hCommandCompleted );
            break;

        case COMMAND_SHUTDOWN:
            m_hLastResult = InternalShutdown() ? NOERROR : E_FAIL;
            SetEvent( m_hCommandCompleted );
            m_hLastResult = S_FALSE;
            break;

        default:
            break;
    }
}


HRESULT BoneCapture::ProcessDShowEvent()
{
    HRESULT hr = S_OK;
    long    lEventCode, lParam1, lParam2;

    if( m_pMediaEvent == NULL )
	{
        PTRACE(capTraceLevel, "BoneCap\tReceived process DShow event but mc is null!" );
        return E_FAIL;
	}

    m_pMediaEvent->GetEvent( &lEventCode, &lParam1, &lParam2, 0 );
	PTRACE(capTraceLevel, "Enter\tBoneCapture::ProcessDShowEvent(), Event: " << lEventCode); 

    if( lEventCode == EC_STREAM_CONTROL_STARTED )   
    {
        PTRACE(capTraceLevel, "BoneCap\tCapture started ..." );
	}
    else if( lEventCode == EC_STREAM_CONTROL_STOPPED )   // We have received a control stream stop event
    {
        PTRACE(capTraceLevel, "BoneCap\tCapture stopped ..." );
    }
    else if( lEventCode == EC_CAP_FILE_COMPLETED )
    {
        PTRACE(capTraceLevel, "BoneCap\tCapture completed ..." );
    }

    m_pMediaEvent->FreeEventParams( lEventCode, lParam1, lParam2 );

    return S_OK;
}

PBoolean BoneCapture::IsOpen()
{
	PTRACE(capTraceLevel, "BoneCap\tIsOpen()");
	return m_pCapture != NULL;
}

PBoolean BoneCapture::Close()
{
	if (!IsOpen() || (NULL == m_pGrabber))
		return PFalse;

    // Shut down
	Shutdown();
	
	if( m_handle[0] )
    {
        CloseHandle( m_handle[0] );
		m_handle[0] = NULL;
    }

    if( m_handle[1] )
    {
        CloseHandle( m_handle[1] );
		m_handle[1] = NULL;
    }

	m_hCommandCompleted = NULL;
	m_currentCommand = COMMAND_NOCOMMAND;

	if( m_thread )
	{
		m_thread->WaitForTermination(3000);
		delete m_thread;
		m_thread = NULL;
	}
	
	return PTrue;
}

PBoolean BoneCapture::InternalStart()
{
    HRESULT  hr = S_OK;
    unsigned int count;

	LONGLONG dwStart = 0, dwEnd = 0;
    WORD     wStartCookie = 1, wEndCookie = 2;

	PTRACE(capTraceLevel, "BoneCap\tInternalStart()");

	if (IsCapturing())
		return PTrue;

	// Tell grabber to buffer samples
	hr = m_pGrabber->SetBufferSamples(PTrue);
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tFailed to SetBufferSamples to true: " << ErrorMessage(hr));
		return hr;
	}

    // To start the video capture, call ICaptureGraphBuilder2::ControlStream. 
    dwStart = 0;
    dwEnd = MAXLONGLONG;
    
	hr = m_pCapture->ControlStream( &PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie );

	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tInternalStart() Couldn't control the graph: " << ErrorMessage(hr));
		return PFalse;
	}

 	// Start previewing video data
	hr = m_pMediaControl->Run();
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tCouldn't run the graph: " << ErrorMessage(hr));
		return PFalse;
	}

	// 
	// Even after a WaitForCompletion, the webcam is not available, so wait
	// until the server give us a frame
	//
	count = 0;
	while (count < 100)
	{
		long cbBuffer;
		hr = m_pGrabber->GetCurrentBuffer(&cbBuffer, NULL);
		if (hr == S_OK && cbBuffer > 0)
			break;
		else if (hr == VFW_E_WRONG_STATE)
		{
			// Not available 
			PThread::Current()->Sleep(100);
		}
		else
		{
			PTRACE(1, "BoneCap\tWhile waiting the webcam to be ready, we have got this error: " << ErrorMessage(hr));
			PThread::Current()->Sleep(10);
		}
		count++;
	}

	isCapturingNow = PTrue;

	return PTrue;
}

PBoolean BoneCapture::InternalStop()
{
    HRESULT   hr = S_OK;
    LONGLONG  dwStart = 0, dwEnd = 0;
    WORD      wStartCookie = 1, wEndCookie = 2;

	PTRACE(capTraceLevel, "BoneCap\tInternalStop()");

	if (IsCapturing())
		return PFalse;

	// Tell grabber to stop buffer samples
	hr = m_pGrabber->SetBufferSamples(PFalse);
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tFailed to SetBufferSamples to false: " << ErrorMessage(hr));
		return hr;
	}

    IMediaSeeking* pMediaSeeking;
    hr = m_pGraph->QueryInterface( &pMediaSeeking );
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tInternalStop() Couldn't get media seeking from the graph" << ErrorMessage(hr));
		return PFalse;
	}

    // Stop the capture of the graph
    dwStart = 0;

	hr = pMediaSeeking->GetCurrentPosition( &dwEnd );
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tInternalStop() Couldn't get current position from the graph" << ErrorMessage(hr));
		return PFalse;
	}

    hr = m_pCapture->ControlStream( &PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video, NULL, &dwStart, &dwEnd, wStartCookie, wEndCookie );
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tInternalStop() Couldn't control the stream: " << ErrorMessage(hr));
		return PFalse;
	}

	isCapturingNow = PFalse;

	return PTrue;
}

PBoolean BoneCapture::InternalShutdown()
{
	if (m_pMediaControl)
		m_pMediaControl->StopWhenReady();

	SAFE_RELEASE(m_pMediaControl);
	SAFE_RELEASE(m_pMediaEvent);
	SAFE_RELEASE(m_pSrcFilter)
	SAFE_RELEASE(m_pGrabber);
	SAFE_RELEASE(m_pCapture);

	SAFE_RELEASE(m_pGraph);

	return PTrue;
}

PBoolean BoneCapture::IsCapturing()
{
	return isCapturingNow;
}


/*
*
* Set the FrameRate, FrameSize, ...
*
*
*/
/*
* Change Colourspace AND FrameSize by looking if the resolution is supported by the hardware.
*
*/


PBoolean BoneCapture::SetFrameSize(unsigned width, unsigned height)
{
	PTRACE(capTraceLevel, "BoneCap\tSetFrameSize(" << width << ", " << height << ")");

#ifdef _WIN32_WCE
	frameRate = 5; // YK
#endif

	if (!SetFormat(colourFormat, width, height, frameRate))
		return PFalse;

	PTRACE(capTraceLevel, "BoneCap\tSetFrameSize " << width << "x" << height << " is supported in hardware");

	if (!PVideoDevice::SetFrameSize(width, height))
		return PFalse;

	frameBytes = CalculateFrameBytes(frameWidth, frameHeight, colourFormat);

	if (m_tempFrame)
		free(m_tempFrame);

	m_tempFrame = (BYTE*) malloc(frameBytes);

	if(m_tempFrame == NULL)
	{
		PTRACE(capTraceLevel, "BoneCap\tNot enought memory to allocate tempFrame ("<<frameBytes<<")");
		return PFalse;
	}

#ifdef _WIN32_WCE
	// Set device converter sizes
	m_rgb565convert.SetSrcFrameSize(frameWidth, frameHeight);
#endif

	PTRACE(capTraceLevel, "BoneCap\tset frame size " << width << "x" << height << "  frameBytes="<<frameBytes);
	return PTrue;
}

PBoolean BoneCapture::SetFrameRate(unsigned rate)
{
	PTRACE(capTraceLevel, "BoneCap\tSetFrameRate("<<rate<<"fps)");

	if (rate < 1)
		rate = 1;
	else if (rate > 50)
		rate = 50;

	if (!SetFormat(colourFormat, frameWidth, frameHeight, rate))
		return PFalse;

	return PVideoDevice::SetFrameRate(rate);
}




PBoolean BoneCapture::GetDeviceCapabilities(const PString & /*deviceName*/, Capabilities * /*caps*/)  
{ 
	// To do!
	return FALSE; 
}

/*
*
*
*/
HRESULT BoneCapture::ListSupportedFormats()
{
	HRESULT hr = S_OK;
	IAMStreamConfig *pStreamConfig;
	AM_MEDIA_TYPE *pMediaFormat;
	int iCount, iSize;
	VIDEO_STREAM_CONFIG_CAPS scc;
	int i;

	PTRACE(capTraceLevel, "BoneCap\tListSupportedFormats()");

	hr = m_pCapture->FindInterface(&PIN_CATEGORY_CAPTURE, &MEDIATYPE_Video,
		m_pSrcFilter, IID_IAMStreamConfig, (void **)&pStreamConfig);
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tFailed to find StreamConfig Video interface: " << ErrorMessage(hr));
		return hr;
	}

	hr = pStreamConfig->GetNumberOfCapabilities(&iCount, &iSize);
	if (FAILED(hr))
	{
		PTRACE(capTraceLevel, "BoneCap\tFailed to GetNumberOfCapabilities: " << ErrorMessage(hr));
		pStreamConfig->Release();
		return hr;
	}

	/* Sanity check: just to be sure that the Streamcaps is a VIDEOSTREAM and not AUDIOSTREAM */
	if (sizeof(scc) != iSize)
	{
		PTRACE(capTraceLevel, "BoneCap\tBad Capapabilities (not a  VIDEO_STREAM_CONFIG_CAPS)");
		pStreamConfig->Release();
		return hr;
	}

	for (i=0; i<iCount; i++)
	{
		pMediaFormat = NULL;
		hr = pStreamConfig->GetStreamCaps(i, &pMediaFormat, (BYTE *)&scc);
		if (FAILED(hr))
		{
			PTRACE(capTraceLevel, "BoneCap\tFailed to GetStreamCaps(" << i <<"): " << ErrorMessage(hr));
			continue;
		}

#if PTRACING
		if ((pMediaFormat->formattype == FORMAT_VideoInfo)     &&
			(pMediaFormat->cbFormat >= sizeof(VIDEOINFOHEADER)) &&
			(pMediaFormat->pbFormat != NULL))
		{
			VIDEOINFOHEADER *VideoInfo = (VIDEOINFOHEADER *)pMediaFormat->pbFormat;
			BITMAPINFOHEADER *BitmapInfo = &(VideoInfo->bmiHeader);

			PTRACE(capTraceLevel, "BoneCap\tFmt["<< i << "] = ("
				<< media_format_to_pwlib_format(pMediaFormat->subtype) << ", "
				<< BitmapInfo->biWidth << "x" << BitmapInfo->biHeight << ", "
				<< (10000000.0/VideoInfo->AvgTimePerFrame) << "fps)");
		}
#endif

		MyDeleteMediaType(pMediaFormat);
	}

	pStreamConfig->Release();

	return hr;
}

/*
*
*
*/

PBoolean BoneCapture::GetFrameData(BYTE * buffer, PINDEX * bytesReturned)
{
	m_pacing.Delay(1000/GetFrameRate());
	return GetFrameDataNoDelay(buffer, bytesReturned);
}

PBoolean BoneCapture::GetFrameDataNoDelay(BYTE *destFrame, PINDEX * bytesReturned)
{
	HRESULT hr;
	PBoolean bResult = true;

	long cbBuffer = frameBytes;
	
	if (converter != NULL)
	{
		if (m_tempFrame == NULL)
			return PFalse;

		hr = m_pGrabber->GetCurrentBuffer(&cbBuffer, NULL);
		if (FAILED(hr))
		{
			PTRACE(capTraceLevel, "BoneCap\tFailed to get the current buffer size: " << ErrorMessage(hr));
			bResult = PFalse;
		}
		else
		{
			if( frameBytes < cbBuffer )
			{
				PTRACE(capTraceLevel, "BoneCap\tBuffer too short (needed "<< cbBuffer << "  got " << frameBytes);
				bResult = PFalse;
			}
			else
			{
#ifdef _WIN32_WCE
				m_rgb565convert.Convert(m_sampleFrame, m_tempFrame, (PINDEX*) &cbBuffer);
#else
				hr = m_pGrabber->GetCurrentBuffer(&cbBuffer, (long*) m_tempFrame);
#endif
				if (FAILED(hr))
				{
					PTRACE(capTraceLevel, "BoneCap\tFailed to get the current buffer: " << ErrorMessage(hr));
					bResult = PFalse;
				}
				else
				{
					converter->Convert(m_tempFrame, destFrame, cbBuffer, bytesReturned);
					bResult = PTrue;
				}
			}
		}
	}
	else
	{
		hr = m_pGrabber->GetCurrentBuffer(&cbBuffer, (long*)destFrame);
		if (FAILED(hr))
		{
			PTRACE(capTraceLevel, "BoneCap\tFailed to get the current buffer: " << ErrorMessage(hr));
			bResult = PFalse;
		}
		else
		{
			*bytesReturned = cbBuffer;
			bResult = PTrue;
		}
	}

	return bResult;
}

PINDEX BoneCapture::GetMaxFrameBytes()
{
	//   PTRACE(capTraceLevel, "BoneCap\tGetMaxFrameBytes() return " << GetMaxFrameBytesConverted(frameBytes));
	return GetMaxFrameBytesConverted(frameBytes);
}

#endif
