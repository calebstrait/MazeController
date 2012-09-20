#include "cbw.h"
#include <stdio.h>
#include <conio.h>

main (int argc, char *argv[]) {
	int boardNum = 0;
	int portNum = FIRSTPORTA;
	int portDirection = DIGITALOUT;
	float revLevel = (float) CURRENTREVNUM;
	int ULStatus;
	
	// Declare a UL revision level.
	ULStatus = cbDeclareRevision(&revLevel);
	
	// Initiate error handling.
	cbErrHandling(PRINTALL, DONTSTOP);
	
	// Configure port.
	ULStatus = cbDConfigPort(boardNum, portNum, portDirection);
}