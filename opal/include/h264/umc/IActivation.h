/////////////////////////////////////////////////////////////////////////////
//
// Activation.h : Common Structures and Functions for Bone API Activation
//
// Copyright (c) 2009 Dinsk, dinsk.net
//
/////////////////////////////////////////////////////////////////////////////

#pragma once

struct PluginCodec_information;

/////////////////////////////////////////////////////////////////////////////
struct PluginCodec_Description {
	unsigned int             version; // codec structure version

	// start of version 1 fields
	PluginCodec_information *info;    // license information
	unsigned int             flags;	  // activation state
};

#ifndef ACTIVATION_STATE_DEFINED
enum ActivationState
{ 
	ACTIVATION_UNKNOWN_PLUGIN = -1, 
	ACTIVATION_UNREGISTERED = 0, 
	ACTIVATION_PENDING,
	ACTIVATION_REGISTERED
};
#endif // ACTIVATION_STATE_DEFINED


class IActivation
{
public:
	virtual ActivationState GetActivationState() = 0;

	// Adds time interval to usage counter
	// CounterID - an arbitrary integer that helps distinguish different object, e.g. calls
	// Method returns true if object can be still used or false otherwise
	virtual bool Use(int nCounterID, int nMilliseconds) = 0;

	// Method returns true if object can be used
	virtual bool CanUseObject(int nCounterID) = 0;
};

