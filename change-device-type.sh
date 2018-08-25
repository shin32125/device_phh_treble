#!/system/bin/sh

if grep -q phh.device.typechanged /system/build.prop;then
    exit 0
fi

if [ ! -f /vendor/build.prop ]; then
    exit 0
fi

VENDOR_FINGERPRINT="$(grep ro.vendor.build.fingerprint /vendor/build.prop | cut -d'=' -f 2)"
echo "Vendor fingerprint: ${VENDOR_FINGERPRINT}"

modify_on_match() {
    match_result=`echo "${VENDOR_FINGERPRINT}" | grep "$1"`
    lcd_density="$2"
    characteristics="$3"

    if [ -n "${match_result}" ]; then
        sed -i \
        -e "s/ro.sf.lcd_density=.*/ro.sf.lcd_density=${lcd_density}/" \
        -e "s/ro.build.characteristics=.*/ro.build.characteristics=${characteristics}/" \
        /system/build.prop
        echo "lockscreen.rot_override=true" >> /system/build.prop

        echo "Device type changed! Match: $2 $3"
    fi
}

mount -o remount,rw /system

# Add devices here, e.g.
# modify_on_match <pattern> <lcd_density> <characteristics>

modify_on_match "Xiaomi/clover/clover.*" "320" "tablet"

# End of devices

if [ -z "$(grep phh.device.typechanged /system/build.prop)" ]; then
    echo -e "\nphh.device.typechanged=true\n" >> /system/build.prop
fi

mount -o remount,ro /system
