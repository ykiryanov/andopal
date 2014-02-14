#include "stdafx.h"
#include "debug.h"

#include "OneThreadJob.h"

OneThreadJobManager::OneThreadJobManager(int iThreadPrio)
    : _pRootJobs(NULL), _pCurJob(NULL)
{
    _hThread = ::CreateThread( 0, 0, MainThread, this, 0, NULL);
    if (_hThread) 
        ::SetThreadPriority(_hThread, iThreadPrio);
}

OneThreadJobManager::~OneThreadJobManager()
{
    HANDLE hThread = _hThread;
    _hThread = NULL;

    {
        MyWaitAndSignal lock(_JobQueueLock);
        if (_pRootJobs) {
            OneThreadJob* p = _pRootJobs->_pNext;
            do {
                p->SetState(OneThreadJob::eCanceled);
                p = p->_pNext;
            } while (p != _pRootJobs->_pNext);
            _pRootJobs = NULL;
        }
    }

    _WaitingJob.Signal();

    if (hThread) {
        if (::WaitForSingleObject(hThread,500) != WAIT_OBJECT_0)
            ::TerminateThread(hThread,0);
        ::CloseHandle(hThread);
        if (_pCurJob)
            _pCurJob->SetState(OneThreadJob::eCanceled);
    }
}

DWORD OneThreadJobManager::Main()
{
    for (;;) {
        if (!GetJob())
            return NULL;
        dbLog("+J\n");
        _pCurJob->SetState(OneThreadJob::eExecuted);
        _pCurJob->Execute();
        _pCurJob->SetState(OneThreadJob::eDone);
        _pCurJob = NULL;
        dbLog("-J\n");
    }
}


void OneThreadJobManager::AddJob(OneThreadJob* pJob)
{
    if (!pJob)
        return;

    pJob->SetState(OneThreadJob::eNone);

    {
        MyWaitAndSignal lock(_JobQueueLock);
        if (!_hThread) {
            pJob->SetState(OneThreadJob::eCanceled);
            return;
        }

        if (_pRootJobs == NULL) {
            _pRootJobs = pJob;
            pJob->_pNext = pJob;
        }
        else {
            pJob->_pNext = _pRootJobs->_pNext;
            _pRootJobs->_pNext = pJob;
            _pRootJobs = pJob;
        }
        pJob->SetState(OneThreadJob::eWaiting);
    }
    _WaitingJob.Signal();
}


bool OneThreadJobManager::GetJob()
{
    _pCurJob = NULL;

    for (;;) {
        if (!_pRootJobs) {
            dbLog("_WaitingJob.Wait();\n");
            _WaitingJob.Wait();
        }
    
        if (!_hThread)
            return false;

        if (_pRootJobs)
        {
            MyWaitAndSignal lock(_JobQueueLock);
            _pCurJob = _pRootJobs->_pNext;
            if (_pCurJob == _pRootJobs)
                _pRootJobs = NULL;
            else
                _pRootJobs->_pNext = _pCurJob->_pNext;
            _pCurJob->_pNext = NULL;
            return true;
        }
    }
}
