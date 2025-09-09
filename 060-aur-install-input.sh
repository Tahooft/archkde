#!/bin/bash
set -e
# First one needed is: pamac-aur (https://aur.archlinux.org/pamac-aur.git)


echo ""
echo "###     Installing  from AUR                                 ###"
echo ""

BUILDS=~/.builds

# Test of ~/.builds exists
if [ ! -d $BUILDS ]; then
  mkdir $BUILDS
fi
cd $BUILDS

echo "Input: "
read filename

# Test of ~/.builds/filename exists
if [ -d $BUILDS/$filename ]; then
   rm -Rf $BUILDS/$filename
fi

git clone https://aur.archlinux.org/${filename}.git
cd $filename
makepkg -sicr

echo ""
echo "###     Done                                                 ###"
echo ""
