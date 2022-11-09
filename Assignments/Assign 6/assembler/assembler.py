import sys
import re
import json

REGDICT = {}
INSTRUCTION_DICT = {}
OUTPUT_FILE = open("output.txt", "w")

def two_comp(num,nbits):
    '''
    gives nbit long two complement representation of number
    '''
    if num>=0:
        return f"{num:0{nbits}b}"
    else:
        return f"{((1<<nbits)+num):0{nbits}b}"

def spit_line(line):
    try:
        # print(line)
        opcode=INSTRUCTION_DICT[line[0]][0]
        # opc=int(opcode,2)
        # print(opcode)
        if opcode=="000000":
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                rt=f"{REGDICT[line[2]]:05b}"
                shamt=f"{0:010b}"
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                print(f"{opcode}{rs}{rt}{shamt}{funct},", file = OUTPUT_FILE)
        elif opcode=="000010" or opcode=="000011":
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                # dont_care=f"{0:05b}"
                imm_dec=int(line[2])
                imm=two_comp(imm_dec,16)
                print(f"{opcode}{rs}{rs}{imm},", file = OUTPUT_FILE)
        elif opcode=="000001":
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                rs=f"{REGDICT[line[1]]:05b}"
                dont_care=f"{0:010b}"
                shamt = f"{int(line[2]):05b}"
                print(f"{opcode}{rs}{dont_care}{shamt}{funct},", file = OUTPUT_FILE)
        # Load Word and Store Word
        elif opcode=="000110" or opcode=="010110":
            if len(line)!=4:
                print(f"error in line {line}")
                return
            else:
                # print(line)
                rs=f"{REGDICT[line[3]]:05b}"
                rt=f"{REGDICT[line[1]]:05b}"
                addr=f"{int(line[2]):016b}"
                print(f"{opcode}{rs}{rt}{addr},", file = OUTPUT_FILE)
        
        # branch type : 6 + 26
        elif opcode=="100001" or opcode=="110001" or opcode=="100110" or opcode=="100111":
            if len(line)!=2:
                # print(len(line))
                print(f"error in line {line}")
                return
            else:
                addr=f"{int(line[1]):026b}"
                print(f"{opcode}{addr},", file = OUTPUT_FILE)

                # extra_instr = f"{0:032b}"
                # print(f"{extra_instr},", file = OUTPUT_FILE)
        # Immediate type branch
        elif opcode=="100011" or opcode=="100100" or opcode=="100101":
            if len(line)!=3:
                # print(len(line))
                print(f"error in line {line}")
                return
            else:
                # print(len(line))
                rs=f"{REGDICT[line[1]]:05b}"
                dont_care=f"{0:05b}"
                addr=f"{int(line[2]):016b}"
                print(f"{opcode}{rs}{dont_care}{addr},", file = OUTPUT_FILE)

                # extra_instr = f"{0:032b}"
                # print(f"{extra_instr},", file = OUTPUT_FILE)
        # Register type branch
        elif opcode=="100010":
            if len(line)!=2:
                # print(len(line))
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                dont_care=f"{0:021b}"
                print(f"{opcode}{rs}{dont_care},", file = OUTPUT_FILE)

                # extra_instr = f"{0:032b}"
                # print(f"{extra_instr},", file = OUTPUT_FILE)
    except:
        print("sdef")
        print(f"error in line {line}")


def bin_comm(string):
    string = re.sub(re.compile("/'''.*?\'''", re.DOTALL), "", string)
    string = re.sub(re.compile("#.*?\n"), "", string)
    return string


def process(filename):
    print("memory_initialization_radix=2;", file = OUTPUT_FILE)
    print("memory_initialization_vector=", file = OUTPUT_FILE)
    print(f"{0:032b},", file = OUTPUT_FILE)
    with open(filename, 'r') as f:
        lines = f.readlines()
        for line in lines:
            line.strip()
            line = bin_comm(line)
            
            line = line.replace(',',' ').replace(')',' ').replace('(',' ').split()
            if len(line):
                spit_line(line)
    print(f"{0:032b};", file = OUTPUT_FILE)

if __name__ == '__main__':
    with open('instruction.json', 'r') as f:
        INSTRUCTION_DICT = json.load(f)
    with open('register.json', 'r') as f:
        REGDICT = json.load(f)
    process(sys.argv[1])