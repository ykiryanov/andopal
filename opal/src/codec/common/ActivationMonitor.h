#pragma once
#ifndef __ActivationMonitor_h
#define __ActivationMonitor_h

#include "IActivation.h"
#include "vm_time.h"

class IActivation;

class ActivationMonitor
{
    static IActivation* s_pActivation;
    static long s_nCodecObjectId;
    static int GetNextCodecObjectId()
    {
#if defined(_WIN32_WCE) || defined(OSX32)
	    return ++s_nCodecObjectId;
#else
	    return InterlockedIncrement(&s_nCodecObjectId);
#endif 
    };

    int     _objID;
    bool    _bStarted;
    vm_tick _tkLast;
    vm_tick _tkFreq;

public:
    static void SetActivationInterface(IActivation* pActivation) 
    { s_pActivation = pActivation; }


    ActivationMonitor() {
        _bStarted = false;
        _objID = GetNextCodecObjectId();
        _tkLast = vm_time_get_tick();
        _tkFreq = vm_time_get_frequency();
    }

    bool    CanUse() {
	    if (s_pActivation == NULL)
		    return false;

        if (!_bStarted) {
            _bStarted = true;
            _tkLast = vm_time_get_tick();
	        return s_pActivation->CanUseObject(_objID);
        }
        else {
            unsigned nMSec = 0;
            vm_tick tkTimeCur = vm_time_get_tick();
            vm_tick ktDeltaTime = tkTimeCur - _tkLast;

            if (ktDeltaTime > _tkFreq) {
                if ((ktDeltaTime>>4) < _tkFreq) {
                    while (ktDeltaTime > _tkFreq) {
                        nMSec += 1000;
                        ktDeltaTime -= _tkFreq;
                        _tkLast += _tkFreq;
                    }
                }
            }
	        return s_pActivation->Use(_objID, nMSec*3/2);
        }
        return true;
    }
};


#ifdef ACTIVATION_MONITOR_STATIC
long            ActivationMonitor::s_nCodecObjectId = 0L;
IActivation*    ActivationMonitor::s_pActivation = NULL;
#endif //ACTIVATION_MONITOR_STATIC


#endif // __ActivationMonitor_h
