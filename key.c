#include "key.h"

unsigned char keyPressCnt = 0,deviceSeepCnt = 0,keyFlag=0,deviceStatus = 0,Temp_Read;
/*====================================================
*������:interrupt ISR
*����:�жϷ�����
*�������:��
*���ز���:��
====================================================*/
void interrupt ISR(void)
{
	if(PAIE&&PAIF)
	{
		Temp_Read = PORTA; //����жϱ�־֮ǰ,��Ҫ��һ��IO���ʧ��״̬
		PAIF = 0;          //���־λ
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
*������:keyFunc
*����:����������
*�������:��
*���ز���:��
====================================================*/
void keyFunc(void)
{
    TMR1ON = 0;  		//��ʱ��1��?
    TMR1IE = 0;				//ʹ��TIMER1�ж�
	if(deviceStatus == DEVICE_STOP){
		 RA6 = 1;   				   //LED��
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
		 SET_PWM5_OFF();    // ֹͣPWM5
         deviceSeepCnt = 0;
		 RC2= 0;   				    //PWM������
         RA6 = 0;   					 //LED��
	}
    keyFlag = KEY_LONG_TRIGGER;
    TMR1ON = 1;  		//��ʱ��1����
    TMR1IE = 1;				//ʹ��TIMER1�ж�
}
