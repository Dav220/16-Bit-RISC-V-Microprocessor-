# 16-Bit-RISC-V-Microprocessor-
This project is a 16-Bit RISC V microprocessor designed in Verilog. The core design encompasses the Control Unit, Datapath Unit, the Instruction and Data Memory modules, the ALU, and the Register File unit. It employs a standard RISC-V instruction set, composed of R-type instructions, I-type (immediate) instructions, load/store instructions, and control flow instructions like branch and jump.

## Instructions and ISA
* LOAD WORD
* STORE WORD
* ADD<img width="455" height="288" alt="Screenshot 2025-11-12 at 4 42 58 PM" src="https://github.com/user-attachments/assets/beec64bc-2c64-45e6-a85c-22813af48429" />
<img width="455" height="288" alt="Screenshot 2025-11-12 at 4 42 58 PM" src="https://github.com/user-attachments/assets/beec64bc-2c64-45e6-a85c-22813af48429" />

* SUBTRACT
* Logic AND
* Logical OR
* Logical SHIFT RIGHT
* Logical SHIFT LEFT
* Bitwise AND
* Bitwise OR
* INVERT
* BRANCH

Load: : Opcode :4 bits
Ra: 3 bits
Rb: 3 bits
Offset: 6 bits


R-type: : Opcode: 4 bits
Ra: 3 bits
Rb: 3 bits
Rdest: 3 bits
Don’t care: 3 bits
ADDI:: Opcode: 4 bits
Ra: 3 bits
Rb: 3 bits
Immediate Value: 6 bits


Store: Opcode: 4 bits
Ra: 3 bits
Rb: 3 bits
Offset: 6 bits
Branch: Opcode: 4 bits
Ra: 4 bits
Rb: 4
Offset: 6
Jump: Opcode: 4 bits
Offset: 12 bits
ffg

| Load   | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
|--------|----------------|-----------------|------------|-------------------------|--------------------|
| R-type | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits | Rdest: 3 bits           | Don't care: 3 bits |
| ADDI   | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                Immediate Value: 6 bits       |
| Store  | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
| Branch | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
| Jump   | Opcode: 4 bits |                                                 Offset: 12 bits             |                           



