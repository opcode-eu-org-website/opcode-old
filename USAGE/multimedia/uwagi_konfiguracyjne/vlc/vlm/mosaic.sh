#!/usr/bin/cvlc --vlm-conf
#
# Copyright (c) 2010, Robert Paciorek (http://www.opcode.eu.org/), BSD/MIT-type license
# 
#
# Redystrybucja wersji źródłowych i wynikowych, po lub bez dokonywania
# modyfikacji JEST DOZWOLONA, pod warunkiem zachowania niniejszej informacji o
# prawach autorskich. Autor NIE ponosi JAKIEJKOLWIEK odpowiedzialności za skutki
# użytkowania tego dokumentu/programu oraz za wykorzystanie zawartych tu informacji.
#
# This text/program is free document/software. Redistribution and use in
# source and binary forms, with or without modification, ARE PERMITTED provided
# save this copyright notice. This document/program is distributed WITHOUT any
# warranty, use at YOUR own risk.

# konfiguracja kamer
new cam1 broadcast enabled
setup cam1 input "rtsp://ip.ip.ip.ip:554/axis-media/media.amp?videocodec=mpeg4"
setup cam1 option marq-marquee='kam1'
setup cam1 option marq-position=8
setup cam1 option marq-size=25
setup cam1 option marq-color=579329
setup cam1 option sout-mosaic-bridge-id=1
setup cam1 option sout-mosaic-bridge-width=420
setup cam1 option sout-mosaic-bridge-height=426
setup cam1 option sout-mosaic-bridge-y=0
setup cam1 option sout-mosaic-bridge-x=0
setup cam1 output #mosaic-bridge
#setup cam1 output #transcode{deinterlace,sfilter=marq,vcodec=mp4v}:mosaic-bridge

new cam2 broadcast enabled
setup cam2 input "rtsp://ip.ip.ip.ip:7070"
setup cam2 option marq-marquee='kam2'
setup cam2 option marq-position=8
setup cam2 option marq-size=25
setup cam2 option marq-color=579329
setup cam2 option sout-mosaic-bridge-id=5
setup cam2 option sout-mosaic-bridge-width=426
setup cam2 option sout-mosaic-bridge-height=320
setup cam2 option sout-mosaic-bridge-y=341
setup cam2 option sout-mosaic-bridge-x=426
setup cam2 output #mosaic-bridge
#setup cam2 output #transcode{deinterlace,sfilter=marq,vcodec=mp4v}:mosaic-bridge

# konfiguracja mozajki
new mosaic broadcast enabled
setup mosaic input fake://Mosaic2a.png
setup mosaic option fake-caching=50
setup mosaic option fake-width=1278
setup mosaic option fake-height=682
setup mosaic option fake-fps="24"
setup mosaic option fake-deinterlace
setup mosaic option mosaic-width=1278
setup mosaic option mosaic-height=640
setup mosaic option mosaic-position=2
setup mosaic option mosaic-rows=2
setup mosaic option mosaic-cols=3
#setup mosaic option mosaic-order="1,2,3,4,5,6"
setup mosaic option sub-filter=mosaic
setup mosaic output #bridge-in{offset=100}:display
#setup mosaic output #transcode{deinterlace,sfilter=mosaic,vcodec=mp4v,vb=10000,acodec=none}:bridge-in{id-offset=100}:display
#setup mosaic output #transcode{sfilter=mosaic,vcodec=mp2v,vb=10000,acodec=none}:bridge-in{id-offset=100}:std{access=udp{ttl=1},mux=ts,dst=226.1.226.1:1234}


# autostart
control cam1 play
control cam2 play
control mosaic play
