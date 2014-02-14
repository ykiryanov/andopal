//
//               INTEL CORPORATION PROPRIETARY INFORMATION
//  This software is supplied under the terms of a license agreement or
//  nondisclosure agreement with Intel Corporation and may not be copied
//  or disclosed except in accordance with the terms of that agreement.
//        Copyright (c) 2005-2007 Intel Corporation. All Rights Reserved.
//

#include "vm_time.h"
#include "vm_sys_info.h"
#include "ippcore.h"

#define VM_MALLOC_GLOBAL
#include "umc_malloc.h"

#include "umc_video_decoder.h"
#include "umc_video_data.h"
#include "umc_video_processing.h"
#include "umc_data_pointers_copy.h"

#include "umc_h264_dec.h"
#include "umc_h264_spl.h"

#include <memory>

using namespace UMC;
using namespace std;

#define GET_TICKS vm_time_get_tick();
#define GET_FREQUENCY  vm_time_get_frequency();

void PrintHelp(vm_char *prog_name)
{
    vm_string_printf(VM_STRING("Usage: %s [Options] InputFile [OutputYUVFile]\n\n"), prog_name);
    vm_string_printf(VM_STRING("Options: \n"));
    vm_string_printf(VM_STRING("   [-t<num>] - number of threads to limit\n"));
    vm_string_printf(VM_STRING("   [-f<num>]         - number of frames to limit\n"));
    vm_string_printf(VM_STRING("   [-u<8, 16>]  - bits per sample.\n"));
    vm_string_printf(VM_STRING("   [-f<yv12, yuv420, yuv422, yuv444, yuy2, rgb565, rgb24>] - color format\n"));
    vm_string_printf(VM_STRING("\n"));
}

Ipp32u num_threads = 0;
Ipp32s num_frames = (1 << 30);

void savedata(FILE * f_dst, VideoData *out, Ipp32s width, Ipp32s height)
{
    if (!f_dst)
        return;

    VideoData::PlaneInfo plInfo;
    out->GetPlaneInfo(&plInfo, 1);
    Ipp32s height_uv = plInfo.m_ippSize.height;
    Ipp32s width_uv  = plInfo.m_ippSize.width;

    Ipp8u *y = (Ipp8u*)out->GetPlanePointer(0);
    Ipp8u *u = (Ipp8u*)out->GetPlanePointer(1);
    Ipp8u *v = (Ipp8u*)out->GetPlanePointer(2);
    Ipp32s   y_pitch = (Ipp32s)out->GetPlanePitch(0);
    Ipp32s   u_pitch = (Ipp32s)out->GetPlanePitch(1);
    Ipp32s   v_pitch = (Ipp32s)out->GetPlanePitch(2);

    Ipp32s pixel_sz = plInfo.m_iBitDepth > 8 ? 2 : 1;

    Ipp32s j, n;
    for (j = 0; j < height; j++)
    {
        n = (Ipp32s)fwrite(y + j*y_pitch*pixel_sz, pixel_sz, width, f_dst);
    }

    for (j = 0; j < height_uv; j++)
    {
        n = (Ipp32s)fwrite(u + j*u_pitch*pixel_sz, pixel_sz, width_uv, f_dst);
    }

    for (j = 0; j < height_uv; j++)
    {
        n = (Ipp32s)fwrite(v + j*v_pitch*pixel_sz, pixel_sz, width_uv, f_dst);
    }

    fflush(f_dst);
}

Ipp32s FileNameFromParams(Ipp32s argc,
                          vm_char** argv,
                          Ipp32s iFirstParam,
                          vm_char* szFileName)
{
    bool bQuotes = false;
    VM_ASSERT(0 == szFileName[0]);

    if ('"' == argv[iFirstParam][0])
    {
        bQuotes = true;
        argv[iFirstParam]++;
    }

    vm_string_strcat(szFileName, argv[iFirstParam++]);
    if (bQuotes)
    {
        for(;;)
        {
            Ipp32u uiLen = vm_string_strlen(szFileName);
            if (0 < uiLen && '"' == szFileName[uiLen - 1])
            {
                szFileName[uiLen - 1] = 0;
                break;
            }
            else
            {
                if(argc > iFirstParam /*&& '-' != argv[iFirstParam][0]*/)
                {
                    if('"' == argv[iFirstParam][0])
                    {
                        break;
                    }
                    vm_string_strcat(szFileName, VM_STRING(" "));
                    vm_string_strcat(szFileName, argv[iFirstParam++]);
                }
                else
                {
                    break;
                }
            }
        }//for(;;)
    }
    return --iFirstParam;
}
int main( Ipp32s argc, vm_char *argv[])
{
    Ipp32s i;
    vm_char SrcFileName[UMC::MAXIMUM_PATH] = VM_STRING("");
    vm_char DstFileName[UMC::MAXIMUM_PATH] = VM_STRING("");

    FILE   *f_dst = 0;
    Ipp64f encode_time = 0;
    Ipp32s numDecodedFrames = 0;
    bool isNeedCC = false;
    Ipp32s numFramesToDecode = (1 << 30);

    FILE *perf_file = 0;

    ColorFormat cf = YUV420;
    Ipp32s bitDepth = 8;

    ippStaticInit();

    //////////////////////////////////////////////////////////////////////////
    // Loading command line params
    //////////////////////////////////////////////////////////////////////////
    for (i = 1; i < argc; i++)
    {
        size_t stArgLen = vm_string_strlen(argv[i]);
        if ('-' == argv[i][0])
        {
            switch (argv[i][1])
            {
            case 't':
            case 'T':
                if (2 == vm_string_strlen(argv[i])) {
                    i++;
                    if(argv[i][0]=='-') {
                        PrintHelp(argv[0]);
                        return 1;
                    } else {
                        num_threads = (Ipp32s)vm_string_atol(argv[i]);
                    }
                } else {
                    num_threads = (Ipp32s)vm_string_atol(argv[i] + 2);
                }
                break;
            case 'P':
            case 'p':
                i++;
                perf_file = vm_file_open(argv[i], VM_STRING("a"));
                break;
            case 'F':
            case 'f':
                {
                    vm_char* szCode = argv[i];
                    isNeedCC = true;

                    if (0 == vm_string_strcmp(szCode, VM_STRING("-fyv12")))
                    {   cf = UMC::YV12;    }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-fyuy2")))
                    {   cf = UMC::YUY2;    }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-frgb565")))
                    {   cf = UMC::RGB565; }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-frgb24")))
                    {   cf = UMC::RGB24; }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-fyuv420")))
                    {   cf = UMC::YUV420; }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-fyuv422")))
                    {   cf = UMC::YUV422; }
                    else if (0 == vm_string_strcmp(szCode, VM_STRING("-fyuv444")))
                    {   cf = UMC::YUV444; }
                    else
                    { num_frames = (Ipp32s)vm_string_atol(argv[i] + 2); }
                    break;
                }
                break;
            case 'U':
            case 'u':
                {
                    isNeedCC = true;

                    vm_char* szCode = NULL;
                    //  Use predefined color format instead of selected automaticaly
                    if (2 == stArgLen)
                    {
                        szCode = argv[++i];
                        if (i >= argc)
                            break;
                    }
                    else
                    {
                        szCode = argv[i] + 2;
                    }

                    if (0 == vm_string_strcmp(szCode, VM_STRING("16")))
                    {
                        bitDepth = 16;
                    } else {
                        bitDepth = 8;
                    }
                }
                break;
            case 'h':
            case 'H':
            case '?':
            default:
                PrintHelp(argv[0]);
                return 1;
            }
        }
        else
        {
            if (0 == SrcFileName[0]) {
                i = FileNameFromParams(argc, argv, i, SrcFileName);
            } else {
                i = FileNameFromParams(argc, argv, i, DstFileName);
            }
        }
    }

    if (SrcFileName[0] == 0)
    {
        PrintHelp(argv[0]);
        return 1;
    }

    if (DstFileName[0] != 0)
    {
        f_dst = vm_file_open(DstFileName, VM_STRING("wb"));
        if (f_dst == NULL)
        {
            vm_string_printf(__VM_STRING("Error opening dst file %s\n"), DstFileName);
            return -1;
        }
    }

    //////////////////////////////////////////////////////////////////////////
    // Initializing
    //////////////////////////////////////////////////////////////////////////
    auto_ptr< H264VideoDecoder > h264Decoder ( new H264VideoDecoder() );
    auto_ptr< VideoDecoderParams > params  ( new VideoDecoderParams() );
    VideoProcessing * color = isNeedCC ? new VideoProcessing() : 0;
    auto_ptr<BaseCodec> pPointerCopier (new DataPointersCopy());
    auto_ptr< MediaData > in ( new MediaData() );
    auto_ptr< VideoData > out ( new VideoData() );
    auto_ptr< H264AnnexBSplitter > splitter ( new H264AnnexBSplitter() );

    if(!h264Decoder.get() || !params.get() || !in.get() ||
        !out.get() || !splitter.get() || (!color && isNeedCC))
    {
        vm_string_printf(__VM_STRING("Allocation failed\n"));
        return -1;
    }

    if( UMC_OK != splitter->Init(SrcFileName))
    {
        vm_string_printf(__VM_STRING("Error opening src file %s\n"), SrcFileName);
        return -1;
    }

    bool bEndOfStream = false;
    bool bInitialize = false;

    //////////////////////////////////////////////////////////////////////////
    // Starting the decoding loop
    //////////////////////////////////////////////////////////////////////////

    vm_tick t_start_all = GET_TICKS;

    for (i = 0; i < numFramesToDecode; i++)
    {
        if ((3 > in->GetDataSize()) &&
            (false == bEndOfStream))
        {
            Status statusHelper = splitter->GetNextVideoData(*(in.get()));
            if(UMC_OK != statusHelper){
                bEndOfStream = true;
            }
        }

        if(!bInitialize)
        {
            bInitialize = true;

            if (color)
            {
                VideoProcessingParams postProcessingParams;
                postProcessingParams.m_DeinterlacingMethod = (DeinterlacingMethod)(0 & FLAG_CCNV_DEINTERLACE);;
                postProcessingParams.InterpolationMethod = 0;
                color->SetParams(&postProcessingParams);
            }

            if (color)
                params->pPostProcessing  = color;
            else
                params->pPostProcessing  = pPointerCopier.get();
            params->info.stream_type = H264_VIDEO;
            params->numThreads = num_threads;
            params->lFlags = 0;
            params->m_pData = in.get();

            if (UMC_OK != (h264Decoder->Init(params.get())))
            {
                vm_string_printf(__VM_STRING("Video Decoder creation failed\n"));
                return -1;
            }

            H264VideoDecoderParams params;
            if (UMC_OK != h264Decoder->GetInfo(&params))
            {
                vm_string_printf(__VM_STRING("Video Decoder creation failed\n"));
                return -1;
            }

            out->SetAlignment(16);
            out->Init(params.info.clip_info.width, params.info.clip_info.height, cf, bitDepth);
            out->Alloc();
            continue;
        }

        vm_tick t_start = GET_TICKS;
        Status ret = h264Decoder->GetFrame((bEndOfStream) ? (NULL) : (in.get()), out.get());
        vm_tick t_end = GET_TICKS;
        encode_time += (Ipp64f)(Ipp64s)(t_end-t_start);

        if (UMC_ERR_NOT_ENOUGH_DATA == ret)
        {
            if (bEndOfStream)
                break;
            else
                continue;
        }

        if (UMC_OK != ret)
            break;

        savedata(f_dst, out.get(), out->GetWidth(), out->GetHeight());
        if (numDecodedFrames % 100 == 0)
        {
            vm_string_printf( VM_STRING(". "));
        }

        numDecodedFrames++;
        if (numDecodedFrames >= num_frames && num_frames != 0)
            break;
    }

    vm_tick t_end_all = GET_TICKS;
    Ipp64f all_time = (Ipp64f)(Ipp64s)(t_end_all-t_start_all);

    Ipp64f cpu_freq = (Ipp64s)vm_time_get_frequency();
    vm_string_printf(VM_STRING("%s\t"), SrcFileName);
    vm_string_printf(VM_STRING("%d\t"), numDecodedFrames);
    vm_string_printf(VM_STRING("%.4f s.\t"), encode_time/cpu_freq);
    vm_string_printf(VM_STRING("%.4f fps\t"), (Ipp64f)cpu_freq*numDecodedFrames/(Ipp64f)(encode_time));
    vm_string_printf(VM_STRING("All - %.4f fps\n"), (Ipp64f)cpu_freq*numDecodedFrames/(Ipp64f)(all_time));

    if(f_dst)
        fclose(f_dst);

    delete color;

    if (perf_file)
    {
        vm_string_fprintf(perf_file, VM_STRING("%s,"), SrcFileName);
        vm_string_fprintf(perf_file, VM_STRING("%d,"), numDecodedFrames);
        vm_string_fprintf(perf_file, VM_STRING("%.4f,"), encode_time/cpu_freq);
        vm_string_fprintf(perf_file, VM_STRING("%.4f,"), (Ipp64f)cpu_freq*numDecodedFrames/(Ipp64f)(encode_time));
        vm_string_fprintf(perf_file, VM_STRING("%.4f,\n"), (Ipp64f)cpu_freq*numDecodedFrames/(Ipp64f)(all_time));

        fclose(perf_file);
    }

#ifdef VM_MALLOC
    vm_string_printf("Mem usage MAX: %d\n", vm_malloc_array.GetMemUsageMax() );
#endif /* VM_MALLOC */

    return 0;
}
