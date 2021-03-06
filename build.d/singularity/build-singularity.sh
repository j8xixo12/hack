#!/bin/bash
#
# Copyright (C) 2011 Yung-Yu Chen <yyc@solvcon.net>.
#
# Python development guide: https://docs.python.org/devguide/

pkgname=singularity
pkgbranch=${VERSION:-2.5.2}
pkgfull=$pkgname-$pkgbranch
pkgloc=$YHDL/$pkgfull.tar.gz
pkgurl=https://github.com/singularityware/$pkgname/releases/download/$pkgbranch/$pkgfull.tar.gz
download $pkgloc $pkgurl 2edc1a8ac9a4d7d26fba6244f1c5fd95

# unpack (clone)
mkdir -p $YHROOT/src/$FLAVOR
cd $YHROOT/src/$FLAVOR
tar xf $pkgloc
cd $pkgfull

# build
buildcmd configure.log ./configure --prefix=$INSTALLDIR
buildcmd make.log make
if [ -z "$SUDO" ] ; then
  buildcmd install.log make install
else
  buildcmd install.log sudo make install
fi

# vim: set et nobomb ff=unix fenc=utf8:
