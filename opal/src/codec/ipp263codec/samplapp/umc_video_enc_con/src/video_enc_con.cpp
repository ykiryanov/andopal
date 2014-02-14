//
//               INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright (c) 2005-2007 Intel Corporation. All Rights Reserved.
//

#include "utils.h"
#include "vm_time.h"
#include "vm_strings.h"
#include "umc_sys_info.h"
#include "vm_sys_info.h"

//#define ALPHA_BLENDING_H264

using namespace UMC;

#define MAX_FILELEN 1024

class VideoEncodingTest : public VideoEncodingSample
{
public:
  virtual Status PutOutputData(MediaData *out);

  virtual Ipp32s Main(Ipp32s argc, vm_char *argv[]);

  virtual Ipp64f GetTick();

  Status ChangeParams();
  void DumpPerf0();
  void DumpPerf1();

  VideoEncodingTest()
  {
    mVideoStreamType = UNDEF_VIDEO;
    mWidth = 0;
    mHeight = 0;
    maxNumFrames = 0;
    BitRate = -1; // (BitRate < 0) means constant quality!
    FrameRate = 0;
    chroma_format = 1; // 4:2:0
    SrcFileName[0] = 0;
    ParFileName = NULL;
    DstFileName = NULL;
    PerfFileName = NULL;
    refEncodedFile = NULL;
    inpLogFile = NULL;
    outLogFile = NULL;
    resLogFile = NULL;
    perf_file = NULL;
    numThreads = 1;
    AlphaFileName = NULL;
    ReconFileName = NULL;

    fullTime = 0;
    tickDuration = 1.0/(Ipp64f)vm_time_get_frequency();
    *codecName = 0;
    FrameSize = NULL;
    lastFrameNum = 0;
    lastPTS = -1.0;
  }
  ~VideoEncodingTest();

  // Params
  VideoStreamType mVideoStreamType;
  Ipp32s  mWidth;
  Ipp32s  mHeight;
  Ipp32s  maxNumFrames;
  Ipp32s  BitRate;
  Ipp64f  FrameRate;
  Ipp32s  chroma_format;
  vm_char SrcFileName[MAX_FILELEN];
  vm_char *ParFileName;
  vm_char *DstFileName;
  vm_char *AlphaFileName;
  vm_char *ReconFileName; // Name of a file to save reconstructed frame
  vm_char *PerfFileName;
  vm_char *refEncodedFile;
  vm_char *inpLogFile;
  vm_char *outLogFile;
  vm_char *resLogFile;
  FILE    *perf_file;
  Ipp32s  numThreads;

  // Info
  SysInfo m_csysinfo;
  Ipp64f fullTime;
  Ipp64f tickDuration;
  vm_char codecName[15];
  Ipp32s *FrameSize;
  Ipp32s lastFrameNum;
  Ipp64f lastPTS;
};

Ipp64f VideoEncodingTest::GetTick()
{
  return (Ipp64f)vm_time_get_tick() * tickDuration;
}

VideoEncodingTest::~VideoEncodingTest()
{
  if (pCodec) {
    delete pCodec;
    pCodec = NULL;
  }
  if (pEncoderParams) {
    delete pEncoderParams;
    pEncoderParams = NULL;
  }
  if (FrameSize) {
    delete [] FrameSize;
    FrameSize = NULL;
  }
  if (dstFile) {
    fclose(dstFile);
    dstFile = NULL;
  }
}

Status VideoEncodingTest::PutOutputData(MediaData *out)
{
  if (!out) { // at EOF
    return UMC_ERR_NULL_PTR;
  }
  Ipp32s len = (Ipp32s)out->GetDataSize();

#if 1
  Ipp64f PTS = out->GetTime();
  if (!FrameSize && numFramesToEncode < (1 << 16)) {
    FrameSize = new Ipp32s[numFramesToEncode];
  }
  if (FrameSize && len && lastFrameNum < numFramesToEncode) {
    if (lastFrameNum == 0 || PTS > lastPTS) {
      FrameSize[lastFrameNum] = len;
      lastPTS = PTS;
    } else {
      FrameSize[lastFrameNum] = FrameSize[lastFrameNum-1];
      FrameSize[lastFrameNum-1] = len;
    }
    lastFrameNum++;
  }
#endif

  m_csysinfo.GetCpuUsage();

  if (!(mFramesEncoded % 10)) {
    vm_string_printf(VM_STRING("%d."), mFramesEncoded);
  }

#ifdef CHANGE_PARAMS
  ChangeParams();
#endif

  return VideoEncodingSample::PutOutputData(out);
}

Status VideoEncodingTest::ChangeParams() // check set bitrate/set frame rate
{
  Status st;
  VideoEncoderParams newpar;
  st = pCodec->GetInfo(&newpar);
  vm_string_printf(VM_STRING("Q=%d%% "), newpar.qualityMeasure);
  if(st != UMC_OK)
    return st;
  if(mFramesEncoded%9==1) {
    //newpar.info.framerate *= 0.9; // random
    newpar.info.bitrate = newpar.info.bitrate * 3 / 4; // random
    if(newpar.qualityMeasure<40)
      newpar.info.bitrate *= 5;   // random

    vm_string_printf(VM_STRING("SetParams Called for bitrate = %d\n"),newpar.info.bitrate);
    st = pCodec->SetParams(&newpar);
    //if(st != UMC_OK) // not supported everywhere
    //  return st;
  }
  if(mFramesEncoded%3==1) {
    newpar.numThreads = (newpar.numThreads & 3) + 1;
    vm_string_printf(VM_STRING("SetParams Called for threads = %d\n"),newpar.numThreads);
    st = pCodec->SetParams(&newpar);
  }

  if (mFramesEncoded%25==1) {
    pCodec->Reset();
  }
  { // close caption
    MediaData cc;
    vm_char text[30];
    vm_string_sprintf(text, VM_STRING("CCaption %d"), mFramesEncoded);
    cc.SetBufferPointer((Ipp8u*)text, sizeof(text));
    cc.SetDataSize(vm_string_strlen(text)+1);
    pCodec->GetFrame(&cc, 0);
  }
  return UMC_OK;
}

int PrintHelp(vm_char *prog_name, vm_char *err_message)
{
  vm_string_printf(VM_STRING("Error: %s\n"), err_message);
  vm_string_printf(VM_STRING("Usage1: %s [m2|m4|h264|h263|h261|dv_sd|dv_50|dv_hd] [Options] InputParFile OutputEncodedFile\n"), prog_name);
  vm_string_printf(VM_STRING("Usage2: %s [m2|m4|h264|h263|h261|dv_sd|dv_50|dv_hd] [Options] -i InputYUVFile -o OutputEncodedFile\n"), prog_name);
  vm_string_printf(VM_STRING("Options: \n"));
#if defined ALPHA_BLENDING_H264
  vm_string_printf(VM_STRING("   [-a file] - file for auxiliary pictures for alpha blending for H.264 encoder\n"));
#endif // ALPHA_BLENDING_H264
#if defined UMC_ENABLE_H264_VIDEO_ENCODER && defined SAVE_RECON
  vm_string_printf(VM_STRING("   [-s file] - file for reconstructed frames (H.264 only!!!).\n"));
#endif // UMC_ENABLE_H264_VIDEO_ENCODER && SAVE_RECON
  vm_string_printf(VM_STRING("   [-i inputFile] - input YUV video file\n"));
  vm_string_printf(VM_STRING("   [-w width]     - video width\n"));
  vm_string_printf(VM_STRING("   [-h height]    - video height\n"));
  vm_string_printf(VM_STRING("   [-f frameRate] - video frame rate (frames per second)\n"));
  vm_string_printf(VM_STRING("   [-b bitRate]   - encoded bit rate (bits per second)\n"));
  vm_string_printf(VM_STRING("   [-n numFrames] - max frames to encode\n"));
  vm_string_printf(VM_STRING("   [-t num]       - number of threads for encoding\n"));
  vm_string_printf(VM_STRING("   [-r]           - enables threading of read/encode/write\n"));
  vm_string_printf(VM_STRING("   [-y dir]       - directory of YUV files\n"));
  vm_string_printf(VM_STRING("   [-u file]      - file for dumping perfomance info\n"));
  vm_string_printf(VM_STRING("   [-p file.csv]  - file for dumping perfomance info into csv format\n"));
  vm_string_printf(VM_STRING("Note: Options -i,-w,-h,-f,-b,-n override corresponding values inside InputParFile.\n"));
  vm_string_printf(VM_STRING("      If InputParFile not specified, at least options -w,-h should be specified and -o should be added before OutputEncodedFile.\n"));
  vm_string_printf(VM_STRING("\n"));
  return 1;
}

static int read_line(vm_char *file_name, int line_num, vm_char *line, int /*max_len*/)
{
  FILE *f;
  int i;
  if (NULL == (f = vm_file_open(file_name, VM_STRING("rt")))) {
    vm_string_fprintf(stderr, __VM_STRING("Couldn't open file %s\n"), file_name);
    return 1;
  }
  for (i = 0; i < line_num; i++) {
    if (NULL == vm_file_gets(line, MAX_FILELEN-1, f)) {
      fclose(f);
      return 1;
    }
  }
  fclose(f);
  return 0;
}

#define GET_OPTION_POINTER(PTR)          \
  if (2 == vm_string_strlen(argv[i])) {  \
    i++;                                 \
    if (argv[i][0]=='-') {               \
      return PrintHelp(argv[0], VM_STRING("in options")); \
    } else {                             \
      PTR = argv[i];                     \
    }                                    \
  } else {                               \
    PTR = argv[i] + 2;                   \
  }

#define DVEncoderParams VideoEncoderParams
#define DV50EncoderParams VideoEncoderParams
#define DV100EncoderParams VideoEncoderParams

#define CREATE_ENCODER(CODEC)                      \
  vm_string_strcpy(codecName, VM_STRING(#CODEC));  \
  pCodec = new CODEC##VideoEncoder();              \
  if (ParFileName) {                               \
    pEncoderParams = new CODEC##EncoderParams;     \
  }

Ipp32s VideoEncodingTest::Main(Ipp32s argc, vm_char *argv[])
{
  vm_char *pVal;
  vm_char *optFile = NULL;
  Ipp64f  t_start;
  Ipp32s i, j;
  Ipp64f size_ratio = 0;
  vm_char line[MAX_FILELEN] = {0};

  t_start = GetTick();

  if (ippStaticInit() < ippStsNoErr) {
    vm_string_fprintf(stderr, VM_STRING("Error: Can't initialize ipp libs!\n"));
    return 5;
  }

  for (j = 0; j < 2; j++) {
    vm_char optLine[256], *p, *p_end;
    vm_char *argv_[256];
    if (j) {
      if (!optFile) {
        break;
      } else {
        FILE *f = vm_file_open(optFile, VM_STRING("r"));
        if (!f) {
          vm_string_fprintf(stderr, VM_STRING("Cann't open opt file %s\n"), optFile);
          return PrintHelp(argv[0], VM_STRING("Cann't open opt file"));
        }
        *optLine = 0;
        vm_file_gets(optLine, 255, f);
        fclose(f);
        p = optLine;
        p_end = optLine + vm_string_strlen(optLine);
        argc = 1;
        argv = argv_;
        argv_[0] = argv[0];
        for (;;) {
          argv[argc] = p;
          argc++;
          while ((p < p_end) && (*p != ' ')) p++;
          *p++ = 0;
          while ((p < p_end) && (*p == ' ')) p++;
          if (p >= p_end) break;
        }
      }
    }
/*
    for (i = 1; i < argc; i++) {
      printf("Option '%s'\n", argv[i]);
    }
*/
    for (i = 1; i < argc; i++)
    {
      if ('-' != argv[i][0]) {
        if (UMC_OK == GetVideoType(argv[i], &mVideoStreamType)) continue;
        if (NULL == ParFileName) {
          ParFileName = argv[i];
        } else {
          DstFileName = argv[i];
        }
        continue;
      }
      if (UMC_OK == GetVideoType(argv[i] + 1, &mVideoStreamType)) continue;
      if (UMC_OK == GetFormatType(argv[i] + 1, &mSrcFileColorFormat)) continue;
      switch (argv[i][1])
      {
        case 'y':
          i++;
          vm_string_strcpy(SrcFileName, argv[i]);
          p = SrcFileName + vm_string_strlen(SrcFileName) - 1;
          if (*p != '\\' && *p != '/') {
            vm_string_strcat(SrcFileName, VM_STRING("\\"));
          }
          break;
        case 'p':
        case 'P':
          GET_OPTION_POINTER(PerfFileName);
          break;
        case 'w':
          GET_OPTION_POINTER(pVal);
          mWidth = (Ipp32s)vm_string_atol(pVal);
          break;
        case 'h':
          GET_OPTION_POINTER(pVal);
          mHeight = (Ipp32s)vm_string_atol(pVal);
          break;
        case 'f':
          GET_OPTION_POINTER(pVal);
          vm_string_sscanf(pVal, VM_STRING("%lf"), &FrameRate);
          break;
        case 'b':
          GET_OPTION_POINTER(pVal);
          BitRate = (Ipp32s)vm_string_atol(pVal);
          break;
        case 'n':
          GET_OPTION_POINTER(pVal);
          maxNumFrames = (Ipp32s)vm_string_atol(pVal);
          break;
        case 'i':
          GET_OPTION_POINTER(pVal);
          vm_string_strcpy(SrcFileName, pVal);
          break;
        case 'o':
          GET_OPTION_POINTER(pVal);
          DstFileName = pVal;
          break;
        case 't':
          GET_OPTION_POINTER(pVal);
          numThreads = (Ipp32s)vm_string_atol(pVal);
          break;
#if defined ALPHA_BLENDING_H264
        case 'a':
          GET_OPTION_POINTER(AlphaFileName);
          break;
#endif // ALPHA_BLENDING_H264
        case 's':
          GET_OPTION_POINTER(ReconFileName);
          break;
        case 'u':
          i++;
          perf_file = vm_file_open(argv[i], VM_STRING("w"));
          break;
        case 'z':
          i++;
          optFile = argv[i];
          break;
        /////////////////
        case 'c':
          i++;
          refEncodedFile = argv[i];
          break;
        case 'l':
          i++;
          inpLogFile = argv[i];
          break;
        case 'v':
          i++;
          outLogFile = argv[i];
          break;
        case 'g':
          i++;
          resLogFile = argv[i];
          break;
        /////////////////
        //case 'h':
        case '?':
        default:
          return PrintHelp(argv[0], VM_STRING("Unknown options"));
      }
    }
  }

  if (!DstFileName) {
    return PrintHelp(argv[0], VM_STRING("Destination file name not found"));
  }

  if (!ParFileName && (!mWidth || !mHeight)) {
    return PrintHelp(argv[0], VM_STRING("at least ParFile or options -w,-h should be specified"));
  }

  if (ParFileName) { // read first line of ParFile
    if (read_line(ParFileName, 1, line, MAX_FILELEN)) {
      return 3;
    }
  }

  if (mVideoStreamType == UNDEF_VIDEO) {
    if (!ParFileName) {
      mVideoStreamType = MPEG2_VIDEO;
    } else {
      if (vm_string_strstr(line, VM_STRING("MPEG-2"))) mVideoStreamType = MPEG2_VIDEO; else
      if (vm_string_strstr(line, VM_STRING("MPEG-4"))) mVideoStreamType = MPEG4_VIDEO; else
      if (vm_string_strstr(line, VM_STRING("H.261")))  mVideoStreamType = H261_VIDEO; else
      if (vm_string_strstr(line, VM_STRING("H.263")))  mVideoStreamType = H263_VIDEO; else
      if (vm_string_strstr(line, VM_STRING("H.264")))  mVideoStreamType = H264_VIDEO; else {
        return PrintHelp(argv[0], VM_STRING("Unknown codec"));
      }
    }
  }

  if (ParFileName && vm_string_strstr(line, VM_STRING("UseDefaultParameters"))) {
    ParFileName = NULL; // use default parameters
  }

  switch (mVideoStreamType) {
#ifdef UMC_ENABLE_MPEG2_VIDEO_ENCODER
    case MPEG2_VIDEO:
      CREATE_ENCODER(MPEG2)
      break;
#endif
#ifdef UMC_ENABLE_MPEG4_VIDEO_ENCODER
    case MPEG4_VIDEO:
      CREATE_ENCODER(MPEG4)
      break;
#endif
#ifdef UMC_ENABLE_H261_VIDEO_ENCODER
    case H261_VIDEO:
      CREATE_ENCODER(H261)
      break;
#endif
#ifdef UMC_ENABLE_H263_VIDEO_ENCODER
    case H263_VIDEO:
      CREATE_ENCODER(H263)
      break;
#endif
#ifdef UMC_ENABLE_H264_VIDEO_ENCODER
    case H264_VIDEO:
      CREATE_ENCODER(H264)
      break;
#endif
#ifdef UMC_ENABLE_DV_VIDEO_ENCODER
    case DIGITAL_VIDEO_SD:
      CREATE_ENCODER(DV)
      break;
#endif
#ifdef UMC_ENABLE_DV50_VIDEO_ENCODER
    case DIGITAL_VIDEO_50:
      CREATE_ENCODER(DV50)
      break;
#endif
#ifdef UMC_ENABLE_DVHD_VIDEO_ENCODER
    case DIGITAL_VIDEO_HD:
      CREATE_ENCODER(DV100)
      break;
#endif
    default:
      vm_string_fprintf(stderr, VM_STRING("Codec (%d) not supported\n"), (int)mVideoStreamType);
      return PrintHelp(argv[0], VM_STRING("Codec not supported"));
  }

  if (ParFileName) {
    Status res;
    res = pEncoderParams->ReadParamFile(ParFileName);
    if (res < UMC_OK) { // < means error
      if (res == UMC_ERR_OPEN_FAILED) {
        vm_string_fprintf(stderr, VM_STRING("Error: Can't open par file %s\n"), ParFileName);
      } else {
        vm_string_fprintf(stderr, VM_STRING("Error: Can't parse par file %s\n"), ParFileName);
      }
      return 3;
    }
#ifdef UMC_ENABLE_MPEG2_VIDEO_ENCODER
    if (mVideoStreamType == MPEG2_VIDEO) {
      //chroma_format = ((MPEG2EncoderParams*)pEncoderParams)->chroma_format;
      mColorFormat = pEncoderParams->info.color_format;
    }
#endif
#ifdef UMC_ENABLE_H264_VIDEO_ENCODER
    if (mVideoStreamType == H264_VIDEO) {
      H264EncoderParams *params = (H264EncoderParams*)pEncoderParams;
      chroma_format = params->chroma_format_idc;
      mBitDepth = (IPP_MAX(params->bit_depth_luma, params->bit_depth_chroma) > 8)? 16 : 8;
      mBitDepthAlpha = (params->bit_depth_aux > 8)? 16: 8;
      numFramesToEncode = params->numFramesToEncode;
#if 0
      if (ReconFileName) {
        ((H264EncoderParams*)pEncoderParams)->m_SaveReconFlag = 1;
        vm_string_strncpy(((H264EncoderParams*)pEncoderParams)->m_ReconFileName, ReconFileName, MAXIMUM_PATH);
        printf("ReconFileName = \"%s\"\n", ((H264EncoderParams*)pEncoderParams)->m_ReconFileName);
      }
#endif
      mColorFormat = (chroma_format == 0)? GRAY
                  : (chroma_format == 2)? YUV422
                  : (chroma_format == 3)? YUV444
                  :  YUV420; // Accept monochromes with UV components filled with dummy values.
    }
#endif
  }

  if ((!SrcFileName[0] || SrcFileName[vm_string_strlen(SrcFileName) - 1] == '\\') && ParFileName) {
    // read stream filename from second line of ParFile
    vm_char SrcName[MAX_FILELEN];

    if (read_line(ParFileName, 2, line, MAX_FILELEN)) {
      return 3;
    }
    vm_string_sscanf(line, VM_STRING("%s"), SrcName);
    vm_string_strcat(SrcFileName, SrcName); // concatenate
  }

  if (!ParFileName) {
    pEncoderParams = new VideoEncoderParams;
    if (!maxNumFrames) {
      maxNumFrames = 0x7fffffff;
    }
    if (!FrameRate) {
      FrameRate = 30;
    }
    if (BitRate < 0) {
      BitRate = 5000000;
    }
  }

  // override param's if non-zero
  if (mWidth && mHeight) {
    pEncoderParams->info.clip_info.width = mWidth;
    pEncoderParams->info.clip_info.height = mHeight;
  } else {
    mWidth = pEncoderParams->info.clip_info.width;
    mHeight = pEncoderParams->info.clip_info.height;
  }
  if (maxNumFrames) {
    numFramesToEncode = maxNumFrames;
  } else {
    maxNumFrames = numFramesToEncode;
  }
  if (FrameRate) {
    pEncoderParams->info.framerate = FrameRate;
  } else {
    FrameRate = pEncoderParams->info.framerate;
  }
  if (BitRate >= 0) {
    pEncoderParams->info.bitrate = BitRate;
  } else {
    BitRate = pEncoderParams->info.bitrate;
  }
  pEncoderParams->numThreads = numThreads;

  srcFile = vm_file_open(SrcFileName, VM_STRING("rb"));
  if (NULL == srcFile) {
    vm_string_fprintf(stderr, VM_STRING("Error opening file %s"), SrcFileName);
    return 8;
  }

  dstFile = vm_file_open(DstFileName, VM_STRING("wb"));
  if (NULL == dstFile) {
    vm_string_fprintf(stderr, VM_STRING("Error: Can't open output file '%s'\n"), DstFileName);
    return 9;
  }

  if (AlphaFileName) {
    srcAlphaFile = vm_file_open(AlphaFileName, VM_STRING("rb"));
    if (NULL == srcAlphaFile) {
      vm_string_fprintf(stderr, VM_STRING("Error opening file %s"), AlphaFileName);
      return 8;
    }
    if (mColorFormat == YUV420) mColorFormat = YUV420A; else
    if (mColorFormat == YUV422) mColorFormat = YUV422A; else
    if (mColorFormat == YUV444) mColorFormat = YUV444A;
  }

  if (pCodec->Init(pEncoderParams) != UMC_OK) {
    vm_string_fprintf(stderr, VM_STRING("Error: Video encoder initialization failed\n"));
    return 6;
  }

  if (pCodec->GetInfo(pEncoderParams) != UMC_OK) {
    vm_string_fprintf(stderr, VM_STRING("Error: Video encoder GetInfo failed\n"));
    return 7;
  }

  vm_string_printf(VM_STRING("\n"));
  vm_string_printf(VM_STRING("Starting %s encoding %s to file %s\n"), codecName, SrcFileName, DstFileName);
  vm_string_printf(VM_STRING("Source video width = %d, height = %d, frameRate = %.2lf\n"),
         mWidth, mHeight, FrameRate);
  vm_string_printf(VM_STRING("Max frames to encode = %d\n"), maxNumFrames);
  if (pEncoderParams->info.bitrate > 0)
    vm_string_printf(VM_STRING("Encoding bit rate = %d bits per second\n"), pEncoderParams->info.bitrate);
  else
    vm_string_printf(VM_STRING("Encoding without rate control\n"));

  m_csysinfo.GetCpuUsage();
  DumpPerf0();

  Run();

  fullTime = GetTick() - t_start;

  m_csysinfo.GetCpuUsage();
  DumpPerf1();

  vm_string_printf(VM_STRING("\nSummary:\n"));
  vm_string_printf(VM_STRING("    Num frames encoded = %d\n"), mFramesEncoded);
  vm_string_printf(VM_STRING("    Encoding Time = %.2f sec, %.2f fps\n"), encodingTime, mFramesEncoded/encodingTime);
  vm_string_printf(VM_STRING("    Overall  Time = %.2f sec, %.2f fps\n"), fullTime,  mFramesEncoded/fullTime);
  vm_string_printf(VM_STRING("    Average CPU usage = %.2lf%%\n"), m_csysinfo.GetAvgCpuUsage());
  vm_string_printf(VM_STRING("    Encoded Size = %d bytes\n"), encodedSize);
  vm_string_printf(VM_STRING("    Compression Ratio = %.2f\n"), ((Ipp64f)mFramesEncoded*mFrameSize)/encodedSize);

  if (pEncoderParams->info.framerate > 0 && pEncoderParams->info.bitrate > 0) {
    size_ratio = encodedSize/(((Ipp64f)mFramesEncoded/pEncoderParams->info.framerate)*(pEncoderParams->info.bitrate/8));
    vm_string_printf(VM_STRING("    EncodedSize/ExpectedSize = %.2f\n"), size_ratio);
  }

  if (perf_file != NULL) {
    vm_string_fprintf(perf_file, VM_STRING("Performance = %.2f fps"), mFramesEncoded/encodingTime);
    vm_string_fprintf(perf_file, VM_STRING(", EncodedSize/ExpectedSize = %.2f\n"), size_ratio);
    vm_string_fprintf(perf_file, VM_STRING("num = %d"), mFramesEncoded);
    vm_string_fprintf(perf_file, VM_STRING("performance = %.5f"), mFramesEncoded/encodingTime);
    vm_string_fprintf(perf_file, VM_STRING("perf_overall = %.5f"), fullTime);
    vm_string_fprintf(perf_file, VM_STRING("size_ratio = %.5f"), ((Ipp64f)mFramesEncoded*mFrameSize)/encodedSize);
    fclose(perf_file);
  }

  if (dstFile) {
    fclose(dstFile);
    dstFile = NULL;
  }

  if (srcFile) {
    fclose(srcFile);
    srcFile = NULL;
  }

  return 0;
}

void VideoEncodingTest::DumpPerf0()
{
  sSystemInfo* m_ssysteminfo = (sSystemInfo *)m_csysinfo.GetSysInfo();
  vm_char* stream_name = NULL;
  FILE *perf_file_csv = NULL;
  vm_char tmpbuf[128]={0,};

  if(PerfFileName)
    perf_file_csv = vm_file_open(PerfFileName, VM_STRING("w"));

  if(perf_file_csv){
     stream_name = vm_string_strrchr(SrcFileName, (Ipp32s)('\\'));
     if(!stream_name)stream_name = SrcFileName;
     else stream_name++;
     fseek( perf_file_csv, 0, SEEK_END);
     if(!ftell( perf_file_csv))
        vm_string_fprintf(perf_file_csv, VM_STRING("Date,Time,Comp.name,OS,CPU,Num.CPU,CPU freq.,MEM,VGA,App,App description,Ver.,Streams(S) name,Status,S.Type,S.Res.,S.FR,S.BR,Video(V)Type,V.Format,V.Num,V.D/E(FpS),V.D/E(MHz),Compr.(%%),CPU Usage (%%),Max Cpu Usage (%%),Work.Time\n"));
     vm_sys_info_get_date(tmpbuf,MMDDYY);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), tmpbuf);
     vm_sys_info_get_time(tmpbuf,HHMMSS);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), tmpbuf);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), m_ssysteminfo->computer_name);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), m_ssysteminfo->os_name);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), m_ssysteminfo->proc_name);
     vm_string_fprintf(perf_file_csv,VM_STRING("%d,"), m_ssysteminfo->num_proc);
     vm_string_fprintf(perf_file_csv,VM_STRING("%.2f,"), (Ipp64f)m_ssysteminfo->cpu_freq);
     vm_string_fprintf(perf_file_csv,VM_STRING("%d,"), m_ssysteminfo->phys_mem);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), m_ssysteminfo->video_card);
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"),m_ssysteminfo->program_name);
     vm_string_fprintf(perf_file_csv,VM_STRING("UMC Video Encoder Con.,"));//,m_ssysteminfo->description);
     vm_string_fprintf(perf_file_csv,VM_STRING(","));        // ver. of aplications
     vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), stream_name);
     vm_string_fprintf(perf_file_csv,VM_STRING("FAIL\n"));
     fclose(perf_file_csv);
  }
}

void VideoEncodingTest::DumpPerf1()
{
  sSystemInfo* m_ssysteminfo = (sSystemInfo *)m_csysinfo.GetSysInfo();
  FILE *perf_file_csv = NULL;
  int i;

  if(PerfFileName)
    perf_file_csv = vm_file_open(PerfFileName, VM_STRING("r+"));

  if(perf_file_csv) {
    fseek( perf_file_csv, -6, SEEK_END);
    vm_string_fprintf(perf_file_csv,VM_STRING("PASSED,"));
    vm_string_fprintf(perf_file_csv,VM_STRING("PV,"));
    vm_string_fprintf(perf_file_csv,VM_STRING("%dx%d,"),pEncoderParams->info.clip_info.width,pEncoderParams->info.clip_info.height);
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"),pEncoderParams->info.framerate);
    vm_string_fprintf(perf_file_csv,VM_STRING("%d,"),pEncoderParams->info.bitrate/1000);
    vm_string_fprintf(perf_file_csv,VM_STRING("%s,"), codecName);
    vm_string_fprintf(perf_file_csv,VM_STRING(","));
    vm_string_fprintf(perf_file_csv,VM_STRING("%d,"), mFramesEncoded);
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"), mFramesEncoded/encodingTime);
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"), (Ipp64f)(pEncoderParams->info.framerate/(mFramesEncoded/encodingTime)*(m_ssysteminfo->cpu_freq)));
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"), ((Ipp64f)encodedSize*100.0/(mFramesEncoded*mFrameSize)));
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"), m_csysinfo.GetAvgCpuUsage());
    vm_string_fprintf(perf_file_csv,VM_STRING("%.2lf,"), m_csysinfo.GetMaxCpuUsage());
    vm_string_fprintf(perf_file_csv,VM_STRING("%02d:%02d:%02d.%02d,"),(Ipp32s)fullTime/3600,(Ipp32s)(fullTime)%3600/60,(Ipp32s)fullTime%3600%60,(Ipp32s)((fullTime-(Ipp32s)fullTime)*100));
    vm_string_fprintf(perf_file_csv,VM_STRING("\n" ));
    if (FrameSize) {
      vm_string_fprintf(perf_file_csv,VM_STRING("Frame Info\nNum, Size\n"));
      for (i = 0; i < mFramesEncoded; i ++)
        vm_string_fprintf(perf_file_csv,VM_STRING("%d, %d\n"), i, FrameSize[i]);
    }
    fclose(perf_file_csv);
  }
}

#ifndef NO_MAIN

int main(Ipp32s argc, vm_char *argv[])
{
  VideoEncodingTest Encode;
  return Encode.Main(argc, argv);
}

#endif
