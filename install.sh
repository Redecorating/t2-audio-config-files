#!/bin/bash
srcDir=normal
Model=$(cat /sys/devices/virtual/dmi/id/product_name)

umask 644

if [ $Model == "MacBookPro16,1" ] || [ $Model == "MacBookPro16,4" ]
	then echo This computer is a $Model, which had 6 speakers and requires different audio configuration files, which will be installed.
	srcDir=16-1
fi
echo Moving files...
cp -v ./$srcDir/AppleT2.conf /usr/share/alsa/cards/AppleT2.conf
cp -v ./$srcDir/91-apple-t2-audio.rules /usr/lib/udev/rules.d/91-apple-t2-audio.rules
# If you are using pipewire or some older versions of pulseaudio, the directory for apple-t2.conf is different.
# If we put it in both, it should work for everyone.
mkdir -p /usr/share/alsa-card-profile/mixer/profile-sets
mkdir -p /usr/share/pulseaudio/alsa-mixer/profile-sets

cp -v ./$srcDir/apple-t2.conf /usr/share/alsa-card-profile/mixer/profile-sets/apple-t2.conf
cp -v ./$srcDir/apple-t2.conf /usr/share/pulseaudio/alsa-mixer/profile-sets/apple-t2.conf

if [ srcDir == 16-1 ]
	then echo You are on a $Model, and if you are using pulseaudio, you\'ll need to make some changes to your pulseaudio configuration files. Please refer to this gist: https://gist.github.com/kevineinarsson/8e5e92664f97508277fefef1b8015fba
fi
