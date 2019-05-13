#!/bin/bash

START_DIR=$PWD

cd ../nullmailer-1.04

make clean

export CC='/home/user/ARMLinux/buildroot/build_arm/staging_dir/bin/arm-linux-gcc'
export CPP='/home/user/ARMLinux/buildroot/build_arm/staging_dir/bin/arm-linux-gcc -E'
export CXX='/home/user/ARMLinux/buildroot/build_arm/staging_dir/bin/arm-linux-g++'
./configure --host --host-alias --localstatedir=/var/spool --sysconfdir=/etc --libexecdir=/usr/lib

make

mkdir -p "$START_DIR/nullmailer/lib"
cp protocols/qmqp protocols/smtp "$START_DIR/nullmailer/lib"
cp /home/user/ARMLinux/buildroot/build_arm/staging_dir/lib/libstdc++.so.6.0.8 "$START_DIR/nullmailer/lib/"

mkdir -p "$START_DIR/nullmailer/bin"
cp src/mailq src/sendmail src/nullmailer-* "$START_DIR/nullmailer/bin/"


echo "for run and install trick see install_and_run.sh"
