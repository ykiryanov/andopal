/*
 * h460_std19.cxx
 *
 * H.460.19 H225 NAT Traversal class.
 *
 * Copyright (c) 2008 ISVO (Asia) Pte. Ltd.
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Alternatively, the contents of this file may be used under the terms
 * of the General Public License (the  "GNU License"), in which case the
 * provisions of GNU License are applicable instead of those
 * above. If you wish to allow use of your version of this file only
 * under the terms of the GNU License and not to allow others to use
 * your version of this file under the MPL, indicate your decision by
 * deleting the provisions above and replace them with the notice and
 * other provisions required by the GNU License. If you do not delete
 * the provisions above, a recipient may use your version of this file
 * under either the MPL or the GNU License."
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and limitations
 * under the License.
 *
 *
 * The Initial Developer of the Original Code is ISVO (Asia) Pte. Ltd.
 *
 * Portions of this code were written with the assisance of funding from
 * triple-IT. http://www.triple-it.nl.
 *
 * Contributor(s): Many thanks to Simon Horne.
 *                 Robert Jongbloed (robertj@voxlucida.com.au).
 *
 * $Revision: 30948 $
 * $Author: rjongbloed $
 * $Date: 2013-11-23 02:44:42 +0000 (Sat, 23 Nov 2013) $
 */

#include <ptlib.h>

#define P_FORCE_STATIC_PLUGIN 1

#include <h460/h460_std19.h>

#if OPAL_H460_NAT

#include <h323/h323ep.h>
#include <h323/h323pdu.h>
#include <h460/h46019.h>
#include <h460/h460_std24.h>
#include <ptclib/random.h>


#pragma message("H.460.19 Enabled. See Tandberg Patent License. http://www.tandberg.com/collateral/tandberg-ITU-license.pdf")

#define PTraceModule() "H46019"

PCREATE_NAT_PLUGIN(H46019, "H.460.19");

const H460_FeatureID & H460_FeatureStd19::ID() { static const H460_FeatureID id(19); return id; }

// H.460.19 parameters
static const H460_FeatureID supportTransmitMultiplexedMedia_ID(1);
static const H460_FeatureID mediaTraversalServer_ID(2);


///////////////////////////////////////////////////////
// H.460.19
//
// Must Declare for Factory Loader.
H460_FEATURE(Std19, "H.460.19");

H460_FeatureStd19::H460_FeatureStd19()
  : H460_Feature(ID())
  , m_natMethod(NULL)
  , m_remoteSupportsMux(false)
  , m_remoteIsServer(false)
{
  AddParameter(supportTransmitMultiplexedMedia_ID);  // add compulsory parameter: we can transmit multiplexed data
}


bool H460_FeatureStd19::Initialise(H323EndPoint & ep, H323Connection * con)
{
  if (!H460_Feature::Initialise(ep, con))
    return false;

  if (m_endpoint->GetH46019Server() != NULL)
    AddParameter(mediaTraversalServer_ID);

  return GetNatMethod(PNatMethod_H46019::MethodName(), m_natMethod);
}


bool H460_FeatureStd19::OnSendPDU(H460_MessageType pduType, H460_FeatureDescriptor & pdu)
{
  if (m_connection == NULL)
    return false;

  H460_Feature::OnSendPDU(pduType, pdu);

  // Check for H.460.24 override
  H460_FeatureStd24 * feat24;
  if (GetFeatureOnGk(feat24) && feat24->IsDisabledH46019()) {
    PTRACE(4, "Disabled via H.460.24.");
    return false;
  }

  return true;
}


void H460_FeatureStd19::OnReceivePDU(H460_MessageType pduType, const H460_FeatureDescriptor & pdu)
{
  H460_Feature::OnReceivePDU(pduType, pdu);
  m_remoteSupportsMux = pdu.HasParameter(supportTransmitMultiplexedMedia_ID);
  m_remoteIsServer = pdu.HasParameter(mediaTraversalServer_ID);
}


bool H460_FeatureStd19::OnSendingOLCGenericInformation(unsigned sessionID, H245_ArrayOf_GenericParameter & param, bool /*isAck*/)
{
  if (!PAssert(m_connection != NULL, PLogicError))
    return false;

  // Check for H.460.24 override
  {
    H460_FeatureStd24 * feat24;
    if (GetFeatureOnGk(feat24) && feat24->IsDisabledH46019()) {
      PTRACE(4, "Disabled via H.460.24.");
      return false;
    }
  }

  OpalRTPSession * session = dynamic_cast<OpalRTPSession *>(m_connection->GetMediaSession(sessionID));
  if (session == NULL) {
    PTRACE(2, "Session " << sessionID << " not found or not RTP.");
    return false;
  }

  H46019_TraversalParameters traversal;

  H46019Server * server = m_endpoint->GetH46019Server();
  if (server == NULL) {
    H46019UDPSocket * rtp = dynamic_cast<H46019UDPSocket *>(&session->GetDataSocket());
    if (rtp == NULL) {
      PTRACE(2, "Session " << sessionID << " RTP socket not generated by H.460.19.");
      return false;
    }

    traversal.IncludeOptionalField(H46019_TraversalParameters::e_keepAlivePayloadType);
    ((PASN_Integer &)traversal.m_keepAlivePayloadType).SetValue(rtp->FindKeepAlivePayloadType(*m_connection));
  }
  else {
    if (server->GetKeepAliveAddress().SetPDU(traversal.m_keepAliveChannel)) {
      traversal.IncludeOptionalField(H46019_TraversalParameters::e_keepAliveChannel);
      traversal.IncludeOptionalField(H46019_TraversalParameters::e_keepAliveInterval);
      ((H225_TimeToLive &)traversal.m_keepAliveInterval).SetValue(server->GetKeepAliveTTL());
    }

    if (m_remoteSupportsMux) {
      if (server->GetMuxRTPAddress().SetPDU(traversal.m_multiplexedMediaChannel))
        traversal.IncludeOptionalField(H46019_TraversalParameters::e_multiplexedMediaChannel);

      if (server->GetMuxRTCPAddress().SetPDU(traversal.m_multiplexedMediaControlChannel))
        traversal.IncludeOptionalField(H46019_TraversalParameters::e_multiplexedMediaControlChannel);

      if (traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexedMediaChannel) ||
          traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexedMediaControlChannel)) {
        traversal.IncludeOptionalField(H46019_TraversalParameters::e_multiplexID);
        traversal.m_multiplexID = server->CreateMultiplexID(session->GetLocalAddress(true), session->GetLocalAddress(false));
      }
    }

    if (!traversal.HasOptionalField(H46019_TraversalParameters::e_keepAliveChannel) &&
        !traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexID)) {
      PTRACE(3, "Session " << sessionID << " H.460.19 server side not configured correctly.");
      return false;
    }
  }

  PTRACE(4, "Sending Traversal Parameters:\n   " << traversal);
  H323AddGenericParameterObject(param, 1, traversal);

  return true;
}


void H460_FeatureStd19::OnReceiveOLCGenericInformation(unsigned sessionID, const H245_ArrayOf_GenericParameter & params, bool /*isAck*/)
{
  if (!PAssert(m_connection != NULL, PLogicError))
    return;

  H46019_TraversalParameters traversal;
  if (  params.GetSize() == 0 ||
        params[0].m_parameterValue.GetTag() != H245_ParameterValue::e_octetString ||
       !((const PASN_OctetString &)params[0].m_parameterValue).DecodeSubType(traversal)) {
    PTRACE(2, "Error decoding Traversal Parameters!");
    return;
  }

  PTRACE(4, "Received Traversal Parameters:\n   " << traversal);

  OpalRTPSession * session = dynamic_cast<OpalRTPSession *>(m_connection->GetMediaSession(sessionID));
  if (session == NULL) {
    PTRACE(2,"Session " << sessionID << " not found or not RTP.");
    return;
  }

  H46019UDPSocket * rtp = dynamic_cast<H46019UDPSocket *>(&session->GetDataSocket());
  if (rtp == NULL) {
    PTRACE(2,"Session " << sessionID << " RTP socket not generated by H.460.19.");
    return;
  }

  H46019UDPSocket * rtcp = dynamic_cast<H46019UDPSocket *>(&session->GetControlSocket());
  if (rtcp == NULL) {
    PTRACE(2,"Session " << sessionID << " RTCP socket not generated by H.460.19.");
    return;
  }

  if (traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexID)) {
    unsigned multiplexID = traversal.m_multiplexID;
    rtp->SetMultiplexID(multiplexID);
    rtcp->SetMultiplexID(multiplexID);
    PTRACE(4,"Session " << sessionID << " transmitting multiplexed data: id=" << multiplexID);

    if (traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexedMediaChannel))
      session->SetRemoteAddress(H323TransportAddress(traversal.m_multiplexedMediaChannel), true);
    if (traversal.HasOptionalField(H46019_TraversalParameters::e_multiplexedMediaControlChannel))
      session->SetRemoteAddress(H323TransportAddress(traversal.m_multiplexedMediaControlChannel), false);
  }

  if (traversal.HasOptionalField(H46019_TraversalParameters::e_keepAliveChannel)) {
    H323TransportAddress keepAliveAddress(traversal.m_keepAliveChannel);
    unsigned ttl = 20;
    if (traversal.HasOptionalField(H46019_TraversalParameters::e_keepAliveInterval))
      ttl = traversal.m_keepAliveInterval;

    rtp->FindKeepAlivePayloadType(*m_connection);
    rtp->ActivateKeepAliveRTP(keepAliveAddress, ttl);
    rtcp->ActivateKeepAliveRTCP(ttl);
  }
}


/////////////////////////////////////////////////////////////////////////////

H46019Server::H46019Server(H323EndPoint & ep)
  : m_endpoint(ep)
  , m_keepAliveTTL(20)
  , m_keepAliveSocket(NULL)
  , m_rtpSocket(NULL)
  , m_rtcpSocket(NULL)
  , m_multiplexThread(NULL)
{
}


H46019Server::H46019Server(H323EndPoint & ep, const PIPSocket::Address & localInterface)
  : m_endpoint(ep)
  , m_keepAliveTTL(20)
{
  m_keepAliveSocket = m_rtpSocket = new PUDPSocket;
  m_rtcpSocket = m_rtpSocket = new PUDPSocket;

  PIPSocket * sockets[2] = { m_rtpSocket, m_rtcpSocket };
  if (ep.GetManager().GetRtpIpPortRange().Listen(sockets, 2, localInterface))
    m_multiplexThread = new PThreadObj<H46019Server>(*this, &H46019Server::MultiplexThread, false, "MuxH.460.19");
  else {
    delete m_rtpSocket;
    delete m_rtcpSocket;
    m_keepAliveSocket = m_rtcpSocket = m_rtpSocket = NULL;
    m_multiplexThread = NULL;
  }
}


H46019Server::~H46019Server()
{
  if (m_keepAliveSocket != m_rtpSocket)
    delete m_keepAliveSocket;
  delete m_rtpSocket;
  delete m_rtcpSocket;
}


H323TransportAddress H46019Server::GetKeepAliveAddress() const
{
  PIPSocketAddressAndPort ipAndPort;
  if (m_keepAliveSocket != NULL && m_keepAliveSocket->GetLocalAddress(ipAndPort))
    return H323TransportAddress(ipAndPort);

  return H323TransportAddress();
}


H323TransportAddress H46019Server::GetMuxRTPAddress() const
{
  PIPSocketAddressAndPort ipAndPort;
  if (m_rtpSocket != NULL && m_rtpSocket->GetLocalAddress(ipAndPort))
    return H323TransportAddress(ipAndPort);

  return H323TransportAddress();
}


H323TransportAddress H46019Server::GetMuxRTCPAddress() const
{
  PIPSocketAddressAndPort ipAndPort;
  if (m_rtcpSocket != NULL && m_rtcpSocket->GetLocalAddress(ipAndPort))
    return H323TransportAddress(ipAndPort);

  return H323TransportAddress();
}


unsigned H46019Server::CreateMultiplexID(const PIPSocketAddressAndPort & rtp, const PIPSocketAddressAndPort & rtcp)
{
  unsigned id;
  do {
    id = PRandom::Number();
  } while (!m_multiplexedSockets.insert(MuxMap::value_type(id, SocketPair(rtp, rtcp))).second);
  return id;
}


void H46019Server::MultiplexThread()
{
  PTRACE(4, "Started multiplex thread");

  while (m_rtpSocket->IsOpen()) {
    int selectStatus = PSocket::Select(*m_rtpSocket, *m_rtcpSocket, PMaxTimeInterval);
    if (selectStatus > 0) {
      PTRACE(1, "Select error: " << PChannel::GetErrorText((PChannel::Errors)selectStatus));
      break;
    }

    if ((-selectStatus & 1) != 0 && !Multiplex(false))
      break;

    if ((-selectStatus & 2) != 0 && !Multiplex(true))
      break;
  }

  PTRACE(4, "Ended multiplex thread");
}


bool H46019Server::Multiplex(bool rtcp)
{
  struct {
    PUInt32b m_muxId;
    BYTE     m_packet[65532];
  } buffer;

  PUDPSocket & socket = *(rtcp ? m_rtcpSocket : m_rtpSocket);
  if (!socket.Read(&buffer, sizeof(buffer))) {
    PTRACE(3, "Multiplex socket read error: " << socket.GetErrorText(PChannel::LastReadError));
    return false;
  }

  MuxMap::iterator it = m_multiplexedSockets.find(buffer.m_muxId);
  if (it == m_multiplexedSockets.end()) {
    PTRACE(3, "Received packet with unknown multiplex ID: " << buffer.m_muxId);
    return true;
  }

  if (socket.WriteTo(buffer.m_packet, socket.GetLastReadCount()-sizeof(buffer.m_muxId), rtcp ? it->second.m_rtcp : it->second.m_rtp))
    return true;

  PTRACE(3, "Multiplex socket write error: " << socket.GetErrorText(PChannel::LastWriteError));
  return false;
}


/////////////////////////////////////////////////////////////////////////////////////////////

PNatMethod_H46019::PNatMethod_H46019(unsigned priority)
  : PNatMethod(priority)
{
}


const char * PNatMethod_H46019::MethodName()
{
  return PPlugin_PNatMethod_H46019::ServiceName();
}


PCaselessString PNatMethod_H46019::GetMethodName() const
{
  return MethodName();
}


PString PNatMethod_H46019::GetServer() const
{
  return PString::Empty();
}


void PNatMethod_H46019::InternalUpdate()
{
  m_natType = PortRestrictedNat; // Assume worst possible NAT type that can do media at all
}


PNATUDPSocket * PNatMethod_H46019::InternalCreateSocket(Component component, PObject * context)
{
  return new H46019UDPSocket(component, *dynamic_cast<OpalRTPSession *>(context));
}


bool PNatMethod_H46019::IsAvailable(const PIPSocket::Address & binding, PObject * context)
{
  H460_FeatureStd19 * feature;
  if (!H460_Feature::FromContext(context, feature))
    return false;

  if (!feature->IsRemoteServer()) {
    PTRACE(4, "Not available if remote is not a server");
    return false;
  }

  return PNatMethod::IsAvailable(binding, context);
}


/////////////////////////////////////////////////////////////////////////////////////////////

H46019UDPSocket::H46019UDPSocket(PNatMethod::Component component, OpalRTPSession & session)
  : PNATUDPSocket(component)
  , m_session(session)
  , m_keepAlivePayloadType(RTP_DataFrame::IllegalPayloadType)
  , m_keepAliveSequence(0)
  , m_multiplexedTransmit(false)
{
  m_keepAliveTimer.SetNotifier(PCREATE_NOTIFIER(KeepAliveTimeout));
}


H46019UDPSocket::~H46019UDPSocket()
{
  m_keepAliveTimer.Stop();
}


RTP_DataFrame::PayloadTypes H46019UDPSocket::FindKeepAlivePayloadType(H323Connection & connection)
{
  if (m_keepAlivePayloadType == RTP_DataFrame::IllegalPayloadType) {
    OpalMediaFormatList mediaFormats = connection.GetLocalMediaFormats();
    m_keepAlivePayloadType = RTP_DataFrame::MaxPayloadType;
    do {
      m_keepAlivePayloadType = (RTP_DataFrame::PayloadTypes)(m_keepAlivePayloadType-1);
    } while (mediaFormats.FindFormat(m_keepAlivePayloadType) != mediaFormats.end());
  }

  return m_keepAlivePayloadType;
}


void H46019UDPSocket::ActivateKeepAliveRTP(const H323TransportAddress & address, unsigned ttl)
{
  if (!PAssert(m_component == PNatMethod::eComponent_RTP, "ActivateKeepAliveRTP called on RTP socket"))
    return;

  address.GetIpAndPort(m_keepAliveAddress);
  m_keepAliveTTL.SetInterval(0, ttl);

  PTRACE(4, "Started RTP Keep Alive to " << m_keepAliveAddress << " every " << m_keepAliveTTL << " secs.");
  SendKeepAliveRTP(m_keepAliveAddress);
}


void H46019UDPSocket::ActivateKeepAliveRTCP(unsigned ttl)
{
  if (!PAssert(m_component == PNatMethod::eComponent_RTCP, "ActivateKeepAliveRTCP called on RTP socket"))
    return;

  m_keepAliveTTL.SetInterval(0, ttl);

  PTRACE(4, "Started RTCP Keep Alive reports every " << m_keepAliveTTL << " secs.");
  m_session.SendReport(true);
}


void H46019UDPSocket::KeepAliveTimeout(PTimer &, P_INT_PTR)
{
  PTRACE(4, "Keep Alive timer fired for " << (m_component == PNatMethod::eComponent_RTP ? "RTP" : "RTCP"));
  if (m_component == PNatMethod::eComponent_RTCP)
    m_session.SendReport(true);
  else
    SendKeepAliveRTP(m_keepAliveAddress);
}


void H46019UDPSocket::SendKeepAliveRTP(const PIPSocketAddressAndPort & ipAndPort)
{
  RTP_DataFrame rtp;
  rtp.SetSequenceNumber(m_keepAliveSequence);
  rtp.SetPayloadType(m_keepAlivePayloadType);
  m_session.WriteData(rtp, &ipAndPort, false);
}


PBoolean H46019UDPSocket::InternalWriteTo(const Slice * slices, size_t sliceCount, const PIPSocketAddressAndPort & ipAndPort)
{
  if (sliceCount == 1 && slices[0].GetLength() <= 1) {
    PTRACE(5, "Ignoring old NAT opening packet for " << (m_component == PNatMethod::eComponent_RTP ? "RTP" : "RTCP"));
    lastWriteCount = 1;
    return true;
  }

  // Sent something to keep alive, so reset timer
  if (m_component == PNatMethod::eComponent_RTCP || ipAndPort == m_keepAliveAddress)
    m_keepAliveTimer = m_keepAliveTTL;

  Slice * adjustedSlices;
  size_t adjustedCount;

  if (m_multiplexedTransmit) {
    PTRACE(6, "Multiplexing " << (m_component == PNatMethod::eComponent_RTP ? "RTP" : "RTCP")
           << " to " << ipAndPort << ", id=" << m_multiplexID << ", size=" << slices[0].GetLength());
    // If a muxId was given in traversal parameters, then we need to insert it
    // as the 1st four bytes of rtp data.
    adjustedCount = sliceCount+1;
    adjustedSlices = (Slice *)alloca(adjustedCount*sizeof(Slice));
    adjustedSlices[0].SetBase(&m_multiplexID);
    adjustedSlices[0].SetLength(4);
    memmove(adjustedSlices+1, slices, sliceCount*sizeof(Slice));
  }
  else {
    adjustedSlices = const_cast<Slice *>(slices);
    adjustedCount = sliceCount;
  }

  return PNATUDPSocket::InternalWriteTo(adjustedSlices, adjustedCount, ipAndPort);
}


#endif  // OPAL_H460_NAT
