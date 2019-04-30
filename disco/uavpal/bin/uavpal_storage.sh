#!/bin/sh

# variables
partition="$(echo $2 | cut -d "/" -f 3)"
disk="$(echo $partition | rev | cut -c 2- | rev)"
media_path="/data/ftp/internal_000/Disco/media"

if [ "$1" == "add" ]; then
	last_partition=$(ls /dev/${disk}? | tail -n 1)
	if [ "$last_partition" != "/dev/${partition}" ]; then
		exit 1 # only proceed if the last partition has triggered the script (necessary for GPT partition tables)
	fi
	ulogger -s -t uavpal_storage "... disk ${disk} has been detected, trying to mount its last partition ${partition}"
	mount -t vfat -o rw,noatime /dev/${partition} ${media_path}
	if [ $? -ne 0 ]; then
		ulogger -s -t uavpal_storage "... could not mount USB mass storage partition ${partition} - please ensure the file system is FAT32 (and not exFAT!). Exiting!"
		exit 1
	fi
	ulogger -s -t uavpal_storage "... partition ${partition} has been mounted successfully"
	diskfree=$(df -h | grep ${partition})
	ulogger -s -t uavpal_storage "... photos and videos will now be stored on the USB mass storage device (capacity: $(echo $diskfree | awk '{print $2}') / available: $(echo $diskfree | awk '{print $4}'))"
elif [ "$1" == "remove" ]; then
	ulogger -s -t uavpal_storage "... disk ${disk} has been removed"
	umount -f ${media_path}
	diskfree=$(df -h | grep internal_000)
	ulogger -s -t uavpal_storage "... photos and videos will now be stored on the drone's internal memory (capacity: $(echo $diskfree | awk '{print $2}') / available: $(echo $diskfree | awk '{print $4}'))"
	mkdir ${media_path}
	chmod 755 ${media_path}
	chown root:root ${media_path}
fi
