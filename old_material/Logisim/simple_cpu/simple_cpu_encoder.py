#
# lap_encoder.py
#

class AsmError(Exception):

    def __init__(self, uMsg):
        super().__init__(self, uMsg)
        self.message = uMsg


def verify(b,msg):
    if not(b):
        raise AsmError(msg)

REGS = \
    { "R0" : 0,
      "R1" : 1,
      "R2" : 2,
      "R3" : 4 }

OPCODES = \
        { "ADD" : 0b000,
          "SUB" : 0b001,
          "MUL" : 0b010,
          "DIV" : 0b011 }

BRANCHES = \
        { "B" : 0b000,
          "BEQ" : 0b001,
          "BNE" : 0b010,
          "BLT" : 0b011,
          "BGT" : 0b011 }

def encode_reg(s):
    return REGS[s]


def encode(s):
    s = s.upper()
    f = s.split()
    verify(len(f) >= 1, "Invalid instruction")
    if f[0] == "HLT":
        instr = 0xffff
    elif f[0] == "MOV":
        verify(len(f) >= 2, "Invalid Operand")
        p = f[1].strip().split(",")
        verify(len(p) >= 2, "Invalid Operand")
        rd = encode_reg(p[0])
        if p[1][0] == "#":
            const = int(p[1][1:])
            instr = 0x9000 | (rd << 9) | const
        else:
            rs = encode_reg(p[1])
            instr = 0x8000 | (rd << 9) | (rs << 6)
    elif f[0] == "CMP":
        verify(len(f) >= 2, "Invalid Operand")
        p = f[1].strip().split(",")
        verify(len(p) >= 2, "Invalid Operand")
        rd = encode_reg(p[0])
        if p[1][0] == "#":
            const = int(p[1][1:])
            instr = 0xb000 | (rd << 9) | const
        else:
            rs = encode_reg(p[1])
            instr = 0xa000 | (rd << 9) | (rs << 6)
    elif f[0][0] == "B":
        verify(len(f) >= 2, "Invalid Operand")
        instr = (0xc000 | (BRANCHES[f[0]] << 9), f[1])
    else:
        verify(len(f) >= 2, "Invalid Operand")
        p = f[1].strip().split(",")
        opcode = OPCODES[f[0]]
        verify(len(p) >= 3, "Invalid Operand")
        rd = encode_reg(p[0])
        rs1 = encode_reg(p[1])
        if p[2][0] == "#":
            const = int(p[2][1:])
            instr = (opcode << 13) | (1 << 12) | (rd << 9) | (rs1 << 6) | const
        else:
            rs2 = encode_reg(p[2])
            instr = (opcode << 13) | (rd << 9) | (rs1 << 6) | (rs2 << 3)
    return instr


if __name__ == "__main__":
    while True:
        s = input("Enter ASM Line> ")
        print("Opcode:",hex(encode(s)),"\n")

