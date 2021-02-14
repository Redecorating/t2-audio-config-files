#!/bin/bash
srcDir=normal
Model=$(cat /sys/devices/virtual/dmi/id/product_name)
profileDir=/usr/share/pulseaudio/alsa-mixer/profile-sets

echo This script isn\'t well tested, ^C at the read prompt if you don\'t want to run it
read foo


if [ $Model == "MacBookPro16,1" ] || [ $Model == "MacBookPro16,4" ]
	then echo This computer is a $Model, which had 6 speakers and requires different audio configuration files, which will be installed.
	srcDir=16-1

fi
echo Moving files...
cp ./$srcDir/AppleT2.conf /usr/share/alsa/cards/AppleT2.conf
cp ./$srcDir/91-apple-t2-audio.rules /usr/lib/udev/rules.d/91-apple-t2-audio.rules
# At least on arch, the alsa-card-profiles package was split off from pulseaudio, and as a result, the directory for apple-t2.conf has changed
if test -d /usr/share/alsa-card-profile/mixer/profile-sets 
then profileDir=/usr/share/alsa-card-profile/mixer/profile-sets
fi
cp ./$srcDir/apple-t2.conf $profileDir/apple-t2.conf

if [ srcDir == 16-1 ]
	then echo You are on a $Model, and if you are using pulseaudio, you\'ll need to make some changes to configuration files. Please refer to this gist: https://gist.github.com/kevineinarsson/8e5e92664f97508277fefef1b8015fba
fi
