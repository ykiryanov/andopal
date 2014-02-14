
#include "IActivation.h"
#include "pluginActivation.h"

ActivationState gH263PluginState = ACTIVATION_UNREGISTERED;

extern "C" {
	
ActivationState GetH263PluginActivationState()
{
	if (gH263PluginState == ACTIVATION_UNREGISTERED)
		RestoreH263ActivationState();
	return gH263PluginState;
}

int StartH263Activation(int dwSize, char * szKey)
{
	if ((dwSize == 0) || (!szKey))
		return 0;
	gH263PluginState = ACTIVATION_PENDING;
	return 1;

}

ActivationState RestoreH263ActivationState()
{ 
	return ACTIVATION_UNREGISTERED;
}

void SaveH263ActivationState(){}

};