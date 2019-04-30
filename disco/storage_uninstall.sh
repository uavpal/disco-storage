#!/bin/sh
echo "=== Uninstalling UAVPAL Storage Mod on Disco ==="
echo "Remounting filesystem as read/write"
mount -o remount,rw /
echo "Removing symlink udev rule"
rm -f /lib/udev/rules.d/65-uavpal-disco-storage.rules
echo "Remounting filesystem as read-only"
mount -o remount,ro /
echo "Removing UAVPAL Storage Mod files"
rm -rf /data/ftp/uavpal/bin/uavpal_storage.sh
rm -rf /data/ftp/uavpal/conf/65-uavpal-disco-storage.rules
echo "Removing UAVPAL Storage Mod installation files"
rm -rf /data/ftp/disco-storage*
echo "All done! :)"
echo
