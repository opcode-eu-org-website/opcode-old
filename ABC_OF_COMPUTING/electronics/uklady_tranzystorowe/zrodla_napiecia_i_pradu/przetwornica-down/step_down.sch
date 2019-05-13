v 20130925 2
C 44000 45600 1 90 0 transistor-npn-2.sym
{
T 43500 46200 5 10 1 1 90 0 1
refdes=Q1
}
T 47900 45400 9 10 1 0 90 4 1
LOAD
N 47900 46200 47900 45800 4
C 47800 44500 1 0 0 net-gnd-1.sym
C 46300 46300 1 180 0 coil-2.sym
{
T 46100 46000 5 10 1 1 180 0 1
refdes=L1
T 46100 45600 5 10 0 0 180 0 1
symversion=0.1
}
C 45200 44800 1 90 0 diode-generic-1.sym
{
T 45500 45200 5 10 1 1 180 0 1
refdes=D1
}
C 46700 46100 1 0 0 terminal-in_line.sym
{
T 47010 46700 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 47250 46350 5 10 1 1 0 6 1
refdes=T1
}
C 44900 44500 1 0 0 net-gnd-1.sym
N 47400 46200 47900 46200 4
C 43200 44400 1 0 0 EMBEDDEDvpulse-1.sym
[
T 43900 45050 8 10 0 1 0 0 1
refdes=V?
T 43900 45250 5 10 0 0 0 0 1
device=vpulse
T 43900 45450 5 10 0 0 0 0 1
footprint=none
T 43900 45650 5 10 0 0 0 0 1
numslots=0
T 43900 45850 5 10 0 0 0 0 1
description=pulse power source, generator
P 43500 45600 43500 45300 1 0 0
{
T 43550 45400 5 8 1 1 0 0 1
pinnumber=1
T 43550 45400 5 8 0 1 0 2 1
pinseq=1
T 43500 45250 9 8 1 1 0 5 1
pinlabel=+
T 43500 45100 5 8 0 1 0 5 1
pintype=pwr
}
P 43500 44400 43500 44700 1 0 0
{
T 43550 44500 5 8 1 1 0 0 1
pinnumber=2
T 43550 44500 5 8 0 1 0 2 1
pinseq=2
T 43500 44750 9 8 1 1 0 3 1
pinlabel=-
T 43500 44900 5 8 0 1 0 3 1
pintype=pwr
}
V 43500 45000 300 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 43900 44850 5 10 0 1 0 0 1
value=pulse 0 1 10n 10n 100n 1u 2u
T 43900 44650 5 10 0 1 0 0 1
comment=syntax: pulse v1 v2 td tr tf pw per
L 43575 45075 43425 45075 3 0 0 0 -1 -1
L 43575 45075 43575 44925 3 0 0 0 -1 -1
L 43575 44925 43700 44925 3 0 0 0 -1 -1
L 43425 45075 43425 44925 3 0 0 0 -1 -1
L 43425 44925 43300 44925 3 0 0 0 -1 -1
]
{
T 43900 45050 5 10 1 1 0 0 1
refdes=STER
T 43900 45450 5 10 0 0 0 0 1
footprint=none
T 43900 44850 5 10 0 1 0 0 1
value=pulse 0 1 10n 10n 100n 1u 2u
}
C 43400 44100 1 0 0 net-gnd-1.sym
N 43000 46200 42600 46200 4
N 42600 46200 42600 46400 4
N 44000 46200 45300 46200 4
N 45000 45700 45000 46200 4
C 46400 45700 1 270 0 capacitor-4.sym
{
T 46900 45500 5 10 1 1 270 0 1
refdes=C1
T 47100 45500 5 10 0 0 270 0 1
symversion=0.1
}
N 46600 46200 46600 45700 4
C 46500 44500 1 0 0 net-gnd-1.sym
N 46300 46200 46800 46200 4
N 47900 44800 47900 45000 4
C 42400 46400 1 0 0 net-pwr-1.sym
{
T 42600 46750 5 9 1 1 0 5 1
value=Vcc
}
