AS:=as
LD:=ld
LDFLAGS:=-nostdlib

ARCH:=

SRCS:=$(wildcard src/$(ARCH)/*.S)
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
	$(LD) $^ -o $(EXEC).$(ARCH) $(LDFLAGS)
	chmod 755 $(EXEC).$(ARCH)
	$(MAKE) clean

clean:
	rm -rf src/*.o

%.o: %.S
	$(AS) $< -o $@
