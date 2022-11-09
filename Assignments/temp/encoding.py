OPCODE = {
    "add": 0, "comp": 0,
    "and": 1, "xor": 1,
    "shll": 2, "shrl": 2,
    "shllv": 2, "shrlv": 2,
    "shra": 2, "shrav": 2,
    "addi": 3, "compi": 4,
    "lw": 5, "sw": 6,
    "b": 11, "br": 10,
    "bltz": 7, "bz": 8,
    "bnz": 9, "bl": 12,
    "bcy": 13, "bncy": 14,
}


RFORMATS = {
    "add", "comp",
    "and", "xor",
    "shll", "shrl",
    "shllv", "shrlv",
    "shra", "shrav"}


FUNCODE = {
    "add": 0, "comp": 1,
    "and": 0, "xor": 1,
    "shll": 0, "shrl": 1,
    "shllv": 2, "shrlv": 3,
    "shra": 4, "shrav": 5,
}
