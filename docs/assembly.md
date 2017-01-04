
# Registers

## General

| Register | Purpose | Usages |
|----------|------|-------|
| A | Accumulator | |
| F | Flags | **S**ign (if minus)	**Z**ero **-** **H** **-**	**P**arity/Overflow	**N**ot	**C**arry	|
| BC | 16-bit address/data or two single 8-bit registers | Result of USR BASIC function |
| DE | 16-bit address/data or two single 8-bit registers | |
| HL | 16-bit accumulator/address register or two 8-bit registers | Accumulator abilities make it popular for holding source addresses |

## Special Purpose

| Register | Purpose | Usages |
|----------|------|-------|
| I | Interrupt | |
| R | Refresh | |
| IX | Index X | |
| IY | Index Y | |
| SP | Stack Pointer | 16-bit address |
| PC | Program Counter | 16-bit data |
| A' to L' | Shadow | Exchanged with A to L through use of EX and EXX |

# Operators

Parentheses denote memory addresses, rather than absolute values.

| Assembly                                        | Name | Usage                                                  |
|-------------------------------------------------|------|--------------------------------------------------------|
| LD A, 12<br>LD A, (7FFFH)<br>LD (7FFFH), A<br>LD (BC), A | Load | Load (or store) into destination (1st) from source (2nd). Does not affect flags. |
| INC A<br>INC (HL)<br>INC HL  | Increment | Increments by 1 |
| DEC A<br>DEC (HL)<br>DEC HL  | Decrement | Decrements by 1 |
| JR Z, 10<br>JR NZ, 10 | Conditional Relative Jump | Jump forward 10 + 2 if Z flag 1 (or 0 if NZ used) |
