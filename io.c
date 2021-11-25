#include "io.h"

/*====================================================
*函数名:DEVICE_INIT
*功能:上电器件初始化
*说明:
*PC2作为PWM5
*PA6 = LED ,输出模式
*KEY2 = PC3 , 输入检测
*KEY1 = PC4 ,输出模式
*PA1唤醒mcu
*输入参数:无
*返回参数:无
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01010001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器
                            
	MSCKCON = 0B00000000;//Bit6 >>> VREG_OE=0 >>> 禁止稳压输出
											//Bit5 >>> T2CKSRC=0 >>> Timer2 时钟源为系统时钟
											//Bit4 >>> SLVREN=0 >>> 关闭 LVR
    
	INTCON = 0B00000000;	//暂禁止所有中断

	CMCON0 = 0B00000111;	//关闭比较器，CxIN为数字IO口
	ANSEL = 0B00000000;		//关闭所有模拟口

	PORTA = 0B00000000;
	TRISA = 0B10111111;		//PA输入输出 0-输出 1-输入
	WPUA = 0B10111111;		//PA端口上拉控制 1-开上拉 0-关上拉

	PORTC = 0B00000000;
	TRISC = 0B11101111;		//PC输入输出 0-输出 1-输入 
	WPUC = 0B11111011;		//PC端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
   
    RA6 = 0;
    RC4 = 1;
}
