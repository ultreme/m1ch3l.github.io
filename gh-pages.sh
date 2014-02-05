#!/bin/sh

set -x
set -e

bower install
grunt build

TMPDIR=/tmp/m1ch3l-dist
BASEDIR=$(pwd)

rm -rf $TMPDIR
mkdir -p $TMPDIR/git
cp -rf $BASEDIR/dist $TMPDIR/dist

cd $TMPDIR
git clone -b master git@github.com:moul/m1ch3l.github.com.git git
cd git
rsync -av ../dist/ .
git add .
git commit -am "rebuild"
git push origin master
