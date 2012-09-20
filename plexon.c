#include "cbw.h"
#include <windows.h>

main (int argc, char *argv[]) {
	WORD eventVal = (WORD) atoi(argv[1]);
	int boardNum = 0;
	int ULStatus = 0;
	int portNum, portDirection;
	float revLevel = (float) CURRENTREVNUM;
	
	// Declare a UL revision level.
	ULStatus = cbDeclareRevision(&revLevel);
	
	// Initiate error handling.
	cbErrHandling(PRINTALL, DONTSTOP);
	
	// Configure port.
	portNum = FIRSTPORTA;
	portDirection = DIGITALOUT;
	ULStatus = cbDConfigPort(boardNum, portNum, portDirection);
	
	// Send data to port.
	ULStatus = cbDOut(boardNum, portNum, eventVal);
}