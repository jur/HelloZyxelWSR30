#!/usr/bin/env python3
# convert binary file to realtek bootloader memory write script:
import sys
import struct

instream = sys.stdin
outstream = sys.stdout
address = 0x90500000

if len(sys.argv) > 1:
	address = int(sys.argv[1], 0)
if len(sys.argv) > 2:
	instream = open(sys.argv[2], "rb")
if len(sys.argv) > 3:
	outstream = open(sys.argv[3], "w")

def cmd_ew(address, values):
	print("ew 0x%08X" % (address), file=outstream, end="")
	for value in values:
		print(" 0x%08X" % (value), file=outstream, end="")
	print("", file=outstream)

data = instream.read(4)
values = []
while data:
	value = struct.unpack(">I", data)[0]
	values.append(value)
	data = instream.read(4)

i = 0
l = len(values)
while i < len(values):
	value = values[i]
	cmd_ew(address, values[i:i+4])
	address = address + 4 * 4
	i = i + 4

instream.close()
outstream.close()
