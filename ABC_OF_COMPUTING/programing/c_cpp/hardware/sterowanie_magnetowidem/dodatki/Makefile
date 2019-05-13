# KOMPILACJA
%.o: %.c
	avr-gcc -mmcu=at90s2313 -O2 -c $<

#ASEMBLARYZACJA
%.s: %.c
	avr-gcc -mmcu=at90s2313 -O2 -S $<

#LINKOWANIE z poleceniem zachowania pliku mapy
%.elf: %.o
	avr-ld -Map m.map --section-start .init=0 -o $@ $< /opt/avrgcc/avr/lib/crts2313.o


#PRODUKCJA PLIKU HEX
%.hex: %.elf
#	avr-objcopy -O ihex $< $@
	avr-objcopy -O ihex $< m.hex