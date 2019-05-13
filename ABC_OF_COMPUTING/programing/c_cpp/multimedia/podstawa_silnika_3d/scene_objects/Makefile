include ../Makefile.config

CFLAGS=$(GLOBAL_CFLAGS)
OBJ_WITH_CPP_H=geometryobject.o vertexpoint.o textureobject.o
OBJ=$(OBJ_WITH_CPP_H)

all: $(OBJ)

include $(PROJECTPATH)/Makefile.rules

geometryobject.o: vertexpoint.h
