v 20130925 2
C 44100 49300 1 0 0 EMBEDDEDLight-Bulb-3.sym
[
P 44100 49500 44250 49500 1 0 0
{
T 44200 49550 5 8 0 1 0 6 1
pinnumber=1
T 44200 49450 5 8 0 1 0 8 1
pinseq=1
T 44300 49450 9 8 0 1 0 0 1
pinlabel=1
T 43850 49450 5 8 0 1 0 2 1
pintype=pas
}
P 44800 49500 44650 49500 1 0 0
{
T 44700 49550 5 8 0 1 0 0 1
pinnumber=2
T 44700 49450 5 8 0 1 0 2 1
pinseq=2
T 44650 49450 9 8 0 1 0 6 1
pinlabel=2
T 45050 49450 5 8 0 1 0 8 1
pintype=pas
}
T 44100 49700 8 10 0 1 0 0 1
refdes=R?
T 44300 50000 5 10 0 0 0 0 1
author=Stefan Salewski
T 44300 50200 5 10 0 0 0 0 1
description=Light Bulb
T 44300 50400 5 10 0 0 0 0 1
numslots=0
T 44300 50600 5 10 0 0 0 0 1
dist-license=GPL
T 44300 50800 5 10 0 0 0 0 1
use-license=unlimited
T 44600 49700 5 10 0 1 0 0 1
value=value
L 44325 49375 44575 49625 3 0 0 0 -1 -1
L 44575 49375 44325 49625 3 0 0 0 -1 -1
V 44450 49500 200 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
]
{
T 44100 49700 5 10 1 1 0 0 1
refdes=R1
T 44600 49700 5 10 1 1 0 0 1
value=40W
}
C 46400 47700 1 0 0 transformer-1.sym
{
T 47300 49000 5 10 1 1 0 0 1
refdes=Tr1
}
C 41400 48700 1 0 0 EMBEDDEDterminal-3.sym
[
P 41922 48800 42100 48800 1 0 1
{
T 42060 48850 5 10 0 0 0 0 1
pinseq=1
T 41910 48800 5 10 0 1 0 0 1
pinnumber=1
T 41910 49000 5 10 0 1 0 0 1
pintype=pas
T 42200 48800 5 10 0 1 0 0 1
pinlabel=terminal
}
V 41860 48800 60 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 41710 49300 8 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 41700 49600 8 10 0 1 0 0 1
author=Karel 'Clock' Kulhavy <clock@twibright.com>
T 41700 49800 8 10 0 0 0 0 1
numslots=0
T 41750 48750 8 10 0 1 0 6 1
refdes=T?
]
{
T 41710 49300 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 41750 48750 5 10 1 1 0 6 1
refdes=T1
}
C 41400 47900 1 0 0 EMBEDDEDterminal-3.sym
[
P 41922 48000 42100 48000 1 0 1
{
T 42060 48050 5 10 0 0 0 0 1
pinseq=1
T 41910 48000 5 10 0 1 0 0 1
pinnumber=1
T 41910 48200 5 10 0 1 0 0 1
pintype=pas
T 42200 48000 5 10 0 1 0 0 1
pinlabel=terminal
}
V 41860 48000 60 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 41710 48500 8 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 41700 48800 8 10 0 1 0 0 1
author=Karel 'Clock' Kulhavy <clock@twibright.com>
T 41700 49000 8 10 0 0 0 0 1
numslots=0
T 41750 47950 8 10 0 1 0 6 1
refdes=T?
]
{
T 41710 48500 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 41750 47950 5 10 1 1 0 6 1
refdes=T2
}
C 42100 47800 1 0 0 EMBEDDEDswitch-dpdt-2.sym
[
L 42410 48000 42760 48150 3 0 0 0 -1 -1
L 42410 48800 42760 48950 3 0 0 0 -1 -1
T 42510 49200 8 10 0 1 0 0 1
refdes=S?
L 42560 48860 42560 48750 3 0 0 0 -1 -1
L 42560 48150 42560 48070 3 0 0 0 -1 -1
L 42560 48400 42560 48250 3 0 0 0 -1 -1
L 42560 48650 42560 48500 3 0 0 0 -1 -1
V 42760 49000 50 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 42760 48600 50 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 42760 48200 50 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 42760 47800 50 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 42510 49700 8 10 0 0 0 0 1
footprint=SWITCH2
P 42100 48800 42400 48800 1 0 0
{
T 42100 48800 5 10 0 1 0 0 1
pinnumber=2
T 42100 48800 5 10 0 0 0 0 1
pinseq=2
}
P 43100 49000 42800 49000 1 0 0
{
T 43100 49000 5 10 0 1 0 0 1
pinnumber=1
T 43100 49000 5 10 0 0 0 0 1
pinseq=1
}
P 42100 48000 42400 48000 1 0 0
{
T 42100 48000 5 10 0 1 0 0 1
pinnumber=5
T 42100 48000 5 10 0 0 0 0 1
pinseq=5
}
P 43100 48600 42800 48600 1 0 0
{
T 43100 48600 5 10 0 1 0 0 1
pinnumber=3
T 43100 48600 5 10 0 0 0 0 1
pinseq=3
}
P 43100 48200 42800 48200 1 0 0
{
T 43100 48200 5 10 0 1 0 0 1
pinnumber=4
T 43100 48200 5 10 0 0 0 0 1
pinseq=4
}
P 43100 47800 42800 47800 1 0 0
{
T 43100 47800 5 10 0 1 0 0 1
pinnumber=6
T 43100 47800 5 10 0 0 0 0 1
pinseq=6
}
T 42500 50300 5 10 0 0 0 0 1
author=Levente Kovacs
T 42500 50100 5 10 0 0 0 0 1
email=levente.kovacs@interware.hu
T 42500 50500 5 10 0 0 0 0 1
dist-license=GPL
T 42500 49900 5 10 0 0 0 0 1
use-license=unlimited
]
{
T 42510 49200 5 10 1 1 0 0 1
refdes=S1
T 42510 49700 5 10 0 0 0 0 1
footprint=SWITCH2
}
C 45100 48900 1 180 0 EMBEDDEDswitch-sp3t-1.sym
[
P 44800 48600 45100 48600 1 0 1
{
T 44950 48550 5 10 1 1 180 0 1
pinnumber=1
T 44950 48550 5 10 0 0 180 0 1
pinseq=1
T 44950 48550 5 10 0 1 180 0 1
pinlabel=1
T 44950 48550 5 10 0 1 180 0 1
pintype=pas
}
T 44700 48100 8 10 0 1 180 0 1
refdes=S?
P 44400 48300 44100 48300 1 0 1
{
T 44250 48250 5 10 1 1 180 0 1
pinnumber=2
T 44250 48250 5 10 0 0 180 0 1
pinseq=2
T 44250 48250 5 10 0 1 180 0 1
pinlabel=2
T 44250 48250 5 10 0 1 180 0 1
pintype=pas
}
P 44400 48900 44100 48900 1 0 1
{
T 44250 48850 5 10 1 1 180 0 1
pinnumber=3
T 44250 48850 5 10 0 0 180 0 1
pinseq=3
T 44250 48850 5 10 0 1 180 0 1
pinlabel=3
T 44250 48850 5 10 0 1 180 0 1
pintype=pas
}
L 44800 48600 44400 48400 3 0 0 0 -1 -1
T 44227 48590 9 8 1 0 180 3 1
OFF
L 44400 48600 44100 48600 3 0 0 0 -1 -1
]
{
T 44800 48300 5 10 1 1 0 8 1
refdes=S2
}
N 46100 48800 46400 48800 4
N 46400 47800 46100 47800 4
N 45500 47800 43100 47800 4
N 45500 48800 45300 48800 4
N 45300 48600 45300 49500 4
N 45300 49500 44800 49500 4
N 44100 49500 43500 49500 4
N 43500 49500 43500 48600 4
N 43500 48600 43100 48600 4
N 44100 48300 43900 48300 4
N 43900 48300 43900 47800 4
N 44100 48900 43900 48900 4
N 43900 48900 43900 49500 4
N 45100 48600 45300 48600 4
T 41200 48400 9 10 1 0 0 0 1
230V AC
T 41300 45700 9 10 1 0 0 0 6
S1 - main switch
S2 - mode switch:
  1) 1 - 2: Tr1 is OFF, lightbulb R1 is full ON
  2) 1 - OFF: Tr1 is powerd via R1 (limiting current)
  3) 1 - 3: Tr1 is full ON

T 41300 44200 9 10 1 0 0 0 6
S1 - wyłącznik główny
S2 - przełącznik trybu:
  1) 1 - 2: Tr1 WYŁĄCZONY, żarówka R1 w pełni WŁĄCZONA
  2) 1 - OFF: Tr1 jest zasilany poprzez R1 (ograniczenie prądu)
  3) 1 - 3: Tr1 w pełni WŁĄCZONY

C 45400 48700 1 0 0 terminal-in_line.sym
{
T 45950 48950 5 10 1 1 0 6 1
refdes=T3
T 45710 49700 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
}
C 45400 47700 1 0 0 terminal-in_line.sym
{
T 45950 47950 5 10 1 1 0 6 1
refdes=T4
T 45710 48700 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
}