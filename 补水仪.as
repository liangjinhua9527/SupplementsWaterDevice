opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_DEVICE_INIT
	FNCALL	_main,_PWM_INIT
	FNCALL	_main,_IOCA1_INIT
	FNCALL	_main,_TIMER1_INIT
	FNCALL	_main,_ENABLE_INTERRUPT
	FNCALL	_main,_sleep_open
	FNCALL	_main,_keyFunc
	FNCALL	_keyFunc,_SET_PWM5_ON
	FNCALL	_keyFunc,_led_flash
	FNCALL	_keyFunc,_SET_PWM5_OFF
	FNCALL	_sleep_open,_sleep_init
	FNCALL	_led_flash,_DELAY_MS
	FNCALL	_DELAY_MS,_DELAY_1MS
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_deviceSeepCnt
	global	_deviceStatus
	global	_keyFlag
	global	_keyPressCnt
	global	_PSTRCON
psect	text165,local,class=CODE,delta=2
global __ptext165
__ptext165:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_MSCKCON
_MSCKCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_ADON
_ADON	set	248
	global	_GIE
_GIE	set	95
	global	_PAIE
_PAIE	set	91
	global	_PAIF
_PAIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA1
_RA1	set	41
	global	_RA6
_RA6	set	46
	global	_RC2
_RC2	set	58
	global	_RC4
_RC4	set	60
	global	_SLVREN
_SLVREN	set	220
	global	_SWDTEN
_SWDTEN	set	192
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ANSEL
_ANSEL	set	145
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_IOCA1
_IOCA1	set	1201
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISC2
_TRISC2	set	1082
	global	_PR5L
_PR5L	set	282
	global	_PWM5CR0
_PWM5CR0	set	283
	global	_PWM5CR1
_PWM5CR1	set	284
	global	_T5CKDIV
_T5CKDIV	set	285
	global	_TMR5H
_TMR5H	set	281
	global	_TMR5L
_TMR5L	set	280
	global	_TMR5IF
_TMR5IF	set	2272
	global	_TMR5ON
_TMR5ON	set	2274
	file	"²¹Ë®ÒÇ.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_deviceSeepCnt:
       ds      1

_deviceStatus:
       ds      1

_keyFlag:
       ds      1

_keyPressCnt:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_SET_PWM5_ON
?_SET_PWM5_ON:	; 0 bytes @ 0x0
	global	?_led_flash
?_led_flash:	; 0 bytes @ 0x0
	global	?_SET_PWM5_OFF
?_SET_PWM5_OFF:	; 0 bytes @ 0x0
	global	?_DEVICE_INIT
?_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_PWM_INIT
?_PWM_INIT:	; 0 bytes @ 0x0
	global	?_IOCA1_INIT
?_IOCA1_INIT:	; 0 bytes @ 0x0
	global	?_TIMER1_INIT
?_TIMER1_INIT:	; 0 bytes @ 0x0
	global	?_ENABLE_INTERRUPT
?_ENABLE_INTERRUPT:	; 0 bytes @ 0x0
	global	?_sleep_open
?_sleep_open:	; 0 bytes @ 0x0
	global	?_DELAY_1MS
?_DELAY_1MS:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_keyFunc
?_keyFunc:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_sleep_init
?_sleep_init:	; 0 bytes @ 0x0
	ds	2
	global	??_SET_PWM5_ON
??_SET_PWM5_ON:	; 0 bytes @ 0x2
	global	??_SET_PWM5_OFF
??_SET_PWM5_OFF:	; 0 bytes @ 0x2
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x2
	global	??_PWM_INIT
??_PWM_INIT:	; 0 bytes @ 0x2
	global	??_IOCA1_INIT
??_IOCA1_INIT:	; 0 bytes @ 0x2
	global	??_TIMER1_INIT
??_TIMER1_INIT:	; 0 bytes @ 0x2
	global	??_ENABLE_INTERRUPT
??_ENABLE_INTERRUPT:	; 0 bytes @ 0x2
	global	??_sleep_open
??_sleep_open:	; 0 bytes @ 0x2
	global	??_DELAY_1MS
??_DELAY_1MS:	; 0 bytes @ 0x2
	global	??_sleep_init
??_sleep_init:	; 0 bytes @ 0x2
	global	DELAY_1MS@a
DELAY_1MS@a:	; 1 bytes @ 0x2
	ds	1
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x3
	global	DELAY_MS@Time
DELAY_MS@Time:	; 2 bytes @ 0x3
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x5
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x5
	ds	2
	global	??_led_flash
??_led_flash:	; 0 bytes @ 0x7
	global	??_keyFunc
??_keyFunc:	; 0 bytes @ 0x7
	global	??_main
??_main:	; 0 bytes @ 0x7
;;Data sizes: Strings 0, constant 0, data 0, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      11
;; BANK0           80      0       0
;; BANK1           32      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _led_flash->_DELAY_MS
;;   _DELAY_MS->_DELAY_1MS
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      60
;;                        _DEVICE_INIT
;;                           _PWM_INIT
;;                         _IOCA1_INIT
;;                        _TIMER1_INIT
;;                   _ENABLE_INTERRUPT
;;                         _sleep_open
;;                            _keyFunc
;; ---------------------------------------------------------------------------------
;; (1) _keyFunc                                              0     0      0      60
;;                        _SET_PWM5_ON
;;                          _led_flash
;;                       _SET_PWM5_OFF
;; ---------------------------------------------------------------------------------
;; (1) _sleep_open                                           0     0      0       0
;;                         _sleep_init
;; ---------------------------------------------------------------------------------
;; (2) _led_flash                                            0     0      0      60
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (2) _sleep_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _DELAY_MS                                             4     2      2      60
;;                                              3 COMMON     4     2      2
;;                          _DELAY_1MS
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE_INTERRUPT                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER1_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _IOCA1_INIT                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _PWM_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SET_PWM5_OFF                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SET_PWM5_ON                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _DELAY_1MS                                            1     1      0      30
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _PWM_INIT
;;   _IOCA1_INIT
;;   _TIMER1_INIT
;;   _ENABLE_INTERRUPT
;;   _sleep_open
;;     _sleep_init
;;   _keyFunc
;;     _SET_PWM5_ON
;;     _led_flash
;;       _DELAY_MS
;;         _DELAY_1MS
;;     _SET_PWM5_OFF
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       0       4        0.0%
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0       B       7        0.0%
;;DATA                 0      0       F       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 23 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DEVICE_INIT
;;		_PWM_INIT
;;		_IOCA1_INIT
;;		_TIMER1_INIT
;;		_ENABLE_INTERRUPT
;;		_sleep_open
;;		_keyFunc
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	23
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	24
	
l9833:	
;main.c: 24: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	25
;main.c: 25: PWM_INIT();
	fcall	_PWM_INIT
	line	26
;main.c: 26: IOCA1_INIT();
	fcall	_IOCA1_INIT
	line	27
;main.c: 27: TIMER1_INIT();
	fcall	_TIMER1_INIT
	line	28
	
l9835:	
;main.c: 28: ENABLE_INTERRUPT();
	fcall	_ENABLE_INTERRUPT
	line	31
	
l9837:	
# 31 "main.c"
clrwdt ;#
psect	maintext
	line	32
	
l9839:	
;main.c: 32: sleep_open();
	fcall	_sleep_open
	line	33
	
l9841:	
;main.c: 33: if( keyFlag == 1){
	decf	(_keyFlag),w
	skipz
	goto	u191
	goto	u190
u191:
	goto	l9837
u190:
	line	34
	
l9843:	
;main.c: 34: keyFunc();
	fcall	_keyFunc
	goto	l9837
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	37
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_keyFunc
psect	text166,local,class=CODE,delta=2
global __ptext166
__ptext166:

;; *************** function _keyFunc *****************
;; Defined at:
;;		line 45 in file "key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SET_PWM5_ON
;;		_led_flash
;;		_SET_PWM5_OFF
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text166
	file	"key.c"
	line	45
	global	__size_of_keyFunc
	__size_of_keyFunc	equ	__end_of_keyFunc-_keyFunc
	
_keyFunc:	
	opt	stack 3
; Regs used in _keyFunc: [wreg+status,2+status,0+pclath+cstack]
	line	46
	
l9795:	
;key.c: 46: TMR1ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	line	47
;key.c: 47: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	48
	
l9797:	
;key.c: 48: if(deviceStatus == 0){
	movf	(_deviceStatus),f
	skipz
	goto	u161
	goto	u160
u161:
	goto	l9807
u160:
	line	49
	
l9799:	
;key.c: 49: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	50
	
l9801:	
;key.c: 50: T5CKDIV = 9;
	movlw	(09h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(285)^0100h	;volatile
	line	51
	
l9803:	
;key.c: 51: SET_PWM5_ON();
	fcall	_SET_PWM5_ON
	line	52
	
l9805:	
;key.c: 52: deviceStatus = 1;
	clrf	(_deviceStatus)
	incf	(_deviceStatus),f
	line	53
;key.c: 53: }
	goto	l9827
	line	54
	
l9807:	
;key.c: 54: else if(deviceStatus == 1){
	decf	(_deviceStatus),w
	skipz
	goto	u171
	goto	u170
u171:
	goto	l9815
u170:
	line	55
	
l9809:	
;key.c: 55: led_flash();
	fcall	_led_flash
	line	56
	
l9811:	
;key.c: 56: T5CKDIV = 8;
	movlw	(08h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(285)^0100h	;volatile
	line	57
	
l9813:	
;key.c: 57: SET_PWM5_ON();
	fcall	_SET_PWM5_ON
	line	58
;key.c: 58: deviceStatus = 2;
	movlw	(02h)
	movwf	(_deviceStatus)
	line	59
;key.c: 59: }
	goto	l9827
	line	60
	
l9815:	
;key.c: 60: else if(deviceStatus == 2){
	movf	(_deviceStatus),w
	xorlw	02h
	skipz
	goto	u181
	goto	u180
u181:
	goto	l9827
u180:
	line	61
	
l9817:	
;key.c: 61: deviceStatus =0;
	clrf	(_deviceStatus)
	line	62
	
l9819:	
;key.c: 62: SET_PWM5_OFF();
	fcall	_SET_PWM5_OFF
	line	63
	
l9821:	
;key.c: 63: deviceSeepCnt = 0;
	clrf	(_deviceSeepCnt)
	line	64
	
l9823:	
;key.c: 64: RC2= 0;
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	65
	
l9825:	
;key.c: 65: RA6 = 0;
	bcf	(46/8),(46)&7
	line	67
	
l9827:	
;key.c: 66: }
;key.c: 67: keyFlag = 2;
	movlw	(02h)
	movwf	(_keyFlag)
	line	68
	
l9829:	
;key.c: 68: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	line	69
	
l9831:	
;key.c: 69: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	70
	
l2170:	
	return
	opt stack 0
GLOBAL	__end_of_keyFunc
	__end_of_keyFunc:
;; =============== function _keyFunc ends ============

	signat	_keyFunc,88
	global	_sleep_open
psect	text167,local,class=CODE,delta=2
global __ptext167
__ptext167:

;; *************** function _sleep_open *****************
;; Defined at:
;;		line 62 in file "sleep.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_sleep_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text167
	file	"sleep.c"
	line	62
	global	__size_of_sleep_open
	__size_of_sleep_open	equ	__end_of_sleep_open-_sleep_open
	
_sleep_open:	
	opt	stack 5
; Regs used in _sleep_open: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l9787:	
;sleep.c: 63: if(deviceStatus == 0){
	movf	(_deviceStatus),f
	skipz
	goto	u141
	goto	u140
u141:
	goto	l6477
u140:
	line	64
	
l9789:	
;sleep.c: 64: if(deviceSeepCnt >= 200){
	movlw	(0C8h)
	subwf	(_deviceSeepCnt),w
	skipc
	goto	u151
	goto	u150
u151:
	goto	l6477
u150:
	line	65
	
l9791:	
;sleep.c: 65: deviceSeepCnt = 0;
	clrf	(_deviceSeepCnt)
	line	66
	
l9793:	
;sleep.c: 66: sleep_init();
	fcall	_sleep_init
	line	69
	
l6477:	
	return
	opt stack 0
GLOBAL	__end_of_sleep_open
	__end_of_sleep_open:
;; =============== function _sleep_open ends ============

	signat	_sleep_open,88
	global	_led_flash
psect	text168,local,class=CODE,delta=2
global __ptext168
__ptext168:

;; *************** function _led_flash *****************
;; Defined at:
;;		line 6 in file "led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DELAY_MS
;; This function is called by:
;;		_keyFunc
;; This function uses a non-reentrant model
;;
psect	text168
	file	"led.c"
	line	6
	global	__size_of_led_flash
	__size_of_led_flash	equ	__end_of_led_flash-_led_flash
	
_led_flash:	
	opt	stack 3
; Regs used in _led_flash: [wreg+status,2+status,0+pclath+cstack]
	line	7
	
l9781:	
;led.c: 7: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	8
	
l9783:	
;led.c: 8: DELAY_MS(500);
	movlw	low(01F4h)
	movwf	(?_DELAY_MS)
	movlw	high(01F4h)
	movwf	((?_DELAY_MS))+1
	fcall	_DELAY_MS
	line	9
	
l9785:	
;led.c: 9: RA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(46/8),(46)&7
	line	10
	
l3237:	
	return
	opt stack 0
GLOBAL	__end_of_led_flash
	__end_of_led_flash:
;; =============== function _led_flash ends ============

	signat	_led_flash,88
	global	_sleep_init
psect	text169,local,class=CODE,delta=2
global __ptext169
__ptext169:

;; *************** function _sleep_init *****************
;; Defined at:
;;		line 24 in file "sleep.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sleep_open
;; This function uses a non-reentrant model
;;
psect	text169
	file	"sleep.c"
	line	24
	global	__size_of_sleep_init
	__size_of_sleep_init	equ	__end_of_sleep_init-_sleep_init
	
_sleep_init:	
	opt	stack 5
; Regs used in _sleep_init: [wreg]
	line	25
	
l9753:	
;sleep.c: 25: GIE = 0;
	bcf	(95/8),(95)&7
	line	26
;sleep.c: 26: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(248/8),(248)&7
	line	27
# 27 "sleep.c"
clrwdt ;#
psect	text169
	line	28
;sleep.c: 28: TMR1ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	line	29
;sleep.c: 29: TMR1IE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1120/8)^080h,(1120)&7
	line	30
;sleep.c: 30: SWDTEN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(192/8),(192)&7
	line	34
;sleep.c: 34: SLVREN = 0;
	bcf	(220/8),(220)&7
	line	38
;sleep.c: 38: IOCA1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1201/8)^080h,(1201)&7
	line	39
	
l9755:	
;sleep.c: 39: Temp_Read = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l9757:	
;sleep.c: 40: PAIF = 0;
	bcf	(88/8),(88)&7
	line	41
	
l9759:	
;sleep.c: 41: PAIE = 1;
	bsf	(91/8),(91)&7
	line	42
	
l9761:	
# 42 "sleep.c"
sleep ;#
psect	text169
	line	43
	
l9763:	
;sleep.c: 43: _nop();
	nop
	line	44
	
l9765:	
;sleep.c: 44: PAIE = 0;
	bcf	(91/8),(91)&7
	line	45
;sleep.c: 45: Temp_Read = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	46
	
l9767:	
;sleep.c: 46: PAIF = 0;
	bcf	(88/8),(88)&7
	line	47
	
l9769:	
;sleep.c: 47: SWDTEN = 1;
	bsf	(192/8),(192)&7
	line	48
	
l9771:	
;sleep.c: 48: SLVREN = 1;
	bsf	(220/8),(220)&7
	line	49
	
l9773:	
# 49 "sleep.c"
clrwdt ;#
psect	text169
	line	50
	
l9775:	
;sleep.c: 50: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	line	51
	
l9777:	
;sleep.c: 51: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	52
	
l9779:	
;sleep.c: 52: GIE = 1;
	bsf	(95/8),(95)&7
	line	53
	
l6472:	
	return
	opt stack 0
GLOBAL	__end_of_sleep_init
	__end_of_sleep_init:
;; =============== function _sleep_init ends ============

	signat	_sleep_init,88
	global	_DELAY_MS
psect	text170,local,class=CODE,delta=2
global __ptext170
__ptext170:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 20 in file "delay.c"
;; Parameters:    Size  Location     Type
;;  Time            2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  a               2    5[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_1MS
;; This function is called by:
;;		_led_flash
;; This function uses a non-reentrant model
;;
psect	text170
	file	"delay.c"
	line	20
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 3
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	23
	
l9745:	
;delay.c: 21: unsigned int a;
;delay.c: 23: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l9751
	line	25
	
l9747:	
;delay.c: 24: {
;delay.c: 25: DELAY_1MS();
	fcall	_DELAY_1MS
	line	23
	
l9749:	
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l9751:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u135
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u135:
	skipc
	goto	u131
	goto	u130
u131:
	goto	l9747
u130:
	line	27
	
l1073:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_ENABLE_INTERRUPT
psect	text171,local,class=CODE,delta=2
global __ptext171
__ptext171:

;; *************** function _ENABLE_INTERRUPT *****************
;; Defined at:
;;		line 29 in file "time.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text171
	file	"time.c"
	line	29
	global	__size_of_ENABLE_INTERRUPT
	__size_of_ENABLE_INTERRUPT	equ	__end_of_ENABLE_INTERRUPT-_ENABLE_INTERRUPT
	
_ENABLE_INTERRUPT:	
	opt	stack 6
; Regs used in _ENABLE_INTERRUPT: []
	line	30
	
l9743:	
;time.c: 30: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	31
;time.c: 31: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	32
;time.c: 32: PEIE = 1;
	bsf	(94/8),(94)&7
	line	33
;time.c: 33: GIE = 1;
	bsf	(95/8),(95)&7
	line	34
;time.c: 34: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	35
	
l7545:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE_INTERRUPT
	__end_of_ENABLE_INTERRUPT:
;; =============== function _ENABLE_INTERRUPT ends ============

	signat	_ENABLE_INTERRUPT,88
	global	_TIMER1_INIT
psect	text172,local,class=CODE,delta=2
global __ptext172
__ptext172:

;; *************** function _TIMER1_INIT *****************
;; Defined at:
;;		line 14 in file "time.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text172
	file	"time.c"
	line	14
	global	__size_of_TIMER1_INIT
	__size_of_TIMER1_INIT	equ	__end_of_TIMER1_INIT-_TIMER1_INIT
	
_TIMER1_INIT:	
	opt	stack 6
; Regs used in _TIMER1_INIT: [wreg]
	line	15
	
l9741:	
;time.c: 15: TMR1H = 0xF6;
	movlw	(0F6h)
	movwf	(15)	;volatile
	line	16
;time.c: 16: TMR1L = 0x3B;
	movlw	(03Bh)
	movwf	(14)	;volatile
	line	17
;time.c: 17: T1CON = 0B00100000;
	movlw	(020h)
	movwf	(16)	;volatile
	line	18
	
l7542:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_INIT
	__end_of_TIMER1_INIT:
;; =============== function _TIMER1_INIT ends ============

	signat	_TIMER1_INIT,88
	global	_IOCA1_INIT
psect	text173,local,class=CODE,delta=2
global __ptext173
__ptext173:

;; *************** function _IOCA1_INIT *****************
;; Defined at:
;;		line 10 in file "sleep.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text173
	file	"sleep.c"
	line	10
	global	__size_of_IOCA1_INIT
	__size_of_IOCA1_INIT	equ	__end_of_IOCA1_INIT-_IOCA1_INIT
	
_IOCA1_INIT:	
	opt	stack 6
; Regs used in _IOCA1_INIT: [wreg]
	line	11
	
l9733:	
;sleep.c: 11: IOCA1 = 1;
	bsf	(1201/8)^080h,(1201)&7
	line	12
	
l9735:	
;sleep.c: 12: Temp_Read = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	13
	
l9737:	
;sleep.c: 13: PAIF = 0;
	bcf	(88/8),(88)&7
	line	14
	
l9739:	
;sleep.c: 14: PAIE = 0;
	bcf	(91/8),(91)&7
	line	15
	
l6469:	
	return
	opt stack 0
GLOBAL	__end_of_IOCA1_INIT
	__end_of_IOCA1_INIT:
;; =============== function _IOCA1_INIT ends ============

	signat	_IOCA1_INIT,88
	global	_PWM_INIT
psect	text174,local,class=CODE,delta=2
global __ptext174
__ptext174:

;; *************** function _PWM_INIT *****************
;; Defined at:
;;		line 10 in file "pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text174
	file	"pwm.c"
	line	10
	global	__size_of_PWM_INIT
	__size_of_PWM_INIT	equ	__end_of_PWM_INIT-_PWM_INIT
	
_PWM_INIT:	
	opt	stack 6
; Regs used in _PWM_INIT: [wreg+status,2]
	line	11
	
l9721:	
;pwm.c: 11: TRISC2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	12
	
l9723:	
;pwm.c: 12: PWM5CR0 = 0b00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(283)^0100h	;volatile
	line	13
;pwm.c: 13: PWM5CR1 = 0b10000000;
	movlw	(080h)
	movwf	(284)^0100h	;volatile
	line	14
;pwm.c: 14: T5CKDIV = 9;
	movlw	(09h)
	movwf	(285)^0100h	;volatile
	line	15
	
l9725:	
;pwm.c: 15: TMR5H = 0;
	clrf	(281)^0100h	;volatile
	line	16
	
l9727:	
;pwm.c: 16: TMR5L = 0;
	clrf	(280)^0100h	;volatile
	line	17
;pwm.c: 17: PR5L = 8;
	movlw	(08h)
	movwf	(282)^0100h	;volatile
	line	18
	
l9729:	
;pwm.c: 18: TMR5IF = 0;
	bcf	(2272/8)^0100h,(2272)&7
	line	19
	
l9731:	
;pwm.c: 19: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	20
	
l5387:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_INIT
	__end_of_PWM_INIT:
;; =============== function _PWM_INIT ends ============

	signat	_PWM_INIT,88
	global	_DEVICE_INIT
psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 16 in file "io.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text175
	file	"io.c"
	line	16
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 6
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	17
	
l9699:	
;io.c: 17: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	21
	
l9701:	
;io.c: 21: MSCKCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	25
	
l9703:	
;io.c: 25: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	27
;io.c: 27: CMCON0 = 0B00000111;
	movlw	(07h)
	movwf	(25)	;volatile
	line	28
	
l9705:	
;io.c: 28: ANSEL = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(145)^080h	;volatile
	line	30
	
l9707:	
;io.c: 30: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	31
;io.c: 31: TRISA = 0B10111111;
	movlw	(0BFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	32
;io.c: 32: WPUA = 0B10111111;
	movlw	(0BFh)
	movwf	(149)^080h	;volatile
	line	34
	
l9709:	
;io.c: 34: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	35
	
l9711:	
;io.c: 35: TRISC = 0B11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	36
	
l9713:	
;io.c: 36: WPUC = 0B11111011;
	movlw	(0FBh)
	movwf	(136)^080h	;volatile
	line	38
	
l9715:	
;io.c: 38: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	40
	
l9717:	
;io.c: 40: RA6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	41
	
l9719:	
;io.c: 41: RC4 = 1;
	bsf	(60/8),(60)&7
	line	42
	
l8610:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
	global	_SET_PWM5_OFF
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _SET_PWM5_OFF *****************
;; Defined at:
;;		line 32 in file "pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/40
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_keyFunc
;; This function uses a non-reentrant model
;;
psect	text176
	file	"pwm.c"
	line	32
	global	__size_of_SET_PWM5_OFF
	__size_of_SET_PWM5_OFF	equ	__end_of_SET_PWM5_OFF-_SET_PWM5_OFF
	
_SET_PWM5_OFF:	
	opt	stack 5
; Regs used in _SET_PWM5_OFF: [status,2]
	line	33
	
l9695:	
;pwm.c: 33: TMR5ON = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bcf	(2274/8)^0100h,(2274)&7
	line	34
	
l9697:	
;pwm.c: 34: PWM5CR1 = 0b00000000;
	clrf	(284)^0100h	;volatile
	line	35
	
l5396:	
	return
	opt stack 0
GLOBAL	__end_of_SET_PWM5_OFF
	__end_of_SET_PWM5_OFF:
;; =============== function _SET_PWM5_OFF ends ============

	signat	_SET_PWM5_OFF,88
	global	_SET_PWM5_ON
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:

;; *************** function _SET_PWM5_ON *****************
;; Defined at:
;;		line 24 in file "pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/40
;;		On exit  : 60/40
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_keyFunc
;; This function uses a non-reentrant model
;;
psect	text177
	file	"pwm.c"
	line	24
	global	__size_of_SET_PWM5_ON
	__size_of_SET_PWM5_ON	equ	__end_of_SET_PWM5_ON-_SET_PWM5_ON
	
_SET_PWM5_ON:	
	opt	stack 5
; Regs used in _SET_PWM5_ON: [wreg]
	line	25
	
l9691:	
;pwm.c: 25: PWM5CR1 = 0b10000000;
	movlw	(080h)
	movwf	(284)^0100h	;volatile
	line	26
	
l9693:	
;pwm.c: 26: TMR5ON = 1;
	bsf	(2274/8)^0100h,(2274)&7
	line	27
;pwm.c: 27: while(TMR5IF==0) asm("clrwdt");
	goto	l5390
	
l5391:	
# 27 "pwm.c"
clrwdt ;#
psect	text177
	
l5390:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	btfss	(2272/8)^0100h,(2272)&7
	goto	u121
	goto	u120
u121:
	goto	l5391
u120:
	line	28
	
l5393:	
	return
	opt stack 0
GLOBAL	__end_of_SET_PWM5_ON
	__end_of_SET_PWM5_ON:
;; =============== function _SET_PWM5_ON ends ============

	signat	_SET_PWM5_ON,88
	global	_DELAY_1MS
psect	text178,local,class=CODE,delta=2
global __ptext178
__ptext178:

;; *************** function _DELAY_1MS *****************
;; Defined at:
;;		line 10 in file "delay.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text178
	file	"delay.c"
	line	10
	global	__size_of_DELAY_1MS
	__size_of_DELAY_1MS	equ	__end_of_DELAY_1MS-_DELAY_1MS
	
_DELAY_1MS:	
	opt	stack 3
; Regs used in _DELAY_1MS: [wreg+status,2+status,0]
	line	13
	
l9643:	
;delay.c: 11: unsigned char a;
;delay.c: 13: for(a=0;a<250;a++)
	clrf	(DELAY_1MS@a)
	line	14
	
l1065:	
	line	15
# 15 "delay.c"
clrwdt ;#
psect	text178
	line	13
	
l9649:	
	incf	(DELAY_1MS@a),f
	
l9651:	
	movlw	(0FAh)
	subwf	(DELAY_1MS@a),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l1065
u10:
	line	17
	
l1067:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_1MS
	__end_of_DELAY_1MS:
;; =============== function _DELAY_1MS ends ============

	signat	_DELAY_1MS,88
	global	_ISR
psect	text179,local,class=CODE,delta=2
global __ptext179
__ptext179:

;; *************** function _ISR *****************
;; Defined at:
;;		line 11 in file "key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text179
	file	"key.c"
	line	11
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text179
	line	12
	
i1l9653:	
;key.c: 12: if(PAIE&&PAIF)
	btfss	(91/8),(91)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l9661
u2_20:
	
i1l9655:	
	btfss	(88/8),(88)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l9661
u3_20:
	line	14
	
i1l9657:	
;key.c: 13: {
;key.c: 14: Temp_Read = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	15
	
i1l9659:	
;key.c: 15: PAIF = 0;
	bcf	(88/8),(88)&7
	line	18
	
i1l9661:	
;key.c: 16: }
;key.c: 18: if(TMR1IE&&TMR1IF)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l2162
u4_20:
	
i1l9663:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l2162
u5_20:
	line	20
	
i1l9665:	
;key.c: 19: {
;key.c: 20: if(RA1 == 0)
	btfsc	(41/8),(41)&7
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l2156
u6_20:
	line	22
	
i1l9667:	
;key.c: 21: {
;key.c: 22: deviceSeepCnt = 0;
	clrf	(_deviceSeepCnt)
	line	23
	
i1l9669:	
;key.c: 23: if(keyPressCnt <= 10) keyPressCnt++;
	movlw	(0Bh)
	subwf	(_keyPressCnt),w
	skipnc
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l9673
u7_20:
	
i1l9671:	
	incf	(_keyPressCnt),f
	line	24
	
i1l9673:	
;key.c: 24: if(keyPressCnt == 6&&keyFlag == 0) keyFlag = 1;
	movf	(_keyPressCnt),w
	xorlw	06h
	skipz
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l9685
u8_20:
	
i1l9675:	
	movf	(_keyFlag),f
	skipz
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l9685
u9_20:
	
i1l9677:	
	clrf	(_keyFlag)
	incf	(_keyFlag),f
	goto	i1l9685
	line	27
	
i1l2156:	
;key.c: 27: else if(RA1 == 1) {
	btfss	(41/8),(41)&7
	goto	u10_21
	goto	u10_20
u10_21:
	goto	i1l9685
u10_20:
	line	28
	
i1l9679:	
;key.c: 28: keyPressCnt = 0;
	clrf	(_keyPressCnt)
	line	29
;key.c: 29: keyFlag = 0;
	clrf	(_keyFlag)
	line	30
	
i1l9681:	
;key.c: 30: if(deviceStatus == 0) deviceSeepCnt++;
	movf	(_deviceStatus),f
	skipz
	goto	u11_21
	goto	u11_20
u11_21:
	goto	i1l9685
u11_20:
	
i1l9683:	
	incf	(_deviceSeepCnt),f
	line	32
	
i1l9685:	
;key.c: 31: }
;key.c: 32: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	33
	
i1l9687:	
;key.c: 33: TMR1H = 0xF6;
	movlw	(0F6h)
	movwf	(15)	;volatile
	line	34
	
i1l9689:	
;key.c: 34: TMR1L = 0x3B;
	movlw	(03Bh)
	movwf	(14)	;volatile
	line	36
	
i1l2162:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text180,local,class=CODE,delta=2
global __ptext180
__ptext180:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
