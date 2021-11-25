//Deviec:MS83Fxx02
//-----------------------Variable---------------------------------
		_keyPressCnt		EQU		7AH
		_deviceSeepCnt		EQU		77H
		_keyFlag		EQU		79H
		_deviceStatus		EQU		78H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	0BH 			//0009 	380B
		LJUMP 	10DH 			//000A 	390D

		//;key.c: 12: if(PAIE&&PAIF)
		BTSC 	INTCON,3 		//000B 	158B
		ORG		000CH
		BTSS 	INTCON,0 		//000C 	1C0B
		LJUMP 	12H 			//000D 	3812

		//;key.c: 13: {
		//;key.c: 14: Temp_Read = PORTA;
		BCR 	STATUS,5 		//000E 	1283
		BCR 	STATUS,6 		//000F 	1303
		LDR 	5H,0 			//0010 	0805

		//;key.c: 15: PAIF = 0;
		BCR 	INTCON,0 		//0011 	100B

		//;key.c: 16: }
		//;key.c: 18: if(TMR1IE&&TMR1IF)
		BSR 	STATUS,5 		//0012 	1A83
		BCR 	STATUS,6 		//0013 	1303
		ORG		0014H
		BTSS 	CH,0 			//0014 	1C0C
		LJUMP 	36H 			//0015 	3836
		BCR 	STATUS,5 		//0016 	1283
		BTSS 	CH,0 			//0017 	1C0C
		LJUMP 	36H 			//0018 	3836

		//;key.c: 19: {
		//;key.c: 20: if(RA1 == 0)
		BTSC 	5H,1 			//0019 	1485
		LJUMP 	2AH 			//001A 	382A
		LDWI 	BH 			//001B 	2A0B
		ORG		001CH

		//;key.c: 21: {
		//;key.c: 22: deviceSeepCnt = 0;
		CLRR 	77H 			//001C 	0177

		//;key.c: 23: if(keyPressCnt <= 10) keyPressCnt++;
		SUBWR 	7AH,0 			//001D 	0C7A
		BTSS 	STATUS,0 		//001E 	1C03
		INCR	7AH,1 			//001F 	09FA

		//;key.c: 24: if(keyPressCnt == 6&&keyFlag == 0) keyFlag = 1;
		LDR 	7AH,0 			//0020 	087A
		XORWI 	6H 			//0021 	2606
		BTSS 	STATUS,2 		//0022 	1D03
		LJUMP 	31H 			//0023 	3831
		ORG		0024H
		LDR 	79H,1 			//0024 	08F9
		BTSS 	STATUS,2 		//0025 	1D03
		LJUMP 	31H 			//0026 	3831
		CLRR 	79H 			//0027 	0179
		INCR	79H,1 			//0028 	09F9
		LJUMP 	31H 			//0029 	3831

		//;key.c: 27: else if(RA1 == 1) {
		BTSS 	5H,1 			//002A 	1C85
		LJUMP 	31H 			//002B 	3831
		ORG		002CH

		//;key.c: 28: keyPressCnt = 0;
		CLRR 	7AH 			//002C 	017A

		//;key.c: 29: keyFlag = 0;
		CLRR 	79H 			//002D 	0179

		//;key.c: 30: if(deviceStatus == 0) deviceSeepCnt++;
		LDR 	78H,1 			//002E 	08F8
		BTSC 	STATUS,2 		//002F 	1503
		INCR	77H,1 			//0030 	09F7
		LDWI 	F6H 			//0031 	2AF6

		//;key.c: 31: }
		//;key.c: 32: TMR1IF = 0;
		BCR 	CH,0 			//0032 	100C

		//;key.c: 33: TMR1H = 0xF6;
		STR 	FH 			//0033 	018F
		ORG		0034H

		//;key.c: 34: TMR1L = 0x3B;
		LDWI 	3BH 			//0034 	2A3B
		STR 	EH 			//0035 	018E
		LDR 	71H,0 			//0036 	0871
		STR 	PCLATH 			//0037 	018A
		SWAPR 	70H,0 			//0038 	0770
		STR 	STATUS 			//0039 	0183
		SWAPR 	7EH,1 			//003A 	07FE
		SWAPR 	7EH,0 			//003B 	077E
		ORG		003CH
		RETI		 			//003C 	0009

		//;key.c: 46: TMR1ON = 0;
		BCR 	STATUS,5 		//003D 	1283
		BCR 	STATUS,6 		//003E 	1303
		BCR 	10H,0 			//003F 	1010

		//;key.c: 47: TMR1IE = 0;
		BSR 	STATUS,5 		//0040 	1A83
		BCR 	CH,0 			//0041 	100C

		//;key.c: 48: if(deviceStatus == 0){
		LDR 	78H,1 			//0042 	08F8
		BTSS 	STATUS,2 		//0043 	1D03
		ORG		0044H
		LJUMP 	4EH 			//0044 	384E
		LDWI 	9H 			//0045 	2A09

		//;key.c: 49: RA6 = 1;
		BCR 	STATUS,5 		//0046 	1283
		BSR 	5H,6 			//0047 	1B05

		//;key.c: 50: T5CKDIV = 9;
		BSR 	STATUS,6 		//0048 	1B03
		STR 	1DH 			//0049 	019D

		//;key.c: 51: SET_PWM5_ON();
		LCALL 	EDH 			//004A 	30ED

		//;key.c: 52: deviceStatus = 1;
		CLRR 	78H 			//004B 	0178
		ORG		004CH
		INCR	78H,1 			//004C 	09F8

		//;key.c: 53: }
		LJUMP 	63H 			//004D 	3863

		//;key.c: 54: else if(deviceStatus == 1){
		DECR 	78H,0 			//004E 	0D78
		BTSS 	STATUS,2 		//004F 	1D03
		LJUMP 	59H 			//0050 	3859

		//;key.c: 55: led_flash();
		LCALL 	D9H 			//0051 	30D9

		//;key.c: 56: T5CKDIV = 8;
		LDWI 	8H 			//0052 	2A08
		BSR 	STATUS,6 		//0053 	1B03
		ORG		0054H
		STR 	1DH 			//0054 	019D

		//;key.c: 57: SET_PWM5_ON();
		LCALL 	EDH 			//0055 	30ED

		//;key.c: 58: deviceStatus = 2;
		LDWI 	2H 			//0056 	2A02
		STR 	78H 			//0057 	01F8

		//;key.c: 59: }
		LJUMP 	63H 			//0058 	3863

		//;key.c: 60: else if(deviceStatus == 2){
		LDR 	78H,0 			//0059 	0878
		XORWI 	2H 			//005A 	2602
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	63H 			//005C 	3863

		//;key.c: 61: deviceStatus =0;
		CLRR 	78H 			//005D 	0178

		//;key.c: 62: SET_PWM5_OFF();
		LCALL 	119H 			//005E 	3119

		//;key.c: 63: deviceSeepCnt = 0;
		CLRR 	77H 			//005F 	0177

		//;key.c: 64: RC2= 0;
		BCR 	STATUS,6 		//0060 	1303
		BCR 	7H,2 			//0061 	1107

		//;key.c: 65: RA6 = 0;
		BCR 	5H,6 			//0062 	1305

		//;key.c: 66: }
		//;key.c: 67: keyFlag = 2;
		LDWI 	2H 			//0063 	2A02
		ORG		0064H
		STR 	79H 			//0064 	01F9

		//;key.c: 68: TMR1ON = 1;
		BCR 	STATUS,5 		//0065 	1283
		BCR 	STATUS,6 		//0066 	1303
		BSR 	10H,0 			//0067 	1810

		//;key.c: 69: TMR1IE = 1;
		BSR 	STATUS,5 		//0068 	1A83
		BSR 	CH,0 			//0069 	180C
		RET		 					//006A 	0004

		//;sleep.c: 25: GIE = 0;
		BCR 	INTCON,7 		//006B 	138B
		ORG		006CH

		//;sleep.c: 26: ADON = 0;
		BCR 	STATUS,5 		//006C 	1283
		BCR 	STATUS,6 		//006D 	1303
		BCR 	1FH,0 			//006E 	101F
		CLRWDT	 			//006F 	0001

		//;sleep.c: 28: TMR1ON = 0;
		BCR 	STATUS,5 		//0070 	1283
		BCR 	STATUS,6 		//0071 	1303
		BCR 	10H,0 			//0072 	1010

		//;sleep.c: 29: TMR1IE = 0;
		BSR 	STATUS,5 		//0073 	1A83
		ORG		0074H
		BCR 	CH,0 			//0074 	100C

		//;sleep.c: 30: SWDTEN = 0;
		BCR 	STATUS,5 		//0075 	1283
		BCR 	18H,0 			//0076 	1018

		//;sleep.c: 34: SLVREN = 0;
		BCR 	1BH,4 			//0077 	121B

		//;sleep.c: 38: IOCA1 = 1;
		BSR 	STATUS,5 		//0078 	1A83
		BSR 	16H,1 			//0079 	1896

		//;sleep.c: 39: Temp_Read = PORTA;
		BCR 	STATUS,5 		//007A 	1283
		LDR 	5H,0 			//007B 	0805
		ORG		007CH

		//;sleep.c: 40: PAIF = 0;
		BCR 	INTCON,0 		//007C 	100B

		//;sleep.c: 41: PAIE = 1;
		BSR 	INTCON,3 		//007D 	198B
		SLEEP	 			//007E 	0002

		//;sleep.c: 43: _nop();
		NOP		 					//007F 	0000

		//;sleep.c: 44: PAIE = 0;
		BCR 	INTCON,3 		//0080 	118B

		//;sleep.c: 45: Temp_Read = PORTA;
		BCR 	STATUS,5 		//0081 	1283
		BCR 	STATUS,6 		//0082 	1303
		LDR 	5H,0 			//0083 	0805
		ORG		0084H

		//;sleep.c: 46: PAIF = 0;
		BCR 	INTCON,0 		//0084 	100B

		//;sleep.c: 47: SWDTEN = 1;
		BSR 	18H,0 			//0085 	1818

		//;sleep.c: 48: SLVREN = 1;
		BSR 	1BH,4 			//0086 	1A1B
		CLRWDT	 			//0087 	0001

		//;sleep.c: 50: TMR1ON = 1;
		BCR 	STATUS,5 		//0088 	1283
		BCR 	STATUS,6 		//0089 	1303
		BSR 	10H,0 			//008A 	1810

		//;sleep.c: 51: TMR1IE = 1;
		BSR 	STATUS,5 		//008B 	1A83
		ORG		008CH
		BSR 	CH,0 			//008C 	180C

		//;sleep.c: 52: GIE = 1;
		BSR 	INTCON,7 		//008D 	1B8B
		RET		 					//008E 	0004

		//;io.c: 17: OSCCON = 0B01010001;
		LDWI 	51H 			//008F 	2A51
		BSR 	STATUS,5 		//0090 	1A83
		STR 	FH 			//0091 	018F

		//;io.c: 21: MSCKCON = 0B00000000;
		BCR 	STATUS,5 		//0092 	1283
		CLRR 	1BH 			//0093 	011B
		ORG		0094H

		//;io.c: 25: INTCON = 0B00000000;
		CLRR 	INTCON 			//0094 	010B

		//;io.c: 27: CMCON0 = 0B00000111;
		LDWI 	7H 			//0095 	2A07
		STR 	19H 			//0096 	0199

		//;io.c: 28: ANSEL = 0B00000000;
		BSR 	STATUS,5 		//0097 	1A83
		CLRR 	11H 			//0098 	0111

		//;io.c: 30: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0099 	1283
		CLRR 	5H 			//009A 	0105

		//;io.c: 31: TRISA = 0B10111111;
		LDWI 	BFH 			//009B 	2ABF
		ORG		009CH
		BSR 	STATUS,5 		//009C 	1A83
		STR 	5H 			//009D 	0185

		//;io.c: 32: WPUA = 0B10111111;
		STR 	15H 			//009E 	0195

		//;io.c: 34: PORTC = 0B00000000;
		BCR 	STATUS,5 		//009F 	1283
		CLRR 	7H 			//00A0 	0107

		//;io.c: 35: TRISC = 0B11101111;
		LDWI 	EFH 			//00A1 	2AEF
		BSR 	STATUS,5 		//00A2 	1A83
		STR 	7H 			//00A3 	0187
		ORG		00A4H

		//;io.c: 36: WPUC = 0B11111011;
		LDWI 	FBH 			//00A4 	2AFB
		STR 	8H 			//00A5 	0188

		//;io.c: 38: OPTION = 0B00001000;
		LDWI 	8H 			//00A6 	2A08
		STR 	1H 			//00A7 	0181

		//;io.c: 40: RA6 = 0;
		BCR 	STATUS,5 		//00A8 	1283
		BCR 	5H,6 			//00A9 	1305

		//;io.c: 41: RC4 = 1;
		BSR 	7H,4 			//00AA 	1A07
		RET		 					//00AB 	0004
		ORG		00ACH
		LDWI 	2H 			//00AC 	2A02

		//;pwm.c: 11: TRISC2 = 1;
		BSR 	STATUS,5 		//00AD 	1A83
		BSR 	7H,2 			//00AE 	1907

		//;pwm.c: 12: PWM5CR0 = 0b00000010;
		BCR 	STATUS,5 		//00AF 	1283
		BSR 	STATUS,6 		//00B0 	1B03
		STR 	1BH 			//00B1 	019B

		//;pwm.c: 13: PWM5CR1 = 0b10000000;
		LDWI 	80H 			//00B2 	2A80
		STR 	1CH 			//00B3 	019C
		ORG		00B4H

		//;pwm.c: 14: T5CKDIV = 9;
		LDWI 	9H 			//00B4 	2A09
		STR 	1DH 			//00B5 	019D

		//;pwm.c: 15: TMR5H = 0;
		CLRR 	19H 			//00B6 	0119

		//;pwm.c: 16: TMR5L = 0;
		CLRR 	18H 			//00B7 	0118

		//;pwm.c: 17: PR5L = 8;
		LDWI 	8H 			//00B8 	2A08
		STR 	1AH 			//00B9 	019A

		//;pwm.c: 18: TMR5IF = 0;
		BCR 	1CH,0 			//00BA 	101C

		//;pwm.c: 19: TRISC2 = 0;
		BSR 	STATUS,5 		//00BB 	1A83
		ORG		00BCH
		BCR 	STATUS,6 		//00BC 	1303
		BCR 	7H,2 			//00BD 	1107
		RET		 					//00BE 	0004

		//;delay.c: 21: unsigned int a;
		//;delay.c: 23: for(a=0;a<Time;a++)
		CLRR 	75H 			//00BF 	0175
		CLRR 	76H 			//00C0 	0176
		LDR 	74H,0 			//00C1 	0874
		SUBWR 	76H,0 			//00C2 	0C76
		BTSS 	STATUS,2 		//00C3 	1D03
		ORG		00C4H
		LJUMP 	C7H 			//00C4 	38C7
		LDR 	73H,0 			//00C5 	0873
		SUBWR 	75H,0 			//00C6 	0C75
		BTSC 	STATUS,0 		//00C7 	1403
		RET		 					//00C8 	0004

		//;delay.c: 24: {
		//;delay.c: 25: DELAY_1MS();
		LCALL 	FEH 			//00C9 	30FE
		INCR	75H,1 			//00CA 	09F5
		BTSC 	STATUS,2 		//00CB 	1503
		ORG		00CCH
		INCR	76H,1 			//00CC 	09F6
		LJUMP 	C1H 			//00CD 	38C1

		//;main.c: 24: DEVICE_INIT();
		LCALL 	8FH 			//00CE 	308F

		//;main.c: 25: PWM_INIT();
		LCALL 	ACH 			//00CF 	30AC

		//;main.c: 26: IOCA1_INIT();
		LCALL 	113H 			//00D0 	3113

		//;main.c: 27: TIMER1_INIT();
		LCALL 	106H 			//00D1 	3106

		//;main.c: 28: ENABLE_INTERRUPT();
		LCALL 	F6H 			//00D2 	30F6
		CLRWDT	 			//00D3 	0001
		ORG		00D4H

		//;main.c: 32: sleep_open();
		LCALL 	E4H 			//00D4 	30E4

		//;main.c: 33: if( keyFlag == 1){
		DECRSZ 	79H,0 		//00D5 	0E79
		LJUMP 	D3H 			//00D6 	38D3

		//;main.c: 34: keyFunc();
		LCALL 	3DH 			//00D7 	303D
		LJUMP 	D3H 			//00D8 	38D3
		LDWI 	F4H 			//00D9 	2AF4

		//;led.c: 7: RA6 = 0;
		BCR 	STATUS,5 		//00DA 	1283
		BCR 	5H,6 			//00DB 	1305
		ORG		00DCH

		//;led.c: 8: DELAY_MS(500);
		STR 	73H 			//00DC 	01F3
		LDWI 	1H 			//00DD 	2A01
		STR 	74H 			//00DE 	01F4
		LCALL 	BFH 			//00DF 	30BF

		//;led.c: 9: RA6 = 1;
		BCR 	STATUS,5 		//00E0 	1283
		BCR 	STATUS,6 		//00E1 	1303
		BSR 	5H,6 			//00E2 	1B05
		RET		 					//00E3 	0004
		ORG		00E4H

		//;sleep.c: 63: if(deviceStatus == 0){
		LDR 	78H,1 			//00E4 	08F8
		BTSS 	STATUS,2 		//00E5 	1D03
		RET		 					//00E6 	0004

		//;sleep.c: 64: if(deviceSeepCnt >= 200){
		LDWI 	C8H 			//00E7 	2AC8
		SUBWR 	77H,0 			//00E8 	0C77
		BTSS 	STATUS,0 		//00E9 	1C03
		RET		 					//00EA 	0004

		//;sleep.c: 65: deviceSeepCnt = 0;
		CLRR 	77H 			//00EB 	0177
		ORG		00ECH

		//;sleep.c: 66: sleep_init();
		LJUMP 	6BH 			//00EC 	386B

		//;pwm.c: 25: PWM5CR1 = 0b10000000;
		LDWI 	80H 			//00ED 	2A80
		STR 	1CH 			//00EE 	019C

		//;pwm.c: 26: TMR5ON = 1;
		BSR 	1CH,2 			//00EF 	191C

		//;pwm.c: 27: while(TMR5IF==0) asm("clrwdt");
		BCR 	STATUS,5 		//00F0 	1283
		BSR 	STATUS,6 		//00F1 	1B03
		BTSC 	1CH,0 			//00F2 	141C
		RET		 					//00F3 	0004
		ORG		00F4H
		CLRWDT	 			//00F4 	0001
		LJUMP 	F0H 			//00F5 	38F0

		//;time.c: 30: TMR1IF = 0;
		BCR 	CH,0 			//00F6 	100C

		//;time.c: 31: TMR1IE = 1;
		BSR 	STATUS,5 		//00F7 	1A83
		BSR 	CH,0 			//00F8 	180C

		//;time.c: 32: PEIE = 1;
		BSR 	INTCON,6 		//00F9 	1B0B

		//;time.c: 33: GIE = 1;
		BSR 	INTCON,7 		//00FA 	1B8B

		//;time.c: 34: TMR1ON = 1;
		BCR 	STATUS,5 		//00FB 	1283
		ORG		00FCH
		BSR 	10H,0 			//00FC 	1810
		RET		 					//00FD 	0004

		//;delay.c: 11: unsigned char a;
		//;delay.c: 13: for(a=0;a<250;a++)
		CLRR 	72H 			//00FE 	0172
		CLRWDT	 			//00FF 	0001
		LDWI 	FAH 			//0100 	2AFA
		INCR	72H,1 			//0101 	09F2
		SUBWR 	72H,0 			//0102 	0C72
		BTSC 	STATUS,0 		//0103 	1403
		ORG		0104H
		RET		 					//0104 	0004
		LJUMP 	FFH 			//0105 	38FF

		//;time.c: 15: TMR1H = 0xF6;
		LDWI 	F6H 			//0106 	2AF6
		STR 	FH 			//0107 	018F

		//;time.c: 16: TMR1L = 0x3B;
		LDWI 	3BH 			//0108 	2A3B
		STR 	EH 			//0109 	018E

		//;time.c: 17: T1CON = 0B00100000;
		LDWI 	20H 			//010A 	2A20
		STR 	10H 			//010B 	0190
		ORG		010CH
		RET		 					//010C 	0004
		CLRR 	77H 			//010D 	0177
		CLRR 	78H 			//010E 	0178
		CLRR 	79H 			//010F 	0179
		CLRR 	7AH 			//0110 	017A
		CLRR 	STATUS 			//0111 	0103
		LJUMP 	CEH 			//0112 	38CE

		//;sleep.c: 11: IOCA1 = 1;
		BSR 	16H,1 			//0113 	1896
		ORG		0114H

		//;sleep.c: 12: Temp_Read = PORTA;
		BCR 	STATUS,5 		//0114 	1283
		LDR 	5H,0 			//0115 	0805

		//;sleep.c: 13: PAIF = 0;
		BCR 	INTCON,0 		//0116 	100B

		//;sleep.c: 14: PAIE = 0;
		BCR 	INTCON,3 		//0117 	118B
		RET		 					//0118 	0004

		//;pwm.c: 33: TMR5ON = 0;
		BCR 	STATUS,5 		//0119 	1283
		BSR 	STATUS,6 		//011A 	1B03
		BCR 	1CH,2 			//011B 	111C
		ORG		011CH

		//;pwm.c: 34: PWM5CR1 = 0b00000000;
		CLRR 	1CH 			//011C 	011C
		RET		 					//011D 	0004
			END
