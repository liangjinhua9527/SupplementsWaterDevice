#include "delay.h";

/*====================================================
*������:DELAY_1MS,DELAY_MS
*����:��ʱ����
*�������:��
*���ز���:��
====================================================*/
void DELAY_1MS(void)
{
	unsigned char a;

	for(a=0;a<250;a++)
	{
		CLRWDT();
	}
}

void DELAY_MS(unsigned int Time)
{
	unsigned int a;

	for(a=0;a<Time;a++)
	{
		DELAY_1MS();
	}
}
