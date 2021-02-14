# t2-audio-config-files

Script to install config files for audio with Macs with the T2 chip.

It should select files for the 16,1 and 16,4 if you have one of those two laptops.

It should also work if `alsa-card-profiles` is split from `pulseaudio`, which is a thing on arch.

It should work, but I haven't tested it because I don't have a clean system to test it on, nor time to make one.

I've also made it so you can select just Headphones or just Speakers, as for some people (including me) when programs use the Microphone, things crash. Another change I've made is making pipwire work as well as pulseaudio.

Goodnight.

```sh
git clone https://github.com/Redecorating/t2-audio-config-files
cd t2-audio-config-files
sudo ./install.sh
```


Sources

https://gist.github.com/kevineinarsson/8e5e92664f97508277fefef1b8015fba
https://gist.github.com/MCMrARM/c357291e4e5c18894bea10665dcebffb
