/* /////////////////////////////////////////////////////////////////////////////
//
//                  INTEL CORPORATION PROPRIETARY INFORMATION
//     This software is supplied under the terms of a license agreement or
//     nondisclosure agreement with Intel Corporation and may not be copied
//     or disclosed except in accordance with the terms of that agreement.
//          Copyright(c) 2001-2007 Intel Corporation. All Rights Reserved.
//
*/

// main_wce4.cpp : Defines the entry point for the application.
//

//#if defined (WIN32) || defined _WIN32_WCE
#if defined _WIN32_WCE

#include <windows.h>
#include "vm_types.h"
#include "umc_thread.h"

Ipp32s main(Ipp32s argc, vm_char* argv[]);

Ipp32s ParseCmdLine(vm_char* lpCmdLine,
                    vm_char** pszArgv,
                    Ipp32s& riArgc)
{
    Ipp32s iRes = 0;

    riArgc = 0;
    vm_char cPrevChar = ' ';
    Ipp32s iStrLen = vm_string_strlen(lpCmdLine);
    for (Ipp32s i = 0; i < iStrLen; i++)
    {
        switch (lpCmdLine[i])
        {
        case ' ':
        case '\t':
            if (' ' != cPrevChar && NULL != pszArgv)
            {   lpCmdLine[i] = 0;   }
            cPrevChar = ' ';
            break;
        default:
            if (' ' == cPrevChar)
            {
                if (NULL != pszArgv)
                {   pszArgv[riArgc] = &(lpCmdLine[i]); }
                riArgc++;
            }
            cPrevChar = lpCmdLine[i];
            break;
        }
    }
    return iRes;
}


Ipp32s WINAPI WinMain(HINSTANCE hInstance,
                      HINSTANCE hPrevInstance,
                      LPTSTR    lpCmdLine,
                      Ipp32s    nCmdShow)
{
    Ipp32s iRes = 0;
    //  Count the number of parameters
    Ipp32s iArgc = 1;  //  1 is program name

    iRes = ParseCmdLine(lpCmdLine, NULL, iArgc);

    //  Get module file name and pass it to main as a first parameter
    vm_char szFileName[MAX_PATH];
    if (0 == iRes)
    {
        iRes = GetModuleFileName(hInstance, szFileName, MAX_PATH);
        if (0 != iRes)
        {
            iArgc++;    //  add program file name parameter
            iRes = 0;
        }
        else
        {  iRes = -1;  }
    }

    //  Allocate array of string pointers to keep poiners to args
    vm_char** pArgv = NULL;
    if (0 == iRes && 0 != iArgc)
    {
        pArgv = new vm_char*[iArgc];
        if (NULL == pArgv)
        {   iRes = -1;  }
    }

    if (0 == iRes)
    {
        pArgv[0] = szFileName;  //  Set up program name as first parameter

        if (1 < iArgc) {
            //  Get pointers to other parameters
            iRes = ParseCmdLine(lpCmdLine, &pArgv[1], iArgc);
            iArgc++;
        }
    }

    main(iArgc, pArgv);
    delete pArgv;
    return 0;
}

#endif //   defined (WIN32) || defined _WIN32_WCE
