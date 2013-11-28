#!/usr/bin/env bash

# install Git
sudo apt-get -y install git

# install Closure Linter
cd /tmp
sudo easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

# download Closure
cd /usr/local
git clone http://code.google.com/p/closure-library/
cd closure-library
wget http://dl.google.com/closure-compiler/compiler-latest.zip
unzip -o compiler-latest.zip -x README
sudo rm compiler-latest.zip
sudo chown -R vagrant .