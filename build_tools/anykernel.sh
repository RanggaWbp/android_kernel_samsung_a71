### AnyKernel3 Setup for Samsung Galaxy SM7150
## Modified for ReSukiSU by RanggaWbp

properties() { '
kernel.string=Custom Kernel Samsung A71 And M51 Support ReSukiSU by RanggaWbp Menerima Pembuatan Kernel WA: 085806047666
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=a71
device.name2=a71q
device.name3=m51
device.name4=m51q
device.name5=sm7150
supported.versions=10 - 16
supported.patchlevels=
supported.vendorpatchlevels=
'; }

block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

. tools/ak3-core.sh;

split_boot;
flash_boot;
flash_dtbo;
