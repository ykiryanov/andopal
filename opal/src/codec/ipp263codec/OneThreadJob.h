#pragma once


class MyMutex
{
    HANDLE  _handle;
public:
    MyMutex()       { _handle = ::CreateMutex(NULL, FALSE, NULL);}
    ~MyMutex()      { ::CloseHandle(_handle); }
    void Wait()     { ::WaitForSingleObject(_handle, INFINITE); }
    void Signal()   { ::ReleaseMutex(_handle); }
};


class MySemaphore
{
    HANDLE  _handle;
public:
    MySemaphore()   { _handle = ::CreateSemaphore(NULL, 0, 1, NULL);}
    ~MySemaphore()  { ::CloseHandle(_handle); }
    void Wait()     { ::WaitForSingleObject(_handle, INFINITE); }
    void Signal()   { ::ReleaseSemaphore(_handle, 1, NULL); }
};



class MyWaitAndSignal 
{
protected:
    MyMutex& _sync;
public:
    MyWaitAndSignal(MyMutex& mutex, bool bWait=true) : _sync(mutex) { if (bWait) _sync.Wait(); }
    ~MyWaitAndSignal()  { _sync.Signal(); }
};


struct OneThreadJob
{
    enum State { eNone=0, eWaiting, eExecuted, eDone, eCanceled } _State; 
    OneThreadJob*   _pNext;
    HANDLE          _handle;

    OneThreadJob(bool bWaitSync) : _pNext(NULL), _State(eNone), _handle(NULL) 
    { 
        if (bWaitSync) 
            _handle = ::CreateSemaphore(NULL, 0, 1, NULL);
    }

    ~OneThreadJob() { if (_handle) ::CloseHandle(_handle); }

    void SetState(State newState) {
        if (_State != newState) {
            _State = newState;
            if (_handle && (_State >= eDone))
                ::ReleaseSemaphore(_handle, 1, NULL); 
        }
    }
    bool WaitWhenExecute() { 
        if (_handle) 
            WaitForSingleObject(_handle,INFINITE);
        return _State == eDone;
    }
    virtual void Execute()  = 0;
};




class OneThreadJobManager
{
    DWORD   Main();
    static DWORD WINAPI MainThread(LPVOID lpParameter) { return ((OneThreadJobManager*) lpParameter)->Main(); }

    HANDLE                      _hThread;
    MySemaphore                 _WaitingJob;
    MyMutex                     _JobQueueLock;
    OneThreadJob*   volatile    _pRootJobs;
    OneThreadJob*   volatile    _pCurJob;

    bool GetJob();
public:
    OneThreadJobManager(int iPrio);
    ~OneThreadJobManager();

    void AddJob(OneThreadJob* pJob);
       
};

