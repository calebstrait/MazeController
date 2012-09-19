// TODO: Add any needed headers.
#include "cbw.h"
#include "mex.h"
#include <stdlib.h>

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

/*
**  LTOSTR.C -- routine and example program to convert a long int to
**  the specified numeric base, from 2 to 36.
**
**  Written by Thad Smith III, Boulder, CO. USA  9/06/91 
**  and contributed to the Public Domain.
**
**  Modified by Aaron Roth in Rochester, NY on September 19, 2012.
**  This modified version takes a base 10 number and 
**  outputs it in base 2.
**
*/

char *                  /* addr of terminating null */
ltostr (
    char *str,          /* output string */
    long val,           /* value to be converted */
    unsigned base)      /* conversion base       */
{
    ldiv_t r;           /* result of val / base */

    if (base > 36)      /* no conversion if wrong base */
    {
        str = '\0';
        return str;
    }
    if (val < 0)    *str++ = '-';
    r = ldiv (labs(val), base);

    /* output digits of val/base first */

    if (r.quot > 0)  str = ltostr (str, r.quot, base);

    /* output last digit */

    *str++ = "0123456789abcdefghijklmnopqrstuvwxyz"[(int)r.rem];
    *str   = '\0';
    return str;
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// TODO: Implement this function.
void prepare_event_values(double event, int *eventValA, int *eventValB) {
    // Note: The result buffer is only big enough for 17 chars,
	// which represent 16 "bits" plus the "\0" char.
    char buffer[17], *tail;
	char subBufferA[9], subBufferB[9];
    long int value, subNumA, subNumB;
    int inbase = 10;
	int outbase = 2;
	int i;
	
	value = strtol("65520", &tail, inbase);
    ltostr(buffer, value, outbase);
	
	// Fill a small char buffer with the first half of the total buffer.
	for (i = 0; i < 8; i++) {
		subBufferA[i] = buffer[i];
	}
	subBufferA[8] = '\0';
	
	// Fill a small char buffer with the second half of the total buffer.
	for (i = 8; i < 16; i++) {
		subBufferB[i - 8] = buffer[i];
	}
	subBufferB[8] = '\0';
	
	// Convert sub binary strings to ints.
	subNumA = strtol(subBufferA, NULL, 2);
	subNumB = strtol(subBufferB, NULL, 2);
	
	printf("binary: %d\n", buffer);
	printf("subA: %d\n", subNumA);
	printf("subB: %d\n", subNumA);
}

void send_event(double event) {
	int boardNum = 0;
	int eventValA, eventValB;
	int portDirection = DIGITALOUT;
	int portNumA = FIRSTPORTA;
	int portNumB = FIRSTPORTB;
	int ULStatusA = 0;
	int ULStatusB = 0;
	
	if (event > 255) {
		prepare_event_values(event, &eventValA, &eventValB);
		/*
		// Configure FIRSTPORTA and FIRSTPORTB for digital output.
		ULStatusA = cbDConfigPort(boardNum, portNumA, portDirection);
		ULStatusB = cbDConfigPort(boardNum, portNumB, portDirection);
		
		// Send event value via FIRSTPORTA and FIRSTPORTB.
		ULStatusA = cbDout(boardNum, portNumA, eventValA);
		ULStatusB = cbDout(boardNum, portNumB, eventValB);
		*/
	} else {
		eventValA = event;
		/*
		// Configure FIRSTPORTA for digital output.
		ULStatusA = cbDConfigPort(boardNum, portNumA, portDirection);
		
		// Send event value via FIRSTPORTA.
		ULStatusA = cbDout(boardNum, portNumA, eventValA);
		*/
	}
}

void mexFunction(int nlhs, mxArray *plhs[],
				 int nrhs, const mxArray *prhs[]) {
	double eventNum = *mxGetPr(prhs[0]);
	
	// Arugment checking. TODO: Check to make sure value is a double.
	if (nrhs == 1) {
		send_event(eventNum);
	} else {
		mexErrMsgTxt("There must be exactly two arguments.");
	}
}