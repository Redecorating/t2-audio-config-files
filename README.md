# t2-audio-config-files

If you are on Arch or an Arch based distro, you can get packages for this from the releases page.

Script to install config files for audio with Macs with the T2 chip. It'll detect if you need the different config files for the 16,1 and 16,4 models.

I've also made it so you can select just Headphones or just Speakers, as for some people (including me) when programs use the Microphone, things crash. Another change I've made is making pipewire work as well as pulseaudio.

```sh
git clone https://github.com/Redecorating/t2-audio-config-files
cd t2-audio-config-files
sudo ./install.sh
```

Dependancies:

Pulseaudio or Pipewire, as you need thoese for sound.
The BCE module described here https://wiki.t2linux.org/guides/dkms/
A patched kernel for use with t2 macs.


Sources

https://gist.github.com/kevineinarsson/8e5e92664f97508277fefef1b8015fba
https://gist.github.com/MCMrARM/c357291e4e5c18894bea10665dcebffb
