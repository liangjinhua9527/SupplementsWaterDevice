#include "key.h"

unsigned char keyPressCnt = 0,deviceSeepCnt = 0,keyFlag=0,deviceStatus = 0,Temp_Read;
/*====================================================
*函数名:interrupt ISR
*功能:中断服务函数
*输入参数:无
*返回参数:无
====================================================*/
void interrupt ISR(void)
{
	if(PAIE&&PAIF)
	{
		Temp_Read = PORTA; //清此中断标志之前,需要读一次IO清除失配状态
		PAIF = 0;          //清标志位
	}
		
	if(TMR1IE&&TMR1IF)
	{
         if(RA1 == 0)    
        {
             deviceSeepCnt = 0;
             if(keyPressCnt <= 10) 	            keyPressCnt++; 
             if(keyPressCnt == 6&&keyFlag == KEY_TRIGGER)		 keyFlag = KEY_SHORT_TRIGGER;

		}
        else if(RA1 == 1)    {        
			keyPressCnt = 0;
            keyFlag = KEY_TRIGGER;
           if(deviceStatus == DEVICE_STOP)				deviceSeepCnt++;
		}
        TMR1IF = 0;
		TMR1H = 0xF6;
  		TMR1L = 0x3B;
    }
}

/*====================================================
*函数名:keyFunc
*功能:按键处理函数
*输入参数:无
*返回参数:无
====================================================*/
void keyFunc(void)
{
    TMR1ON = 0;  		//定时器1际?
    TMR1IE = 0;				//使能TIMER1中断
	if(deviceStatus == DEVICE_STOP){
		 RA6 = 1;   				   //LED灯
         T5CKDIV = 9;
		 SET_PWM5_ON();
         deviceStatus = DEVICE_ONEWORK;
	}
   else if(deviceStatus == DEVICE_ONEWORK){
		 led_flash();
         T5CKDIV = 8;
         SET_PWM5_ON();
         deviceStatus = DEVICE_TWOWORK;
	}
   else if(deviceStatus == DEVICE_TWOWORK){
		 deviceStatus =DEVICE_STOP;
		 SET_PWM5_OFF();    // 停止PWM5
         deviceSeepCnt = 0;
		 RC2= 0;   				    //PWM脚拉低
         RA6 = 0;   					 //LED灯
	}
    keyFlag = KEY_LONG_TRIGGER;
    TMR1ON = 1;  		//定时器1计数
    TMR1IE = 1;				//使能TIMER1中断
}
