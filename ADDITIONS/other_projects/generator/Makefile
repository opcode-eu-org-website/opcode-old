GCC=gcc
CFLAGS=-Wall -ggdb
LDFLAGS=-lm -lasound
SOURCES=main.c config.c help.c signal.c output_alsa.c output_dsp.c output_uC.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=generator

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)
