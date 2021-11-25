/**********************************************************
*�����ͺ�:MS83F1602
*����:�ڲ�RC 4MHz 4T
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
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/
void main(void)
{
	DEVICE_INIT();   		  //������ʼ��
	PWM_INIT();      		  //PWM��ʼ��
    IOCA1_INIT();			//���ѳ�ʼ��
	TIMER1_INIT();			//��ʱ����ʼ��
	ENABLE_INTERRUPT();		//�ж�
	while(1)
	{
         CLRWDT();
         sleep_open();
		 if( keyFlag == KEY_SHORT_TRIGGER){ //�ж�15ms��������,���밴��������
         keyFunc();
		}  
	}
}

       