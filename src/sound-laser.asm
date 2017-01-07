		org	8000h

; Port 254 Bits:
; - - - S M B B B
; 7 6 5 4 3 2 1 0

proc
banner		ld	a,0eh		; Yellow ink on blue paper
		ld	(5c8dh),a	; Set screen colours
		call	0dafh		; Clear screen
		ld	a,2		; Upper screen
		call	1601h		; Open channel
		ld	de,banner_txt	; Text address
		ld	bc,banner_txt_end-banner_txt	; Length of string to print
		call	203ch		; Print string
endp

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
rumble_snd	di			; Disable maskable interrupts
		ld	hl,0000h	; Start of ROM - source of random bits
		ld	de,1000h	; Rumble sound length
loop		ld	a,(hl)		; Get random bits
		out	(0feh),a	; Send to speaker/border
		ld	b,0ffh		; Set delay to max length
delay		djnz	(delay)
		dec	de		; Decrease rumble length counter
		inc	hl		; Next ROM address
		ld	a,e
		or	d		; Has DE reached 0?
		jr	nz,loop		; Loop if so.
		ei			; Enable interrupts again
endp

proc
local		delay,pitch_loop,cycle_loop
engine_snd	ld	hl,0000h	; set 'random' bit source address to ROM start
		ld	c,0		; initial (short) time between edges (high pitch)
pitch_loop	ld	d,020h		; total number of cycles per pitch
cycle_loop	ld	a,(hl)		; load ROM bits
		and	012h		; Mask bits - only set BORDER & SPK
		out	(0feh),a	; Send bits to PORT
		ld	b,c		; Load delay time into DJNZ's register
delay		djnz	(delay)
		inc	hl		; increment ROM address for sound bits
		dec	d		; decrement cycles remaining
		jr	nz,(cycle_loop)	; next cycle
		inc	c		; increase time between edges (lower pitch)
		jr	nz,(pitch_loop)	; next pitch
endp

		ret

banner_txt	defb	16h,06h,08h		; AT 6,8 (y,x)
		defb	12h,01h			; FLASH 1
		defb	' Sound & Vision '
		defb	12h,00h			; FLASH 0
banner_txt_end	equ	$

		end	8000h
