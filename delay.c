#include "delay.h";

/*====================================================
*函数名:DELAY_1MS,DELAY_MS
*功能:延时函数
*输入参数:无
*返回参数:无
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
