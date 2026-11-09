#!/usr/bin/env python
#
# lap_asm.py
#

import sys

from lap_encoder import *

def read_file(fname):
    f = open(fname)
    lines = map(lambda x:x[:-1], f.readlines())
    f.close()
    return list(lines)

def asm(fname):
    lines = read_file(fname)
    program = [ ]
    cross_ref = { }
    try:
        pc = 0
        lineno = 0
        for l in lines:
            lineno += 1
            if len(l) == 0:
                continue
            if (l[0] == ' ')or(l[0] == '\t'):
                #no label
                opcode = encode(l.strip())
                program.append( (opcode, l) )
                pc += 1
            else:
                fields = l.strip().upper().split()
                label = fields[0]
                cross_ref[label] = pc

        for pc in range(0, len(program)):
            (instr, l) = program[pc]
            if type(instr) == tuple:
                label = instr[1]
                target = cross_ref[label]
                relative = target - (pc + 1)
                opcode = instr[0] | (relative & 0x1ff)
                program[pc] = (opcode, l)
    except AsmError as e:
        print(e.message, " in line ", lineno)
        sys.exit(1)
    pc = 0
    for (c,l) in program:
        print( "%4d : %s\t%s" % (pc , ("0000" + (hex(c).lstrip("0x")))[-4:], l ) )
        pc += 1

if __name__ == "__main__":
    asm(sys.argv[1])

