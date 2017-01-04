
# Registers

| Register | Name | Usage |
|----------|------|-------|
| A | Accumulator | |
| F | Flags | **S**ign (if minus)	**Z**ero **-** **H** **-**	**P**arity/Overflow	**N**ot	**C**arry	|
| BC | 16-bit address/data or two single 8-bit registers | Result of USR BASIC function |
| DE | 16-bit address/data or two single 8-bit registers | |
| HL | 16-bit accumulator/address register or two 8-bit registers | Accumulator abilities make it popular for holding source addresses |

# Operators

Parentheses denote memory addresses, rather than absolute values.

| Assembly                                        | Name | Usage                                                  |
|-------------------------------------------------|------|--------------------------------------------------------|
| LD A, 12<br>LD A, (7FFFH)<br>LD (7FFFH), A<br>LD (HL), A | Load | Load into destination (1st) from source (2nd) |
|                                                 |      |                                                        |
|                                                 |      |                                                        |