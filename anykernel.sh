### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=property of xevan || biofrostKernel
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=RMX1911
device.name2=RMX1925
device.name3=RMX1927
device.name4=RMX2030
device.name5=RMX1919
device.name6=r5x
device.name7=
supported.versions=10-14
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

# boot shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

if mountpoint -q /data; then
	ui_print " ";
	ui_print "[+] Backing up boot & DTBO . . .";

	dd if=/dev/block/by-name/boot of=/sdcard/backup_boot.img;
	dd if=/dev/block/by-name/dtbo of=/sdcard/backup_dtbo.img;
	if [ $? != 0 ]; then
		ui_print "[!] Backup failed; proceeding anyway . . .";
	else
		ui_print "[+] Done";
	fi
fi

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel install
split_boot;

flash_boot;
flash_dtbo;
## end install