org 8000h

; Port 254 Bits:
; B B B M S - - -
; 0 1 2 3 4 5 6 7

main		di			; disable maskable interrupts
		ld c,0ffh
snd_loop	ld a,0
		out (0feh),a		; 0 to SPK and BORDER/MIC
		ld b,0c0h
delay1		djnz (delay1)
		ld a,018h		; 1 to SPK, 0 to BORDER/MIC
		out (0feh),a
		ld b,0c0h
delay2		djnz (delay2)
		dec c			; decrement main loop
		jr nz,(snd_loop)
		ei			; enable maskable interrupts
		ret

end 8000h

