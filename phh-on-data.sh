#!/system/bin/sh

vndk="$(getprop persist.sys.vndk)"
[ -z "$vndk" ] && vndk="$(getprop ro.vndk.version |grep -oE '^[0-9]+')"

if getprop persist.sys.phh.no_vendor_overlay |grep -q true;then
	for part in odm vendor;do
		mount /mnt/phh/empty_dir/ /$part/overlay
	done
fi

if getprop persist.sys.phh.caf.media_profile |grep -q true;then
    setprop media.settings.xml "/vendor/etc/media_profiles_vendor.xml"
fi


minijailSrc=/system/system_ext/apex/com.android.vndk.v28/lib/libminijail.so
minijailSrc64=/system/system_ext/apex/com.android.vndk.v28/lib64/libminijail.so
if [ "$vndk" = 27 ];then
    mount $minijailSrc64 /vendor/lib64/libminijail_vendor.so
    mount $minijailSrc /vendor/lib/libminijail_vendor.so
fi

if [ "$vndk" = 28 ];then
    mount $minijailSrc64 /vendor/lib64/libminijail_vendor.so
    mount $minijailSrc /vendor/lib/libminijail_vendor.so
    mount $minijailSrc64 /system/lib64/vndk-28/libminijail.so
    mount $minijailSrc /system/lib/vndk-28/libminijail.so
    mount $minijailSrc64 /vendor/lib64/libminijail.so
    mount $minijailSrc /vendor/lib/libminijail.so
fi

if [ -f /vendor/etc/libnfc-qrd-SN100.conf ]; then
    mount -o bind /mnt/phh/empty_dir /system/app/NfcNci
else
    mount -o bind /mnt/phh/empty_dir /system/system_ext/app/NQNfcNci
fi

if getprop ro.vendor.build.fingerprint |grep -iq -e Rakuten/C330;then
    chmod 0755 /system/phh/c330/android.hardware.graphics.composer@2.1-service
    mount -o bind /system/phh/c330/android.hardware.graphics.composer@2.1-impl.so /vendor/lib64/hw/android.hardware.graphics.composer@2.1-impl.so
    mount -o bind /system/phh/c330/hwcomposer.msm8937.so /vendor/lib64/hw/hwcomposer.msm8937.so
    mount -o bind /system/phh/c330/libsdmcore.so /vendor/lib64/libsdmcore.so
    mount -o bind /system/phh/c330/android.hardware.graphics.composer@2.1-service /vendor/bin/hw/android.hardware.graphics.composer@2.1-service
fi