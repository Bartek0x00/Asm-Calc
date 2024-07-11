AS:=as
ASFLAGS:=-I src/$(ARCH)
LD:=ld
LDFLAGS:=-nostdlib

ARCH:=

SRCS:=$(wildcard src/$(ARCH)/*.S) $(wildcard src/$(ARCH)/*/*.S)
OBJS:=$(SRCS:.S=.o)
EXEC:=calc

.PHONY: help link clean aarch64 x86_64

all: help

help:
	@echo "Usage: make [aarch64|x86_64]"

aarch64: 
	$(MAKE) ARCH=aarch64 link

x86_64: 
	$(MAKE) ARCH=x86_64 link

link: $(OBJS)
	$(LD) $^ -o $(EXEC) $(LDFLAGS)
	chmod 755 $(EXEC)
	$(MAKE) clean

clean:
	find . -name "*.o" -type f -delete

%.o: %.S
	$(AS) $(ASFLAGS) $< -o $@
