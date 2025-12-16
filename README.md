# 16-Bit-RISC-V-Microprocessor-
This project is a 16-Bit RISC V microprocessor designed in Verilog. The core design encompasses the Control Unit, Datapath Unit, the Instruction and Data Memory modules, the ALU, and the Register File unit. It employs a standard RISC-V instruction set, composed of R-type instructions, I-type (immediate) instructions, load/store instructions, and control flow instructions like branch and jump.

## Instructions and ISA
* LOAD WORD
* STORE WORD
* SUBTRACT
* Logic AND
* Logical OR
* Logical SHIFT RIGHT
* Logical SHIFT LEFT
* Bitwise AND
* Bitwise OR
* INVERT
* BRANCH


| Load   | Opcode :4 bits | Ra: 3 bits      | Rb: 3 bits | Offset: 6 bits          |                    |
|--------|----------------|-----------------|------------|-------------------------|--------------------|
| R-Type | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits | Rdest: 3 bits           | Don’t care: 3 bits |
| ADDI   | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits | Immediate Value: 6 bits |                    |
| Store  | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits | Offset: 6 bits          |                    |
| Branch | Opcode: 4 bits | Ra: 4 bits      | Rb: 4      | Offset: 6               |                    |
| Jump   | Opcode: 4 bits | Offset: 12 bits |            |                         |                    |



## Datapath Diagram ( From Computer Organization and Design RISC-V Edition: The Hardware Software Interface by David A. Patterson and John L.Hennessy, Second Edition)
* ADD<img width="455" height="288" alt="Screenshot 2025-11-12 at 4 42 58 PM" src="https://github.com/user-attachments/assets/beec64bc-2c64-45e6-a85c-22813af48429" />



| Load   | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
|--------|----------------|-----------------|------------|-------------------------|--------------------|
| R-type | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits | Rdest: 3 bits           | Don't care: 3 bits |
| ADDI   | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                Immediate Value: 6 bits       |
| Store  | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
| Branch | Opcode: 4 bits | Ra: 3 bits      | Rb: 3 bits |                  Offset: 6 bits              |
| Jump   | Opcode: 4 bits |                                                 Offset: 12 bits             |


## Control Signals ##

| Control Signals |         |         |            |           |           |           |        |        |      |
|:---------------:|:-------:|:-------:|:----------:|:---------:|:---------:|:---------:|:------:|:------:|:----:|
| Instruction     | Reg Dst | ALU Src | Mem to reg | Reg write | Mem read  | Mem write | Branch | ALU op | Jump |
| R-type          | 1       | 0       | 0          | 1         | 0         | 0         | 0      | 00     | 0    |
| LW              | 0       | 1       | 1          | 1         | 1         | 0         | 0      | 01     | 0    |
| SW              | 0       | 1       | 0          | 0         | 0         | 1         | 0      | 01     | 0    |
| BEQ, BNE        | 0       | 0       | 0          | 0         | 0         | 0         | 1      | 10     | 0    |
| J               | 0       | 0       | 0          | 0         | 0         | 0         | 0      | 00     | 1    |

