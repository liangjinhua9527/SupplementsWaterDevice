#include "pwm.h";

/*====================================================
*函数名:PWM_INIT
*功能:PWM模块初始化
*输入参数:无
*返回参数:无
====================================================*/
void PWM_INIT(void)
{
	TRISC2 = 1;
    PWM5CR0 = 0b00000010;  //PWM周期4位长度
	PWM5CR1 = 0b10000000;
	T5CKDIV = 9;
	TMR5H = 0;
	TMR5L = 0;
	PR5L = 8;
	TMR5IF = 0;
	TRISC2 = 0;
}

//开启PWM5
void SET_PWM5_ON(void)
{
    PWM5CR1 = 0b10000000;   //开启PWM模式
	TMR5ON = 1;
	while(TMR5IF==0)   CLRWDT();
}

//关闭PWM5
void SET_PWM5_OFF(void)
{
	TMR5ON = 0;
    PWM5CR1 = 0b00000000;  //关闭PWM模式
}


/******************************
要PWM3工作于PWM3模式必须设置以下3位:
PWM3CR0寄存器的Bit7(P3INTS)置0,TMR3计数溢出
PWM3CR0寄存器的Bit0(P3BZR)置0,PWM3模块工作于PWM3模式
PWM3CR1寄存器的Bit7(P3EN)置1,工作于PWM/BUZZER模式
设置完PWM模式必备的位之后,开始设置PWM的周期相关寄存器:
1.Timer3的预分频比PWM3CR1寄存器的Bit3~Bit5(公式中的TMR3PS)
2.Timer3的位数PWM3CR0寄存器的Bit4~Bit6(公式中的2Nbit)
3.Timer3时钟源.PWM3CR0寄存器的Bit1~Bit3
4.Timer3时钟源的分频比.T3CKDIV寄存器
第3点和第4点结合可以算出公式中的TP3CK的值
5.PR3的值,即PR3H:PR3L的值(该值最多位为12位).PR3H在TMR3H寄存器的Bit0~Bit3。
PR3的位数是有Timer3的位数决定,即第2点中设置Timer3位数为多少,PR3的位数就为多少。
比如Timer3设置为8位,则PR3为8位。此时PR3最大值为255。

周期计算:
P3PER[2:0]=011   >>>  Nbit = 8;
P3CKSRC[2:0]=001 >>>  P3CK = 1/16MHz = 1/16000000
T3CKDIV = 7;
Tp3ck = (7+1)/16000000) = 0.5us
TMR3PS[2:0]=000  >>>  TMR3PS = 0;
因此周期为:
Tperiod = (2^0)*(2^8)*0.5us = 128us

脉宽计算:
Tduty = (2^0)*128*0.5us=64us

占空比计算:
Duty = Tduty/Tperiod = 64us/128us = 0.5 = 50%

因为PWM3设置为8位，所以PR3最大为255，所以PR3H恒为0
PWM3模块的始终是经过2个分频器分频：
1.T3CKDIV将PWM3的时钟源进行分频,分频比1至256可调
2.PWM3CR1的TMR3PS[2:0]将Timer3分频

PWM模块设置开启后，只要改变PRx就可以改变它的占空比

如需将PWM设置为恒输出为高电平或者恒输出为低电平，可将
PWM模块关闭(PWMxCR0=0和PWMxCR1=0),然后把IO设置为高/低电平
也可以不关闭PWM模块，设置PWMxCR0的Bit1~Bit3位，设置

==============================*/