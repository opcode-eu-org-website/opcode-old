include ../Makefile.config

CFLAGS=$(GLOBAL_CFLAGS)
OBJ_WITH_CPP_H=objectsspace.o objectslist.o sceneobject.o
OBJ=$(OBJ_WITH_CPP_H)

all: $(OBJ)

include $(PROJECTPATH)/Makefile.rules

objectsspace.o: objectslist.h space.h space_types.h
objectslist.o: sceneobject.h
sceneobject.o: $(PROJECTPATH)/include/point.h $(PROJECTPATH)/scene_objects/geometryobject.h $(PROJECTPATH)/scene_objects/lightobject.h $(PROJECTPATH)/scene_objects/textureobject.h
