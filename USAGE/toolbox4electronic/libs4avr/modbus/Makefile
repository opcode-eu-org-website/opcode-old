# project options
MCU_FOR_GCC      = atmega8
MCU_FOR_AVRDUDE  = m8
MCU_FREQUENCY_Hz = 3000000

# modbus options
MODBUS_OBJ = modbus/mb.o \
             modbus/rtu/mbrtu.o \
             modbus/rtu/mbcrc.o \
             modbus/functions/mbfuncholding.o \
             modbus/functions/mbfuncinput.o \
             modbus/functions/mbfuncother.o \
             modbus/functions/mbfuncdisc.o \
             modbus/functions/mbutils.o
MODBUS_INC = -I. -Imodbus/rtu -Imodbus/include

# C compilation flags
CFLAGS = -Os -Wall -Wshadow -Wstrict-prototypes


# internal setting of makefile
MAKEFLAGS += --no-builtin-rules
.PHONY: flash clean help
.SUFFIXES:
.PRECIOUS: %.o %.hex


# calling with project_name and optional "flash" as `make` arguments
FLASH =
ifneq ($(filter flash, $(MAKECMDGOALS)),)
	FLASH = %.flash
endif

%: %.hex $(FLASH) ;


help:
	@echo "USAGE:"
	@echo " - for build:                   make \033[4mproject_name\033[0m"
	@echo " - for build and flash:         make \033[4mproject_name\033[0m flash"
	@echo " - for build for other clock:   make \033[4mproject_name\033[0m MCU_FREQUENCY_Hz=\033[4mclock_value\033[0m"
	@echo " - for remove generated files:  make clean"

# compile, linking, etc rules for AVR with modbus ...
%.o: %.c
	avr-gcc -mmcu=$(MCU_FOR_GCC) -DF_CPU=$(MCU_FREQUENCY_Hz)UL $(MODBUS_INC) $(CFLAGS) -c $< -o $@

%.out: %.o $(MODBUS_OBJ)
	avr-gcc -mmcu=$(MCU_FOR_GCC) -DF_CPU=$(MCU_FREQUENCY_Hz)UL $^ -o $@

%.hex: %.out
	avr-objcopy -O ihex $< $@

%.flash: %.hex
	sudo avrdude -c usbasp -p $(MCU_FOR_AVRDUDE) -U flash:w:$<

clean:
	rm -f *.o *.out $(MODBUS_OBJ)
	rm -i *.hex
