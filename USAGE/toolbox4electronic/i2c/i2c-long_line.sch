v 20130925 2
N 43800 39900 46100 39900 4
N 45000 41100 45000 41000 4
C 45100 40100 1 90 0 resistor-2.sym
{
T 44800 40300 5 10 1 1 90 0 1
refdes=R42
T 45300 40200 5 10 1 1 90 0 1
value=2k7
T 45100 40100 5 10 0 0 0 0 1
footprint=R025
}
N 45000 40100 45000 39900 4
N 43800 39000 43800 39900 4
C 41700 39400 1 90 0 resistor-2.sym
{
T 41400 39600 5 10 1 1 90 0 1
refdes=R1
T 41900 39500 5 10 1 1 90 0 1
value=2k7
T 41700 39400 5 10 0 0 0 0 1
footprint=R025
}
N 41600 39400 41600 39200 4
N 40500 39200 42200 39200 4
C 41800 38100 1 90 0 capacitor-1.sym
{
T 41300 38300 5 10 1 1 90 0 1
refdes=C1
T 40900 38300 5 10 0 0 90 0 1
symversion=0.1
T 41800 38100 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 41600 39200 41600 39000 4
N 43800 34300 46100 34300 4
N 45000 35500 45000 35400 4
C 45100 34500 1 90 0 resistor-2.sym
{
T 44800 34700 5 10 1 1 90 0 1
refdes=R62
T 45300 34600 5 10 1 1 90 0 1
value=2k7
T 45100 34500 5 10 0 0 0 0 1
footprint=R025
}
N 45000 34500 45000 34300 4
N 43800 33400 43800 34300 4
C 41700 33800 1 90 0 resistor-2.sym
{
T 41400 34000 5 10 1 1 90 0 1
refdes=R2
T 41900 33900 5 10 1 1 90 0 1
value=2k7
T 41700 33800 5 10 0 0 0 0 1
footprint=R025
}
N 41600 33800 41600 33600 4
N 40500 33600 42200 33600 4
C 41800 32500 1 90 0 capacitor-1.sym
{
T 41300 32700 5 10 1 1 90 0 1
refdes=C2
T 40900 32700 5 10 0 0 90 0 1
symversion=0.1
T 41800 32500 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 41600 33600 41600 33400 4
N 41600 38100 41600 38000 4
N 41600 32500 41600 32400 4
C 39300 37600 1 180 0 connector_1x4.sym
{
T 38600 35500 5 10 1 1 180 6 1
refdes=I2C
T 39000 35350 5 10 0 0 180 0 1
footprint=CONNECTOR 1 4
}
N 39300 37200 39300 37100 4
C 39500 37200 1 0 1 net-pwr-1.sym
{
T 39300 37450 5 8 1 1 0 3 1
value=Vcc_A
T 39500 37200 5 10 0 0 180 6 1
net=Vcc_A:1
}
N 39300 35900 39300 35800 4
N 39200 35900 39300 35900 4
N 39200 37100 39300 37100 4
N 39200 36700 40500 36700 4
N 40500 36700 40500 39200 4
N 39200 36300 40500 36300 4
N 40500 36300 40500 33600 4
C 47300 38300 1 180 1 connector_1x4.sym
{
T 47600 36200 5 10 1 1 180 6 1
refdes=longI2C
T 47600 36050 5 10 0 0 180 6 1
footprint=CONNECTOR 1 4
}
N 47300 37900 47300 37800 4
N 47300 36600 47300 36500 4
N 47400 36600 47300 36600 4
N 47400 37800 47300 37800 4
N 47400 37400 46100 37400 4
N 46100 37400 46100 39900 4
N 47400 37000 46100 37000 4
N 46100 37000 46100 34300 4
C 47100 37900 1 0 0 net-pwr-1.sym
{
T 47300 38150 5 8 1 1 0 3 1
value=Vcc_B
T 47100 37900 5 10 0 0 180 0 1
net=Vcc_B:1
}
C 44700 38600 1 90 0 diode-schottky-1.sym
{
T 44200 38900 5 10 1 1 90 0 1
refdes=D1
T 43868 38941 5 10 0 1 90 0 1
footprint=DIODE_LAY 250
}
N 44500 38600 44500 38500 4
N 45500 38600 45500 38500 4
C 44800 35500 1 0 0 net-pwr-1.sym
{
T 45000 35750 5 8 1 1 0 3 1
value=Vcc_B
T 44800 35500 5 10 0 0 180 0 1
net=Vcc_B:1
}
C 44800 41100 1 0 0 net-pwr-1.sym
{
T 45000 41350 5 8 1 1 0 3 1
value=Vcc_B
T 44800 41100 5 10 0 0 180 0 1
net=Vcc_B:1
}
C 39200 35500 1 0 0 net-gnd-1.sym
C 41500 32100 1 0 0 net-gnd-1.sym
C 47200 36200 1 0 0 net-gnd-1.sym
C 41500 37700 1 0 0 net-gnd-1.sym
C 44400 38200 1 0 0 net-gnd-1.sym
C 45400 38200 1 0 0 net-gnd-1.sym
N 45500 39500 45500 39900 4
N 44500 39500 44500 39900 4
C 44700 33000 1 90 0 diode-schottky-1.sym
{
T 44200 33300 5 10 1 1 90 0 1
refdes=D2
T 43868 33341 5 10 0 1 90 0 1
footprint=DIODE_LAY 250
}
N 44500 33000 44500 32900 4
N 45500 33000 45500 32900 4
C 44400 32600 1 0 0 net-gnd-1.sym
C 45400 32600 1 0 0 net-gnd-1.sym
N 45500 33900 45500 34300 4
N 44500 33900 44500 34300 4
N 41600 41700 41600 41600 4
C 41800 41700 1 0 1 net-pwr-1.sym
{
T 41600 41950 5 8 1 1 0 3 1
value=Vcc_A
T 41800 41700 5 10 0 0 180 6 1
net=Vcc_A:1
}
C 41800 40700 1 90 0 jumper-2pin-1.sym
{
T 41300 41000 5 10 1 1 90 0 1
refdes=J1
T 41800 40700 5 10 0 0 90 0 1
footprint=CONNECTOR 2 1
}
N 41600 40700 41600 40300 4
N 41600 35200 41600 34700 4
N 41600 40500 40900 40500 4
N 40900 40500 40900 35200 4
N 41600 35200 40900 35200 4
C 45700 38600 1 90 0 diode-zener-1.sym
{
T 45200 38900 5 10 1 1 90 0 1
refdes=Z1
T 45700 38600 5 10 0 0 0 0 1
footprint=DIODE_LAY 250
T 45700 38600 5 10 0 0 0 0 1
slotdef=1:2,1
T 45700 38600 5 10 0 0 0 0 1
slot=1
T 45700 38600 5 10 0 0 0 0 1
numslots=1
}
C 45700 33000 1 90 0 diode-zener-1.sym
{
T 45200 33300 5 10 1 1 90 0 1
refdes=Z2
T 45700 33000 5 10 0 0 0 0 1
footprint=DIODE_LAY 250
T 45700 33000 5 10 0 0 0 0 1
slotdef=1:2,1
T 45700 33000 5 10 0 0 0 0 1
numslots=1
T 45700 33000 5 10 0 0 0 0 1
slot=1
}
C 43900 38400 1 0 1 bi2uni_directional_transceivers-2.sym
{
T 42800 39900 5 10 1 1 0 6 1
refdes=U1
T 42700 41800 5 10 0 0 0 6 1
footprint=DIL 8 300 100 60 28
T 43500 38600 5 10 1 1 180 0 1
value=P82B96
}
C 43900 32500 1 0 1 bi2uni_directional_transceivers-1.sym
{
T 43500 34800 5 10 1 1 0 6 1
refdes=U1
T 42700 35900 5 10 0 0 0 6 1
footprint=DIL 8 300 100 60 28
T 42300 33500 5 10 1 1 90 8 1
value=P82B96
}
N 43000 34800 43000 34700 4
N 43000 32600 43000 32500 4
C 43200 34800 1 0 1 net-pwr-1.sym
{
T 43200 34800 5 10 0 0 180 6 1
net=Vcc_A:1
T 43000 35050 5 8 1 1 0 3 1
value=Vcc_B
}
C 42900 32200 1 0 0 net-gnd-1.sym
