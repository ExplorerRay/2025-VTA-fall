#!/bin/sh

sudo qemu-system-x86_64 \
    -cpu host -enable-kvm -m 1G -smp 1 \
    -drive if=virtio,format=qcow2,file=/mnt/nfs/deb.qcow2 \
    -display curses \
    -incoming tcp:0:4400
