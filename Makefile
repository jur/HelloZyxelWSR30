CROSSCOMPILE = mips-linux-gnu-
CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
CPP = $(CROSSCOMPILE)cpp
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy

MODS = hello uart
OBJS = $(addsuffix .o,$(MODS))

CPPFLAGS += -mno-abicalls -fno-pic -O2

PROGRAM = hello

.PHONY: all clean

all: $(PROGRAM).bin $(PROGRAM)-run-script.txt

clean:
	rm -f $(PROGRAM).elf $(PROGRAM).bin $(PROGRAM)-run-script.txt $(OBJS)

$(PROGRAM).bin: $(PROGRAM).elf
	$(OBJCOPY) -O binary -j .text -j .data -j .rodata -j .bss $^ $@

hello-run-script.txt: $(PROGRAM).bin
	./create-run-script.sh 0x90500000 $^ $@ $(CROSSCOMPILE)

$(PROGRAM).elf: $(OBJS)
	$(LD) $(LDFLAGS) -Tld-script -o $@ $^
