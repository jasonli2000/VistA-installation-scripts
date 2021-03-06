#!/bin/sh
cd $HOME
export VistADir=$HOME/VistA-Instance
export gtm_dist=/usr/lib/fis-gtm/V5.5-000_x86
mkdir -p $VistADir
mkdir -p $VistADir/r
mkdir -p $VistADir/o
mkdir -p $VistADir/g
mkdir -p $VistADir/inet
mkdir -p $VistADir/inet/Logs
export gtmprofilefile=$gtm_dist/gtmprofile
echo $gtmprofilefile
export gtmgbldir=$VistADir/g/database
export gtmroutines="$VistADir/o($VistADir/r) $gtm_dist/libgtmshr.so $gtm_dist"
echo "change -s DEFAULT -f=$VistADir/g/database" | $gtm_dist/mumps -r GDE
$gtm_dist/mupip create
$gtm_dist/dse change -f -key_max=1023 -rec=4096

#
#  Install script for RPC broker to support CPRS via xinetd.
#
cp $HOME/OSEHRA/VistA-installation-scripts/Scripts/cprs-vista-rpcbroker.sh $VistADir/inet
