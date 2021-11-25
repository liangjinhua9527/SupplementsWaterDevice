/**********************************************************
*器件型号:MS83F1602
*振荡器:内部RC 4MHz 4T
*MS83F1602 SOP16
**********************************************************/
#include "syscfg.h";
#include "MS83Fxx02.h";
#include "delay.h";
#include "time.h";
#include "led.h";
#include "sleep.h";
#include "pwm.h";
#include "key.h"
#include "io.h"

/*====================================================
*函数名:main
*功能:主函数
*输入参数:无
*返回参数:无
====================================================*/
void main(void)
{
	DEVICE_INIT();   		  //器件初始化
	PWM_INIT();      		  //PWM初始化
    IOCA1_INIT();			//唤醒初始化
	TIMER1_INIT();			//定时器初始化
	ENABLE_INTERRUPT();		//中断
	while(1)
	{
         CLRWDT();
         sleep_open();
		 if( keyFlag == KEY_SHORT_TRIGGER){ //判断15ms按键按下,进入按键处理函数
         keyFunc();
		}  
	}
}

       