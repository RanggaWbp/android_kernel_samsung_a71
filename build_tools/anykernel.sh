### AnyKernel3 Ramdisk Mod Script
## Modified for ReSukiSU by RanggaWbp

### AnyKernel setup
properties() { '
kernel.string=Custom Kernel Samsung A71 And M51 Support ReSukiSU by RanggaWbp Menerima Pembuatan Kernel WA: 085806047666
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=m51
device.name2=m51q
device.name3=a71
device.name4=a71q
device.name5=sm7150
supported.versions=10 - 16
supported.patchlevels=
supported.vendorpatchlevels=
'; }

# Boot shell variables
block=/dev/block/bootdevice/by-name/boot;
[ ! -e "$block" ] && block=/dev/block/by-name/boot;

is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# Import functions/variables
. tools/ak3-core.sh;

# Boot install
dump_boot;

# Deteksi versi Android & jenis ROM klien
device=$(file_getprop /system/build.prop ro.product.system.device);
android=$(file_getprop /system/build.prop ro.build.version.sdk);
oneui=$(file_getprop /system/build.prop ro.build.version.oneui);

patch_cmdline "android.is_aosp" "";

# Wajib untuk Android 10, 11, 12, dan 13 agar tidak panic eBPF
if [ "$android" -lt 34 ]; then
    ui_print " ";
    ui_print "Legacy Android detected (SDK $android)! Patching eBPF...";
    patch_cmdline "android.legacy_ebpf=" "android.legacy_ebpf=1";
fi

if [ -z "$device" ] && [ -z "$android" ]; then
    ui_print " ";
    ui_print "Skipping ROM detection...";
else
    if [ -n "$oneui" ]; then
        ui_print " ";
        ui_print "OneUI ROM detected!";
    elif [ "$device" = "generic" ]; then
        ui_print " ";
        ui_print "GSI ROM detected!";
    else
        ui_print " ";
        ui_print "AOSP ROM detected!";
        patch_cmdline "android.is_aosp" "android.is_aosp=1";
    fi
fi

write_boot;
## end install
