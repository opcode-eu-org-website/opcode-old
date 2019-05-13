#!/bin/bash
#
# Copyright (c) 2015, Robert Paciorek (http://www.opcode.eu.org/), BSD/MIT-type license
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

addRtspHTTPSource() {
	x=$2
	y=$3
	host=$4
	port=$5
	echo new     src$1 broadcast enabled
	echo setup   src$1 input  "rtsp://$host:$port/rtsp_tunnel?&inst=1&rec=0&enableaudio=1&audio_mode=0&rnd=100"
	echo setup   src$1 option rtsp-tcp
	echo setup   src$1 option rtsp-http
	echo setup   src$1 option rtsp-http-port=$port
	echo setup   src$1 output "#duplicate{dst=mosaic-bridge{id=$1,height=360,width=640,x=$x,y=$y},select=video,dst=bridge-out{id=$1},select=audio}"
	echo control src$1 play
}

addMosaic() {
	echo new     mosaic broadcast enabled
	echo setup   mosaic input /home/rrp/Downloads/TSbg-1280x720.png
	echo control mosaic play
}

tmpfile=`mktemp`
addRtspHTTPSource 1 0   0   localhost 8001 >  $tmpfile
addRtspHTTPSource 2 0   360 localhost 8002 >> $tmpfile
addMosaic >> $tmpfile

/usr/bin/vlc --sub-filter=mosaic --mosaic-keep-picture --image-duration=-1 --mosaic-width=1280 --mosaic-height=720 --fullscreen --vlm-conf $tmpfile

/bin/rm $tmpfile
