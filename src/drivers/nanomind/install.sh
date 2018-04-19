#!/bin/sh
echo "Downloading toolchain..."
wget -N data.spel.cl/gs-avr32-toolchain-3.4.2.tar.gz
tar -xzf gs-avr32-toolchain-3.4.2.tar.gz
cd gs-avr32-toolchain-3.4.2
echo "Installing toolchain..."
sh install-avr32.sh
cd -

echo "Downloading Gomspace SDK..."
wget -N data.spel.cl/gs-sw-nanomind-a3200-sdk-lite-v1.2.tar.bz2
tar -xjf gs-sw-nanomind-a3200-sdk-lite-v1.2.tar.bz2

echo "Linking source code into SDK..."
cd a3200-sdk-lite-v1.2/
rm -rf src/
ln -s -f ../../../../src
mv wscript wscript.old
cd -

echo "Coping custom waf script..."
cp wscript a3200-sdk-lite-v1.2/wscript

#echo "Linking libcsp..."
#ln -s -f ../../../../../../drivers/atmel/libcsp
#cd -

echo "---------"
echo "Finished. Compile and program with:"
echo "sh build.sh"
echo "sh build.sh program"
echo "---------"