org 08000h

ld hl,04000h
ld (hl),%10101010
ld de,04001h
ld bc,17FFh
ldir

ret

end 08000h
