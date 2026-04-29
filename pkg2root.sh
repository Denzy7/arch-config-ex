#!/bin/bash

#copies pacman packages to this root to another root

set -e

ansigreen="\033[0;32m"
ansired="\033[0;31m"
ansireset="\033[0m"
if ! [ $(id -u) -eq 0 ]
then
	echo "This script must run as root"
	exit 1
fi

if [ -z "$1" ]
then
    echo "Specify new root with argument 1"
    exit 1
fi

newroot="$1"
pkgs=$(chroot "${newroot}" pacman -Q | gawk '{print $1}')
pkgdir="/var/cache/pacman/pkg"

declare -g pkgcopied

# seems like the only way to count pkgs?
declare -g pkgcount
echo "Getting available packages"
declare -g pkgsfound
for i in ${pkgs}
do
    pkgfile=$(find ${pkgdir} -name "${i}-[[:digit:]]*.zst" | sort -nr | head -n 1)
    if [ -e "${pkgfile}" ]
    then
        pkgcount=$((pkgcount + 1))
        pkgsfound+=(${pkgfile})
        echo -e "${ansigreen}${i}${ansireset} : OK"
    else
        echo -e "${ansired}${i}${ansireset} : NOT FOUND"
    fi
done

declare -g copycmd="cp -f"

if command -v cpg &> /dev/null
then
    echo "Using cpg to copy"
    copycmd="cpg -g"
fi

for i in ${pkgsfound[@]}
do
    if [ -e $i ] && [ -e $i.sig ]
    then
        pkgcopied=$((pkgcopied + 1))
        echo -e "Copying $i + .sig\n${pkgcopied} of ${pkgcount}"
        ${copycmd} "$i" "$i.sig" "${newroot}/var/cache/pacman/pkg"
        echo
    fi
done
