org 8000h

; Port 254 Bits:
; - - - S M B B B
; 7 6 5 4 3 2 1 0

main		di			; disable maskable interrupts
		ld	c,0ffh
snd_loop	ld	a,01h
		out	(0feh),a	; 0 to SPK, 1 to BORDER
		ld	b,0c0h
delay1		djnz	(delay1)
		ld	a,013h
		out	(0feh),a	; 1 to SPK, 3 to BORDER
		ld	b,0c0h
delay2		djnz	(delay2)
		dec	c		; decrement main loop
		jr	nz,(snd_loop)
		ei			; enable maskable interrupts
		ret

end 8000h

