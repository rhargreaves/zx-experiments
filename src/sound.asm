org 08000h

; Port 254 Bits:
; B B B M S - - -
; 0 1 2 3 4 5 6 7

main:
	di ; disable maskable interrupts
	ld c,0xff
snd_loop:
	ld a,0
	out (0xfe),a ; 0 to SPK and BORDER/MIC
	ld b,0xc0
delay1:	
	djnz (delay1)
	ld a,0x18 ; 1 to SPK, 0 to BORDER/MIC
	out (0xfe),a
	ld b,0xc0
delay2:
	djnz (delay2)
	dec c ; decrement main loop
	jr nz,(snd_loop)
	ei ; enable maskable interrupts
	ret

end 08000h

