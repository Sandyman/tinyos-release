#include "hardware.h"

configuration PlatformC {
	provides {
		interface Init;
		interface Atm128Calibrate;
	}
	uses interface Init as SubInit;
}

implementation {
	components PlatformP, MotePlatformC, MeasureClockC;

	Init = PlatformP;
	Atm128Calibrate = MeasureClockC;

	PlatformP.MoteInit -> MotePlatformC;
	MotePlatformC.SubInit = SubInit;
}

