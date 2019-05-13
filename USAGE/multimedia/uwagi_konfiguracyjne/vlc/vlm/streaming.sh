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

new cam1 broadcast enabled

#####################
###               ###
###     INPUT     ###
###               ###
#####################

setup cam1 input "v4l2:///dev/video0"
# setup cam1 option v4l2-input=1
setup cam1 option v4l2-input=0
setup cam1 option v4l2-tuner-frequency=223250
setup cam1 option v4l2-norm=pal
setup cam1 option v4l2-width=320
setup cam1 option v4l2-height=240
setup cam1 option v4l2-fps=15
# setup cam1 option v4l2-width=640
# setup cam1 option v4l2-height=480
# setup cam1 option v4l2-fps=25
# setup cam1 option v4l2-choma=mjpeg
setup cam1 option v4l2-caching=5000
setup cam1 option input-slave="alsa://"
setup cam1 option audio=1


######################
###                ###
###     OUTPUT     ###
###                ###
######################

## HTTP:  http{dst=:8080/kam1}
## RTSP:  rtp{sdp=rtsp://:5544/kam1}
## RTP:   rtp{dst=1.2.3.4, port=5004}
## UDP:   udp{dst=1.2.3.4:1234}

setup cam1 output #transcode:http{dst=:8080/kam1}
# setup cam1 output #transcode:duplicate{dst=display,dst=http{dst=:8080/kam1}}


###            ###
###  kontener  ###
###            ###

## UWAGA: nie kazdy format audio / video jest obsługiwany w danynym kontenerze
##        w szczególności:
##         * ogg nie obsługuje: h264, mp3, ...
##         * ts  nie obsługuje: mjpg, vorb
##         * ps  nie obsługuje: mjpg, h264, vorb
##         * dla h264 najlepiej stosować flv
## zoabacz także: http://wiki.videolan.org/Mux

# setup cam1 option sout-standard-mux=ffmpeg{mux=flv}
# setup cam1 option sout-standard-mux=ts
setup cam1 option sout-standard-mux=ogg


###                   ###
###  kodowanie wideo  ###
###                   ###

## zobacz także: http://wiki.videolan.org/Codecs

# setup cam1 option sout-transcode-venc=ffmpeg{keyint=80,hurry-up,vt=800000}
setup cam1 option sout-transcode-vb=2048
setup cam1 option sout-transcode-vcodec=mp4v
# setup cam1 option sout-transcode-vcodec=mp2v
# setup cam1 option sout-transcode-vcodec=drac
# setup cam1 option sout-transcode-vcodec=theo
# setup cam1 option sout-ffmpeg-hq=simple
# setup cam1 option no-sout-ffmpeg-interlace-me
# setup cam1 option sout-transcode-vcodec=MJPG
# setup cam1 option sout-transcode-fps=25
# setup cam1 option sout-scale=1

###                   ###
###  kodowanie audio  ###
###                   ###

# setup cam1 option sout-transcode-acodec=none
setup cam1 option sout-transcode-acodec=vorb
setup cam1 option sout-transcode-ab=64
setup cam1 option sout-transcode-channels=1
setup cam1 option sout-transcode-samplerate=16000


###                      ###
###  inne opcje wyjścia  ###
###                      ###

# setup cam1 option sout-keep
setup cam1 option no-sout-rtp-sap
setup cam1 option no-sout-standard-sap



#########################
###                   ###
###     AUTOSTART     ###
###                   ###
#########################

control cam1 play
