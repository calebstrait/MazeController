#include "cbw.h"
#include "mex.h"

#define BOARDNUM  0
#define DIRECTION DIGITALOUT
#define PORTA     FIRSTPORTA
#define PORTB     FIRSTPORTB
#define PORTC     FIRSTPORTC

void mexFunction(int nlhs, mxArray *plhs[],
				 int nrhs, const mxArray *prhs[]) {
		int ULStatusA, ULStatusB, ULStatusC;
		
		// Configure FIRSTPORTA and FIRSTPORTB for digital output.
		ULStatusA = cbDConfigPort(BOARDNUM, PORTA, DIRECTION);
		ULStatusB = cbDConfigPort(BOARDNUM, PORTB, DIRECTION);
		ULStatusC = cbDConfigPort(BOARDNUM, PORTC, DIRECTION);
}