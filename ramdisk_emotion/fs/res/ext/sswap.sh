#!/system/bin/sh


PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH


# Inicio
mount -o remount,rw -t auto /system
mount -t rootfs -o remount,rw rootfs

SWAPSIZE=1280
PRIORITY=10



if [ $ZSWAPSIZE -gt 0 ]; then
echo `expr $ZSWAPSIZE \* 1024 \* 1024` > /sys/devices/virtual/block/vnswap0/disksize
/system/xbin/busybox swapoff /dev/block/vnswap0 > /dev/null 2>&1
/system/xbin/busybox mkswap /dev/block/vnswap0 > /dev/null 2>&1
/system/xbin/busybox swapon /dev/block/vnswap0 > /dev/null 2>&1
fi
sync


mount -t rootfs -o remount,ro rootfs
mount -o remount,ro -t auto /system