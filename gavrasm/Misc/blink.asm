.EQU FRAME_START = SRAM_START

.CSEG
.ORG 0000
	rjmp Start

Start:
	ldi		R16, 0x01	;set pin PB0 to output
	out		DDRB, R16
	ldi		R16, 0x00	;set pin PB0 low
	out		PORTB, R16

	ldi		XH, HIGH(FRAME_START)
	ldi		XL, LOW(FRAME_START)
	
	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x02 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x04 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x08 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x10 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x20 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x02 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x04 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x08 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x10 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x10 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x00 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x02 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x04 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x08 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x10 ;BB
	st		X+, R16

	ldi		R16, 0x00 ;GG	;------
	st		X+, R16
	ldi		R16, 0x00 ;RR
	st		X+, R16
	ldi		R16, 0x20 ;BB
	st		X+, R16

	ldi		R16, 0x08 ;GG	;------
	st		X+, R16
	ldi		R16, 0x08 ;RR
	st		X+, R16
	ldi		R16, 0x08 ;BB
	st		X+, R16



	ldi		XH, HIGH(FRAME_START)
	ldi		XL, LOW(FRAME_START)

	ldi		R18, 48 ;(16 pixels each with 3 bytes each (G, R, B)
getpixel:
	ld		R16, X+ ;R16 gets set to a value taken from SRAM address  ;-------
	rcall	send8bits
	dec		R18
	brne	getpixel




hang:	rjmp	hang

;-------------------------------------
send8bits:
	ldi		R17, 0x08
bitloop:
	sbi		PORTB, 0
	nop
	nop
	nop
	sbrs	R16, 7
		cbi		PORTB, 0
	nop
	nop
	nop
	nop
	nop
	nop
	cbi		PORTB, 0	
	nop
	lsl		R16			;cue up next bit
	dec		R17
	brne	bitloop

	ret
;-------------------------------------	





