/*
 * socket.h
 *
 * Berkley sockets ancestor class.
 *
 * Portable Windows Library
 *
 * Copyright (c) 1993-1998 Equivalence Pty. Ltd.
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is Portable Windows Library.
 *
 * The Initial Developer of the Original Code is Equivalence Pty. Ltd.
 *
 * Portions are Copyright (C) 1993 Free Software Foundation, Inc.
 * All Rights Reserved.
 *
 * Contributor(s): ______________________________________.
 *
 * $Revision: 28943 $
 * $Author: csoutheren $
 * $Date: 2013-01-18 14:32:18 +0000 (Fri, 18 Jan 2013) $
 */

///////////////////////////////////////////////////////////////////////////////
// PSocket

  public:
    ~PSocket();
      // close a socket

    virtual PBoolean Read(void * buf, PINDEX len);
    virtual PBoolean Write(const void * buf, PINDEX len);
    virtual PBoolean Close();

  protected:
    virtual HANDLE GetAsyncReadHandle() const;
    virtual HANDLE GetAsyncWriteHandle() const;
    PBoolean ConvertOSError(P_INT_PTR status, ErrorGroup group = LastGeneralError);
    static PBoolean ConvertOSError(P_INT_PTR error, Errors & lastError, int & osError);


// End Of File ///////////////////////////////////////////////////////////////