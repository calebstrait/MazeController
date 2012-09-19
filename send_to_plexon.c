#include "cbw.h"
#include "mex.h"
#include <stdlib.h>

#define BASE 2
#define BOARDNUM 0
#define BYTE 8
#define DIRECTION DIGITALOUT
#define DOUBLEBYTE 16
#define PORTA FIRSTPORTA
#define PORTB FIRSTPORTB

#ifndef USHORT
  typedef unsigned short USHORT;
#endif

void prepare_event_values(int eventNum, USHORT *eventValA, USHORT *eventValB) {
    // Note: The result buffer is only big enough for 17 chars,
	// which represent 16 "bits" plus the "\0" char.
	char buffer[DOUBLEBYTE + 1];
	char subBufferA[BYTE + 1], subBufferB[BYTE + 1];
	int i;
	
	// Convert integer event number to a binary string representation.
	memset(buffer, '\0', DOUBLEBYTE + 1);
	itoa(eventNum, buffer, BASE);
	
	// Fill a small char buffer with the first half of the total buffer.
	for (i = 0; i < BYTE; i++) {
		subBufferA[i] = buffer[i];
	}
	subBufferA[BYTE] = '\0';
	
	// Fill a small char buffer with the second half of the total buffer.
	for (i = BYTE; i < DOUBLEBYTE; i++) {
		subBufferB[i - BYTE] = buffer[i];
	}
	subBufferB[BYTE] = '\0';
	
	// Convert sub binary strings to ints.
	*eventValA = (USHORT) strtol(subBufferA, NULL, BASE);
	*eventValB = (USHORT) strtol(subBufferB, NULL, BASE);
}

void send_event(int event) {
	USHORT eventValA, eventValB;
	int *valAPtr = &eventValA;
	int *valBPtr = &eventValB;
	int ULStatusA, ULStatusB;
	
	if (event > 255) {
		prepare_event_values(event, valAPtr, valBPtr);
		
		// Configure FIRSTPORTA and FIRSTPORTB for digital output.
		ULStatusA = cbDConfigPort(BOARDNUM, PORTA, DIRECTION);
		ULStatusB = cbDConfigPort(BOARDNUM, PORTB, DIRECTION);
		
		// Send event value via FIRSTPORTA and FIRSTPORTB.
		ULStatusA = cbDout(BOARDNUM, PORTA, eventValA);
		ULStatusB = cbDout(BOARDNUM, PORTB, eventValB);
	} else {
		eventValA = event;
		
		// Configure FIRSTPORTA for digital output.
		ULStatusA = cbDConfigPort(BOARDNUM, PORTA, DIRECTION);
		
		// Send event value via FIRSTPORTA.
		ULStatusA = cbDout(BOARDNUM, PORTA, eventValA);
	}
}

void mexFunction(int nlhs, mxArray *plhs[],
				 int nrhs, const mxArray *prhs[]) {
	int eventNum = *mxGetPr(prhs[0]);
	
	// Arugment checking. TODO: Check to make sure value is an int.
	if (nrhs == 1) {
		if (eventNum >= 0 && eventNum <= 65535) {
			send_event(eventNum);
		} else {
			mexErrMsgTxt("The value sent to Plexon must be in the "
			             "range 0 (inclusive) to 65535 (inclusive).");
		}
	} else {
		mexErrMsgTxt("There must be exactly one arguments.");
	}
}