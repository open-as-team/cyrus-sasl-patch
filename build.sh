#!/bin/bash
set -e

## settings
VERSION="2.1.27"
SRC="ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-$VERSION.tar.gz"
PATCH="u8_sasl_proxy.patch"
DEBSRC="debian.tar.gz"

## cleanup previous
rm -rf cyrus*

## install build dependencies
sudo apt-get -q -y update
sudo apt-get -y install \
automake \
autotools-dev \
chrpath \
dh-autoreconf \
docbook-to-man \
dpatch \
dpkg-dev \
fakeroot \
groff-base \
hardening-wrapper \
heimdal-multidev \
krb5-multidev \
libdb-dev \
libkrb5-dev \
libldap2-dev \
libmysqlclient-dev \
libpam0g-dev \
libpq-dev \
libsqlite3-dev \
libssl-dev \
libtool \
po-debconf \
quilt

## get cyrus src and extract
wget $SRC
tar xfvz `basename $SRC`

## copy deb package dependencies
tar xfvz $DEBSRC
mv debian "cyrus-sasl-$VERSION"

## switch to cyrus-sasl dir
cd "cyrus-sasl-$VERSION"

## apply patch
#quilt import ../$PATCH
#quilt push
cp ../$PATCH debian/patches/
echo $PATCH >> debian/patches/series

## build deb package
dpkg-buildpackage -b
