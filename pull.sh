#!/bin/bash -ex
VERSION=3.4
REVISION=1

wget http://deb.debian.org/debian/pool/main/p/parted/parted_$VERSION-$REVISION.debian.tar.xz
tar xf parted_$VERSION-$REVISION.debian.tar.xz
rm parted_$VERSION-$REVISION.debian.tar.xz

wget http://deb.debian.org/debian/pool/main/p/parted/parted_$VERSION.orig.tar.xz
tar xf parted_$VERSION.orig.tar.xz --strip 1
rm parted_$VERSION.orig.tar.xz

cp zfs-guid.patch debian/patches
echo 'zfs-guid.patch' >> debian/patches/series

echo -e "$(cat changelog)\n\n$(cat debian/changelog)" > debian/changelog
