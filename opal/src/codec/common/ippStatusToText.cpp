#ifdef _WIN32
#include <windows.h>
#include <stdlib.h>
#endif

#include "ippdefs.h"
//#include "ippcore.h"
//#include "ipps.h"
//#include "ippvc.h"

//#include "umc_base_codec.h"
//#include "umc_video_data.h"
#include "umc_structures.h"


const char* UMCStatusToText(UMC::Status status)
{
	switch(status)
	{
	    case UMC::UMC_OK : return "OK"; 
        case UMC::UMC_ERR_FAILED: return "Operation failed"; 
        case UMC::UMC_ERR_NOT_INITIALIZED : return "Not initialized"; 
        case UMC::UMC_ERR_TIMEOUT: return "Timeout"; 
        case UMC::UMC_ERR_NOT_ENOUGH_DATA : return "Not enough input data"; 
        case UMC::UMC_ERR_NULL_PTR : return "Null pointer in input parameters";
        case UMC::UMC_ERR_INIT : return "Failed to initialize codec"; 
        case UMC::UMC_ERR_SYNC : return "Can't find sync word in buffer"; 
        case UMC::UMC_ERR_NOT_ENOUGH_BUFFER : return "Not enough buffer to put output data"; 
        case UMC::UMC_ERR_END_OF_STREAM : return "End of stream"; 
        case UMC::UMC_ERR_OPEN_FAILED : return "Failed to open file/device";  
        case UMC::UMC_ERR_ALLOC : return "Failed to allocate memory";
        case UMC::UMC_ERR_INVALID_STREAM : return "Invalid stream";
        case UMC::UMC_ERR_UNSUPPORTED : return "Unsupported";
        case UMC::UMC_ERR_NOT_IMPLEMENTED : return "Not implemented";
        case UMC::UMC_ERR_INVALID_PARAMS : return "Invalid parameters";
        case UMC::UMC_WRN_INVALID_STREAM : return "Invalid stream";
        case UMC::UMC_WRN_REPOSITION_INPROGRESS : return "Reposition in progress";
        case UMC::UMC_WRN_INFO_NOT_READY : return "Info not ready";
	default:
		break;
	}

	return "Unknown";
}
