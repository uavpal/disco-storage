<a name="top">![UAVPAL Logo](https://uavpal.com/img/uavpal-logo-cut-461px.png)</a>
# Parrot Disco Storage Mod

## Introduction
The Parrot Disco comes with internal storage of 32 GB, which allows video recording of about 3 hours.
This modification enables video/photo recording to a USB thumb-drive attached to the Disco's CHUCK.

![Disco Storage Mod](https://uavpal.com/img/storagemod-560px.jpg)

## Advantages
- More storage space available than the built-in 32 GB: great for longer flights or multiple flights where videos cannot be transferred to a PC immediately.
- No more long transfer time required from the Disco to a PC (usually done via USB cable or Wi-Fi).
- Saves battery power (and reduces charging cycles long-term) as videos don't have to be transferred on a battery-powered CHUCK.
- The thumb-drive can be unplugged after the flight and plugged into a PC - the pilot can watch the video immediately without having to transfer anything first.

## How does it work
Plug the USB OTG cable into the right Micro USB port on CHUCK and plug  the USB thumb-drive into the female port of the USB OTG cable (see photo above).\
Once installed, the mod is active in the background and works implicitly: If there is external USB storage plugged into CHUCK, it will record to it. If no external storage is plugged in or gets unplugged, it will record to the internal storage.

## Requirements
- [Parrot Disco](https://www.parrot.com/us/drones/parrot-disco) / [Parrot Disco-Pro AG](https://www.parrot.com/business-solutions-us/parrot-professional/parrot-disco-pro-ag) with firmware 1.7.0, 1.7.1
- USB thumb-drive (USB 2.0 or USB 3.0), formatted as FAT32
- USB OTG cable (Micro USB 2.0 Male to USB 2.0 Female, ca. 10 cm, [angle cable](https://www.aliexpress.com/wholesale?SearchText=USB+OTG+angle) recommended - order "direction up")

## Software/Installation Steps
You need a PC for the initial setup (to load the scripts to the Disco via a Wi-Fi connection). These instructions should work on the latest OS versions of Windows, macOS and GNU/Linux.

- [Download .zip archive](#) of the latest Storage Mod **(not yet online!)**
- Unzip contents (the extraction process automatically creates a new folder "storagemod-x.y", where by x.y is the release version number)
- Turn on your Disco.
- Connect your PC's Wi-Fi to the Disco (e.g. DISCO-123456).
- Use an FTP tool (e.g. [FileZilla](https://filezilla-project.org/download.php?type=client)) to upload the mod to your Disco.
   - Connect via FTP to 192.168.42.1 (no username/password required)
   - You have to set the transfer type to Binary (not ASCII). In FileZilla under Edit &rarr; Settings... &rarr; Transfers &rarr; FTP: File Types &rarr; Default transfer type &rarr; change from Auto to Binary.
   - Transfer the "storagemod-x.y" folder to the "/internal_000" folder on the Disco.
- On Disco firmware 1.7.0 and newer: Double press the Disco's power button to enable the telnet server.
- Open a Command Prompt (Windows)/Terminal (macOS/Linux) and Copy/Paste the following commands manually to install the Storage Mod.
   - `telnet 192.168.42.1` (If you get an error under Windows, make sure the [Telnet Client is installed](https://www.technipages.com/windows-10-enable-telnet))
   - `chmod +x /data/ftp/internal_000/storage-*/storage_*.sh`
   - `/data/ftp/internal_000/storage-*/storage_install.sh`
- That's all! :ghost: You don't need to restart the Disco, the mod is fully functional now.

Also check out our amazing [4G/LTE softmod](https://uavpal.com/disco) if you are interested in flying your Parrot Disco without any range limitation!

## Note
- This mod is not required for pilots who have the [4G/LTE softmod](https://uavpal.com/disco) installed, as it already comes with the external storage capability builti-in.
- To uninstall, follow the installation steps above, but run `/data/ftp/internal_000/storage-*/storage_uninstall.sh` as the last step instead.

## Community
[![UAVPAL Slack Workspace](https://uavpal.com/img/slack.png)](https://uavpal.com/slack)

Instructions too technical? Having trouble installing the Storage Mod? Questions about our 4G/LTE softmod? Want to meet the developers? Interested in other mods (batteries, LEDs, etc.)? Interested to meet like-minded people? Having a great idea and want to let us know?\
We have a great and very active community on Slack, come [join us](https://uavpal.com/slack)!
