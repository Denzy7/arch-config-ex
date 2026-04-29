#!/bin/bash

set -e

#for arg in "$@";do
    #i=0
    #if [[ $arg == "-r" ]];then;
        #rmroot=$ar
        #i++
    #fi
    #echo "arg: $arg"
#done
#exit
if ! [[ $(id -u) -eq 0 ]];then
    echo "we need root"
    exit 1
fi

if [[ -z $1 ]];then
    echo "provide an arg at \$1 for location of chroot"
    exit 1
fi

echo "make chroot at $1? press enter to continue or any other key or ctrl+c to exit "
read cont
if ! [[ -z $cont ]];then
    echo "exiting..."
    exit 1
fi

abs=$(realpath "$1")
mkdir -p "$abs/var/lib/pacman"
ln -sf /var/lib/pacman/sync "$abs/var/lib/pacman"
mkdir -p "$abs/dev"
mount --bind /dev "$abs/dev"
mkdir -p "$abs/proc"
mount --bind /proc "$abs/proc"
mkdir -p "$abs/sys"
mount --bind /sys "$abs/sys"
pacman --noconfirm -S -r "$abs" base

echo "chroot at \"$1\" is now ready. run \"chroot $1 /bin/bash\" to change root"
echo "note pacman in chroot will not work so all package installations have to be done with:"
echo "pacman -S -r $abs PACKAGES ..."
