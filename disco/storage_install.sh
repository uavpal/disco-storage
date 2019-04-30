#!/bin/sh
echo "=== Installing UAVPAL Storage Mod on Disco ==="
if [ "$(grep 'ro.parrot.build.product' /etc/build.prop | cut -d'=' -f 2)" != "evinrude" ]; then
	echo "This mod can only be installed on the Parrot Disco. Exiting!"
	exit 1
fi
echo "Copying softmod files to target directory"
cp -fr /tmp/disco-storage/disco/uavpal /data/ftp
echo "Making binaries and scripts executable"
chmod +x /data/ftp/uavpal/bin/*
echo "Remounting filesystem as read/write"
mount -o remount,rw /
echo "Creating symlink udev rule"
ln -s /data/ftp/uavpal/conf/65-uavpal-disco-storage.rules /lib/udev/rules.d/65-uavpal-disco-storage.rules 2>&1 |grep -v 'File exists'
echo "Remounting filesystem as read-only"
mount -o remount,ro /
echo "Removing UAVPAL Storage Mod installation files"
rm -rf /data/ftp/disco-storage*
echo "Reloading udev rules"
udevadm control --reload-rules
udevadm trigger
echo "All done! :)"
echo

