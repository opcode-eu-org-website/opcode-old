CROSS=/home/user/ARMLinux/buildroot/build_arm/staging_dir/bin/arm-linux-
CROSS_CFLAGS=-D IPv4ONLY

ALLAPP = sms_queue_add sms_queued smtp_listener nullmailer

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

nullmailer:
	./nullmailer.build.sh
	
sms_queue_add: sms_queue_add.o
	@echo Link... $@
	@$(CC) $(CROSS_CFLAGS) $(CFLAGS) -pthread -o $@ $^ -lpthread $(LDFLAGS) $(SQLLIBS)
	@echo Strip... $@
	@$(CROSS)strip $@
	@$(CROSS)size $@
	@echo Done.

sms_queued: sms_queued.o
	@echo Link... $@
	@$(CC) $(CROSS_CFLAGS) $(CFLAGS) -pthread -o $@ $^ -lpthread $(LDFLAGS) $(SQLLIBS)
	@echo Strip... $@
	@$(CROSS)strip $@
	@$(CROSS)size $@
	@echo Done.
	
smtp_listener: smtp_listener.o smtp_talk.o
	@echo Link... $@
	@$(CC) $(CROSS_CFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(SQLLIBS)
	@echo Strip... $@
	@$(CROSS)strip $@
	@$(CROSS)size $@
	@echo Done.

clean:
	@rm -fr *.o *.gdb $(ALLAPP)
