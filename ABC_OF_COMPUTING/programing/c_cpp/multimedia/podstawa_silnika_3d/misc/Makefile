include ../Makefile.config

CFLAGS=$(GLOBAL_CFLAGS)
OBJ_WITH_CPP_H=global.o input.o config.o camera.o
OBJ=$(OBJ_WITH_CPP_H)

all: $(OBJ)

include $(PROJECTPATH)/Makefile.rules

global.o: config.h input.h camera.h
input.o: global.h config.h camera.h
