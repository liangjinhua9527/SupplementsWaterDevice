#ifndef   __KEY_H__
#define  __KEY_H__

#include "syscfg.h";
#include "MS83Fxx02.h";
#include "led.h";
#include "pwm.h";

#define DEVICE_STOP		   		 0
#define DEVICE_ONEWORK  	 	 1
#define DEVICE_TWOWORK  	 2
#define	KEY_TRIGGER	 			 0
#define	KEY_SHORT_TRIGGER	 1
#define	KEY_LONG_TRIGGER	 2

extern unsigned char Temp_Read;
extern unsigned char keyPressCnt;
extern unsigned char deviceSeepCnt;
extern unsigned char keyFlag;
extern unsigned char deviceStatus;

void keyFunc(void);

#endif