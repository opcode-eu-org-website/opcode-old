v 20130925 2
C 43900 49000 1 270 0 capacitor-2.sym
{
T 44400 48800 5 10 1 1 270 0 1
refdes=C12
T 44800 48800 5 10 0 0 270 0 1
symversion=0.1
T 43900 49000 5 10 0 0 0 0 1
footprint=RADIAL_CAN 300 1
}
C 43200 49000 1 270 0 capacitor-1.sym
{
T 43700 48800 5 10 1 1 270 0 1
refdes=C11
T 44100 48800 5 10 0 0 270 0 1
symversion=0.1
T 43200 49000 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 42800 49200 45100 49200 4
N 43400 49200 43400 49000 4
N 44100 49200 44100 49000 4
C 43300 47700 1 0 0 net-gnd-1.sym
C 44000 47700 1 0 0 net-gnd-1.sym
C 41100 42900 1 0 0 net-gnd-1.sym
N 41200 43200 41200 43400 4
N 41200 43400 41400 43400 4
N 43400 48100 43400 48000 4
N 44100 48100 44100 48000 4
C 45600 43200 1 270 0 battery-1.sym
{
T 46100 42900 5 10 1 1 270 0 1
refdes=B1
T 46900 42900 5 10 0 0 270 0 1
symversion=0.1
T 45600 43200 5 10 0 0 0 0 1
footprint=CONNECTOR_SCREW_50 2
}
C 43100 43000 1 0 0 EMBEDDEDdc-dc.sym
[
B 43302 42999 800 800 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 43300 43400 43100 43400 1 0 1
P 44100 43400 44300 43400 1 0 1
L 43300 43000 44100 43800 15 0 0 0 -1 -1
L 43720 43620 43400 43620 3 0 0 0 -1 -1
L 43720 43580 43640 43580 3 0 0 0 -1 -1
L 43600 43580 43520 43580 3 0 0 0 -1 -1
L 43480 43580 43400 43580 3 0 0 0 -1 -1
L 43650 43850 43750 43800 3 0 0 0 -1 -1
L 43750 43800 43650 43750 3 0 0 0 -1 -1
L 44000 43220 43680 43220 3 0 0 0 -1 -1
L 43760 43180 43680 43180 3 0 0 0 -1 -1
L 43880 43180 43800 43180 3 0 0 0 -1 -1
L 44000 43180 43920 43180 3 0 0 0 -1 -1
]
N 42800 43400 43100 43400 4
N 44300 43400 50900 43400 4
C 45700 42100 1 0 0 net-gnd-1.sym
N 45800 42500 45800 42400 4
C 51600 45800 1 90 0 diode-schottky-1.sym
{
T 51800 46600 5 10 1 1 180 0 1
refdes=D11
T 51600 45800 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
N 47400 48300 49100 48300 4
N 50900 49200 50900 47000 4
C 49800 46800 1 180 1 transistor-pmosfet-1.sym
{
T 49900 46800 5 10 1 1 180 6 1
refdes=Q11
}
N 50900 43400 50900 45600 4
C 47700 42300 1 90 0 diode-zener-1.sym
{
T 47200 42600 5 10 1 1 90 0 1
refdes=Z12
T 47700 42300 5 10 1 1 0 0 1
value=21V
T 47700 42300 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
C 47400 41900 1 0 0 net-gnd-1.sym
N 47500 42300 47500 42200 4
N 49800 46300 49100 46300 4
C 47600 45200 1 90 0 diode-zener-1.sym
{
T 47100 45500 5 10 1 1 90 0 1
refdes=Z11
T 47600 45200 5 10 1 1 0 0 1
value=21V
T 47600 45200 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
C 47500 46500 1 90 0 resistor-2.sym
{
T 47200 46700 5 10 1 1 90 0 1
refdes=R11
T 47500 46500 5 10 0 0 0 0 1
footprint=R025
}
N 47400 46500 47400 46100 4
N 47400 47400 47400 48300 4
N 47400 45000 47400 45200 4
C 48500 47500 1 180 1 transistor-pnp-1.sym
{
T 48500 47400 5 10 1 1 180 6 1
refdes=Q12
}
C 48100 46800 1 270 0 resistor-2.sym
{
T 48400 46600 5 10 1 1 270 0 1
refdes=R12
T 48100 46800 5 10 0 0 0 0 1
footprint=R025
}
N 48200 47000 48500 47000 4
C 49200 45200 1 90 0 resistor-2.sym
{
T 48900 45400 5 10 1 1 90 0 1
refdes=R13
T 49200 45200 5 10 0 0 0 0 1
footprint=R025
}
N 49100 46500 49100 46100 4
C 48200 44500 1 0 0 net-gnd-1.sym
N 49100 47500 49100 48300 4
N 48300 48300 48300 49200 4
N 47400 45000 49100 45000 4
N 49100 45000 49100 45200 4
N 48300 44800 48300 45000 4
N 47400 46300 47900 46300 4
N 47900 46300 47900 45700 4
N 47900 45700 48200 45700 4
N 48200 45700 48200 45900 4
N 48200 46800 48200 47000 4
N 47500 43400 47500 43200 4
N 50400 45800 50400 45600 4
N 50400 45600 51400 45600 4
N 51400 45600 51400 45800 4
N 50400 46800 50400 47000 4
N 50400 47000 51400 47000 4
N 51400 47000 51400 46700 4
B 45600 44500 3900 4200 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 46800 44600 9 10 1 0 90 0 5
zadaniem układu jest sterowanie Q1:
gdy Vout1 == 23V (zasilanie z sieci) to na bramkę
       podajemy prawie 23V czyli Q1 jest zamknięty
gdy Vout1 =< 20.7V (zasilanie z akumulatorów to
       na bramkę podajemy 0V czyli Q1 jest otwarty
C 45100 49200 1 0 0 fuse-1.sym
{
T 45300 49400 5 10 1 1 0 0 1
refdes=F1
T 45300 49800 5 10 0 0 0 0 1
symversion=0.1
T 45100 49200 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 46000 49200 62400 49200 4
T 49400 43200 9 10 1 0 180 0 5
zabezpieczenie
przed podaniem
zbyt wysokiego
napięcia na
akumulatory
B 46900 41700 2700 1900 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
N 45800 43200 45800 43400 4
C 42200 45700 1 0 1 transformer-1.sym
{
T 41900 47000 5 10 1 1 0 6 1
refdes=Tr1
T 42200 45700 5 10 0 0 0 0 1
footprint=CONNECTOR_SCREW_50 2
}
N 42100 44200 42100 44100 4
N 42100 42700 42100 42600 4
N 42300 47000 42300 46800 4
N 42300 45600 42300 45800 4
N 42200 46800 42300 46800 4
N 42200 45800 42300 45800 4
C 62400 48600 1 270 1 transistor-pmosfet-1.sym
{
T 62600 48600 5 10 1 1 270 8 1
refdes=Q31
T 63400 49500 5 10 1 1 0 6 1
value=IRF9Z34N
T 62400 48600 5 10 0 0 0 6 1
footprint=TO220STAND_WIDE2
}
N 44100 49600 44100 49200 4
N 50900 49200 50900 49600 4
N 45800 43800 45800 43400 4
C 61300 44400 1 90 0 resistor-2.sym
{
T 61000 44600 5 10 1 1 90 0 1
refdes=R31
T 61300 44400 5 10 1 1 0 0 1
value=100k
T 61300 44400 5 10 0 0 0 0 1
footprint=R025
}
C 63300 43700 1 180 0 resistor-2.sym
{
T 63100 43400 5 10 1 1 180 0 1
refdes=R32
T 63000 43900 5 10 1 1 180 0 1
value=100k
T 63300 43700 5 10 0 0 0 0 1
footprint=R025
}
N 63300 43600 64800 43600 4
C 64800 43500 1 0 0 EMBEDDEDoutput-1.sym
[
P 64800 43600 65000 43600 1 0 0
{
T 65050 43550 5 6 0 1 0 0 1
pinnumber=1
T 65050 43550 5 6 0 0 0 0 1
pinseq=1
}
L 65000 43700 65000 43500 3 0 0 0 -1 -1
L 65000 43700 65500 43700 3 0 0 0 -1 -1
L 65500 43700 65600 43600 3 0 0 0 -1 -1
L 65600 43600 65500 43500 3 0 0 0 -1 -1
L 65500 43500 65000 43500 3 0 0 0 -1 -1
T 64900 43800 5 10 0 0 0 0 1
device=OUTPUT
]
{
T 65000 43700 5 10 1 1 0 0 1
refdes=Vout
}
N 64100 43600 64100 49200 4
N 63400 49200 64100 49200 4
N 57700 43600 62400 43600 4
N 62000 43600 62000 44400 4
N 61200 43600 61200 44400 4
N 62000 45300 62000 49200 4
N 61000 45800 62900 45800 4
N 62900 45800 62900 48600 4
C 61800 45300 1 270 0 diode-generic-1.sym
{
T 62300 45000 5 10 1 1 270 0 1
refdes=D31
T 61800 45300 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
C 58900 48100 1 90 0 resistor-2.sym
{
T 58600 48300 5 10 1 1 90 0 1
refdes=R34
T 58900 48100 5 10 1 1 0 0 1
value=100k
T 58900 48100 5 10 0 0 0 0 1
footprint=R025
}
C 58900 45900 1 90 0 resistor-2.sym
{
T 58600 46100 5 10 1 1 90 0 1
refdes=R36
T 58900 45900 5 10 1 1 0 0 1
value=240k
T 58900 45900 5 10 0 0 0 0 1
footprint=R025
}
C 58700 47900 1 270 0 resistor-variable-2.sym
{
T 58600 47250 5 10 1 1 90 0 1
refdes=R35
T 59000 47500 5 10 1 1 0 0 1
value=10k
T 58700 47900 5 10 0 0 0 0 1
footprint=R_AJ_V
}
N 58800 49000 58800 49200 4
N 58800 48100 58800 47900 4
N 58800 47000 58800 46800 4
N 61200 45300 61200 49200 4
C 57900 45900 1 90 0 capacitor-1.sym
{
T 57500 46500 5 10 1 1 90 0 1
refdes=C31
T 57000 46100 5 10 0 0 90 0 1
symversion=0.1
T 57900 45800 5 10 1 1 90 0 1
value=100n
T 57900 45900 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 59300 47400 59500 47400 4
N 59500 47400 59500 46000 4
N 59500 46000 59600 46000 4
N 58800 45900 58800 44100 4
N 57000 44100 60300 44100 4
N 60300 45200 60300 44100 4
N 60300 46400 60300 49200 4
C 57800 44400 1 90 0 resistor-2.sym
{
T 57500 44600 5 10 1 1 90 0 1
refdes=R33
T 58000 44700 5 10 1 1 90 0 1
value=1M
T 57800 44400 5 10 0 0 0 0 1
footprint=R025
}
T 60000 43500 9 10 1 0 0 5 2
tutaj mamy Vout1 pomniejszony o 1/2 spadku
napięcia na Q31 (dzielnik na R31 i R32)
T 63800 42000 9 10 1 0 180 2 4
układ czasowy C31, R33 decyduje o szybkości zadziałania zabezpieczenia

dzielnik R34, R35, R36 decyduje o prądzie zadziałania zabezpieczenia
(dzięki stałemu potencjałowi na nim prąd ten NIE zależy od watości Vout1)
C 57200 48000 1 90 0 diode-zener-1.sym
{
T 56700 48300 5 10 1 1 90 0 1
refdes=Z31
T 57200 48000 5 10 1 1 0 0 1
value=9V
T 57200 48000 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
C 57100 42900 1 90 0 resistor-2.sym
{
T 56800 43100 5 10 1 1 90 0 1
refdes=R34
T 57100 42900 5 10 1 1 0 0 1
value=47k
}
N 57000 43800 57000 48000 4
C 56900 42300 1 0 0 net-gnd-1.sym
N 57000 42900 57000 42600 4
N 57000 48900 57000 49200 4
N 57700 45600 59600 45600 4
N 57700 45300 57700 45900 4
N 57700 44400 57700 43600 4
N 57700 46800 57700 49200 4
B 55500 41800 9100 8200 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 57500 49700 9 10 1 0 0 0 1
ZABEZPIECZENIE ZWARCIOWE i NADPRĄDOWE
N 54700 45600 57700 45600 4
N 57000 44100 53400 44100 4
C 53000 47500 1 90 0 resistor-2.sym
{
T 52700 47700 5 10 1 1 90 0 1
refdes=R53
T 53000 47500 5 10 1 1 0 0 1
value=1M
T 53000 47500 5 10 0 0 0 0 1
footprint=R025
}
C 53900 46800 1 90 0 resistor-2.sym
{
T 53600 47000 5 10 1 1 90 0 1
refdes=R52
T 53900 46800 5 10 1 1 0 0 1
value=100k
T 53900 46800 5 10 0 0 0 0 1
footprint=R025
}
C 53900 48100 1 90 0 resistor-2.sym
{
T 53600 48300 5 10 1 1 90 0 1
refdes=R51
T 53900 48700 5 10 1 1 0 0 1
value=100k
T 53900 48100 5 10 0 0 0 0 1
footprint=R025
}
C 54100 48400 1 180 1 transistor-pnp-1.sym
{
T 54100 48300 5 10 1 1 180 6 1
refdes=Q51
}
N 54700 48400 54700 49200 4
N 54700 45600 54700 47400 4
N 53800 48100 53800 47700 4
N 54100 47900 53800 47900 4
N 53800 49000 53800 49200 4
C 54000 45700 1 90 0 capacitor-1.sym
{
T 53600 46300 5 10 1 1 90 0 1
refdes=C51
T 53100 45900 5 10 0 0 90 0 1
symversion=0.1
T 54000 45600 5 10 1 1 90 0 1
value=100n
T 54000 45700 5 10 0 0 0 0 1
footprint=AXIAL_LAY 200
}
N 53800 46800 53800 46600 4
N 52900 48400 52900 49200 4
N 52900 47500 52900 45500 4
N 52900 45500 53800 45500 4
N 53800 45700 53800 45500 4
C 53400 44300 1 90 0 EMBEDDEDswitch-pushbutton-no-1.sym
[
T 53100 44700 8 10 0 1 90 0 1
refdes=S?
P 53400 44300 53400 44450 1 0 0
{
T 53350 44350 5 8 1 1 90 0 1
pinnumber=1
T 53350 44350 5 8 0 0 90 0 1
pinseq=1
T 53350 44350 5 8 0 1 90 0 1
pinlabel=1
T 53350 44350 5 8 0 1 90 0 1
pintype=pas
}
P 53400 45150 53400 45300 1 0 1
{
T 53350 45200 5 8 1 1 90 0 1
pinnumber=2
T 53350 45200 5 8 0 0 90 0 1
pinseq=2
T 53350 45200 5 8 0 1 90 0 1
pinlabel=2
T 53350 45200 5 8 0 1 90 0 1
pintype=pas
}
L 53400 44450 53400 44625 3 0 0 0 -1 -1
L 53400 45150 53400 44975 3 0 0 0 -1 -1
L 53315 44600 53315 45000 3 0 0 0 -1 -1
V 53400 44639 14 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 53400 44962 14 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 53145 44770 53145 44820 3 0 0 0 -1 -1
L 53195 44770 53195 44820 3 0 0 0 -1 -1
L 53195 44770 53245 44795 3 0 0 0 -1 -1
L 53195 44820 53245 44795 3 0 0 0 -1 -1
L 53195 44795 53145 44795 3 0 0 0 -1 -1
L 53245 44795 53314 44795 3 0 0 0 -1 -1
T 52800 44700 8 10 0 0 90 0 1
device=SWITCH_PUSHBUTTON_NO
]
{
T 53600 44500 5 10 1 1 90 0 1
refdes=RESET
T 53400 44300 5 10 0 0 0 0 1
footprint=CONNECTOR 1 2
}
N 53400 45300 53400 45500 4
N 53400 44300 53400 44100 4
C 57100 39600 1 180 0 resistor-2.sym
{
T 56900 39300 5 10 1 1 180 0 1
refdes=R74
T 56900 39800 5 10 1 1 180 0 1
value=100k
T 57100 39600 5 10 0 0 0 0 1
footprint=R025
}
N 56100 40300 56100 45600 4
N 55700 39500 55700 44100 4
C 62600 39100 1 0 1 transistor-npn-1.sym
{
T 61700 39600 5 10 1 1 0 6 1
refdes=Q71
}
C 64300 39800 1 90 0 diode-schottky-1.sym
{
T 64500 40600 5 10 1 1 180 0 1
refdes=D71
T 64300 39800 5 10 0 0 0 0 1
footprint=DIODE_LAY 300
}
C 64000 39400 1 270 0 resistor-2.sym
{
T 64300 39200 5 10 1 1 270 0 1
refdes=R71
T 63800 39200 5 10 1 1 270 0 1
value=10k
T 64000 39400 5 10 0 0 0 0 1
footprint=R025
}
N 64100 43600 64100 40700 4
C 64000 38000 1 0 0 net-gnd-1.sym
N 64100 38300 64100 38500 4
N 64100 39400 64100 39800 4
C 62900 39500 1 0 0 resistor-2.sym
{
T 63100 39800 5 10 1 1 0 0 1
refdes=R72
T 63100 39300 5 10 1 1 0 0 1
value=10k
T 62900 39500 5 10 0 0 0 0 1
footprint=R025
}
N 63800 39600 64100 39600 4
N 62900 39600 62600 39600 4
C 62600 40800 1 0 0 resistor-2.sym
{
T 62800 41100 5 10 1 1 0 0 1
refdes=R73
T 62800 40600 5 10 1 1 0 0 1
value=1k
T 62600 40800 5 10 0 0 0 0 1
footprint=R025
}
N 63500 40900 64100 40900 4
N 62000 40100 62000 40900 4
N 60700 40900 62600 40900 4
C 61900 38600 1 0 0 net-gnd-1.sym
N 62000 38900 62000 39100 4
C 60600 39000 1 0 0 net-gnd-1.sym
N 60700 39300 60700 39500 4
N 60500 39500 60700 39500 4
N 60700 40900 60700 40300 4
N 60700 40300 60500 40300 4
N 57100 39500 57700 39500 4
N 55700 39500 56200 39500 4
N 57700 40300 56100 40300 4
B 55500 37800 9100 4000 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 56600 41500 9 10 1 0 0 0 1
ZABEZPIECZENIE PRZED NADMIERNYM ROZŁADOWANIEM AKUMULATORÓW
B 52400 43800 3100 6200 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 52900 49700 9 10 1 0 0 0 1
RESET ZABEZPIECZENIA
C 59500 45100 1 0 0 EMBEDDEDoperational_amplifier-1.sym
[
P 59600 46000 59900 46000 1 0 0
{
T 59750 46000 5 8 1 1 0 0 1
pinnumber=1
T 59950 46000 5 8 0 1 0 2 1
pintype=io
T 59800 45950 5 8 0 1 0 8 1
pinseq=1
T 59950 46000 5 13 1 1 0 1 1
pinlabel=+
}
P 61000 45800 60700 45800 1 0 0
{
T 60850 45800 5 8 1 1 0 6 1
pinnumber=3
T 60650 45800 5 8 0 1 0 8 1
pintype=io
T 60800 45750 5 8 0 1 0 2 1
pinseq=3
T 60600 45800 5 7 1 1 0 7 1
pinlabel=out
}
P 59600 45600 59900 45600 1 0 0
{
T 59750 45600 5 8 1 1 0 0 1
pinnumber=2
T 59950 45600 5 8 0 1 0 2 1
pintype=io
T 59800 45550 5 8 0 1 0 8 1
pinseq=2
T 59950 45600 5 13 1 1 0 1 1
pinlabel=-
}
T 59675 46350 8 10 0 1 0 0 1
refdes=U?
T 59900 46850 5 10 0 0 0 0 1
author=Robert Paciorek <rrp@opcode.eu.org>
T 59900 47050 5 10 0 0 0 0 1
dist-license=dual X11 or GPL
T 59900 47250 5 10 0 0 0 0 1
use-license=free/unlimited
L 59900 46300 59900 45300 3 0 0 0 -1 -1
L 59900 45300 60700 45800 3 0 0 0 -1 -1
L 60700 45800 59900 46300 3 0 0 0 -1 -1
P 60300 46400 60300 46050 1 0 0
{
T 60280 46325 5 8 1 1 180 0 1
pinnumber=4
T 60300 46050 5 8 0 1 90 8 1
pintype=io
T 60350 46200 5 8 0 1 90 2 1
pinseq=4
T 60320 46050 5 7 1 1 0 0 1
pinlabel=Vs+
}
P 60300 45200 60300 45550 1 0 0
{
T 60280 45375 5 8 1 1 180 0 1
pinnumber=5
T 60300 45550 5 8 0 1 90 2 1
pintype=io
T 60350 45400 5 8 0 1 90 8 1
pinseq=5
T 60330 45550 5 7 1 1 180 6 1
pinlabel=Vs-
}
]
{
T 59675 46350 5 10 1 1 0 0 1
refdes=U31
}
C 60600 39000 1 0 1 transoptor-diode-transistor-2.sym
{
T 60200 40800 5 10 1 1 0 6 1
refdes=U71
T 58800 39300 5 10 1 1 0 0 1
value=4N29
T 60600 39000 5 10 0 1 0 0 1
slotdef=1:1,2,5,4
T 60600 39000 5 10 0 1 0 0 1
slot=1
T 60600 39000 5 10 0 0 0 0 1
footprint=DIL 300 6 100 60 28
}
C 41400 42700 1 270 1 AC-DC_bridge-2.sym
{
T 42500 42800 5 10 1 1 180 8 1
refdes=U12
T 41400 42700 5 10 0 0 90 2 1
footprint=DIL 300 2 200 60 28
}
C 41100 48700 1 0 0 net-gnd-1.sym
N 41200 49000 41200 49200 4
N 41200 49200 41400 49200 4
N 42100 50000 42100 49900 4
N 42100 48500 42100 48400 4
C 41400 48500 1 270 1 AC-DC_bridge-2.sym
{
T 41400 48500 5 10 0 0 90 2 1
footprint=DIL 300 2 200 60 28
T 42500 48600 5 10 1 1 180 8 1
refdes=U11
}
C 50700 49600 1 0 0 net-pwr-1.sym
{
T 50900 49950 5 9 1 1 0 5 1
value=Vout
T 50950 49700 5 5 0 0 0 0 1
net=Vout:1
}
C 43900 49600 1 0 0 net-pwr-1.sym
{
T 44100 49950 5 9 1 1 0 5 1
value=Vsiec
T 44150 49700 5 5 0 0 0 0 1
net=Vsiec:1
}
C 41900 50000 1 0 0 net-pwr-1.sym
{
T 42100 50350 5 9 1 1 0 5 1
value=AC1
T 42150 50100 5 5 0 0 0 0 1
net=AC1:1
}
C 42300 48400 1 180 0 net-pwr-1.sym
{
T 42100 48050 5 9 1 1 180 5 1
value=AC2
T 42050 48300 5 5 0 0 180 0 1
net=AC2:1
}
C 42500 45600 1 180 0 net-pwr-1.sym
{
T 42300 45250 5 9 1 1 180 5 1
value=AC2
T 42250 45500 5 5 0 0 180 0 1
net=AC2:1
}
C 42100 47000 1 0 0 net-pwr-1.sym
{
T 42300 47350 5 9 1 1 0 5 1
value=AC1
T 42350 47100 5 5 0 0 0 0 1
net=AC1:1
}
C 42300 42600 1 180 0 net-pwr-1.sym
{
T 42100 42250 5 9 1 1 180 5 1
value=AC2
T 42050 42500 5 5 0 0 180 0 1
net=AC2:1
}
C 41900 44200 1 0 0 net-pwr-1.sym
{
T 42100 44550 5 9 1 1 0 5 1
value=AC1
T 42150 44300 5 5 0 0 0 0 1
net=AC1:1
}
C 45600 43800 1 0 0 net-pwr-1.sym
{
T 45800 44150 5 9 1 1 0 5 1
value=Vsiec
T 45850 43900 5 5 0 0 0 0 1
net=Vsiec:1
T 46000 43800 5 10 1 1 0 0 1
value=20.7V
}