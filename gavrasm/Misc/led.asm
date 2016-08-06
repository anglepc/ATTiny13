.device attiny85

	LDI	R16, 0x01
	OUT	DDRB, R16
loop:
	com	R16
;	LDI	R16, 0x00
	out	PORTB, R16
	rcall	delay
	rjmp	loop

delay:
	ldi	R17, 100 ; 1
loop3:
	ldi	R18, 255 ; 255
loop2: 
	ldi	R19, 255
loop1: 
	dec	R19
	brne	loop1 ; 767 (1 + 3*255 + 1)
	dec	R18
	brne	loop2 ; 195842 (1 + 768*255 + 1)
	dec	R17  
	brne	loop3 ; 19584302 (1 + 195843*100 + 1)
	ret           ; 19584303

ws2812:
	ldi	R26, low(lights)
	ldi	R27, high(lights)
					st	X+,,,

	ld	R0, X+
	ret

.dseg
lights: 
	.byte	3*1
