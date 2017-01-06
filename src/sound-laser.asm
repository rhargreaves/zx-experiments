org 8000h

; Port 254 Bits:
; - - - S M B B B
; 7 6 5 4 3 2 1 0

proc
local		loop
laser_snd	ld	hl,1000h	; initial pitch
loop		ld	de,0020h	; gradient of decrease over time
		sbc	hl,de		; subtract gradient from pitch
		ld	de,0001h	; length of sound
		push	hl		; save copy of HL as ROM changes it
		call	03B5h		; ROM BEEP call
		pop	hl		; restore original HL
		ld	a,h
		and	a		; LD doesn't set Z flag; this will if A = 0
		jr	nz,loop		; Loop if more sound to play
endp

proc
local		loop,delay
rumble_snd	di
		ld	hl,0000h
		ld	de,2000h
loop		ld	a,(hl)
		out	(0feh),a
		ld	b,0ffh
delay		djnz	(delay)
		dec	de
		inc	hl
		ld	a,e
		or	d
		jr	nz,loop
		ei
endp

		ret

end 8000h
