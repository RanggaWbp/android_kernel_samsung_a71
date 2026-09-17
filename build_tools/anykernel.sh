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

# Deteksi otomatis partisi boot Samsung SM7150
BLOCK=auto;
[ -e /dev/block/by-name/boot ] && BLOCK=/dev/block/by-name/boot;
[ -e /dev/block/bootdevice/by-name/boot ] && BLOCK=/dev/block/bootdevice/by-name/boot;
block=$BLOCK;

IS_SLOT_DEVICE=0;
is_slot_device=0;
RAMDISK_COMPRESSION=auto;
ramdisk_compression=auto;
PATCH_VBMETA_FLAG=auto;
patch_vbmeta_flag=auto;

# Import core library
. tools/ak3-core.sh;

# Inisialisasi, injeksi kernel Image.gz-dtb, dan flash partisi boot
dump_boot;
write_boot;
