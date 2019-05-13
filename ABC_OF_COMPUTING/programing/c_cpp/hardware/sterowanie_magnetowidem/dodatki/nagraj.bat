uisp -dprog=dapa -dlpt=0x378 --erase --segment=flash
uisp -dprog=dapa -dlpt=0x378 --upload --segment=flash if=m.hex
uisp -dprog=dapa -dlpt=0x378 --verify --segment=flash if=m.hex
rm m.hex
