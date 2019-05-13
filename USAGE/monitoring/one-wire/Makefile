CROSS=/home/user/ARMLinux/buildroot/build_arm/staging_dir/bin/arm-linux-
CROSS_CFLAGS=-D IPv4ONLY

ALLAPP = 1wire_temperatura

SQLLIBS = /home/user/ARMLinux/buildroot/build_arm/staging_dir/lib/libsqlite3.a
SQLINCLUDE = ../libsqlite3

CC = $(CROSS)gcc

CFLAGS = -Wall -Os -fomit-frame-pointer -DLINUX -D_GNU_SOURCE
LDFLAGS = -s -Wl,-warn-common -lc

.c.o:
	@echo Compile... $<
	@$(CC) $(CROSS_CFLAGS) $(CFLAGS) -I. -I$(SQLINCLUDE) -c -o $@ $<

all: $(ALLAPP)
	@rm -f *.o *.gdb
	
1wire_temperatura: 1wire_temperatura.o zabbix.o
	@echo Link... $@
	@$(CC) $(CROSS_CFLAGS) $(CFLAGS) -pthread -lm -o $@ $^ -lpthread $(LDFLAGS) $(SQLLIBS)
	@echo Strip... $@
	@$(CROSS)strip $@
	@$(CROSS)size $@
	@echo Done.

clean:
	@rm -fr *.o *.gdb $(ALLAPP)
