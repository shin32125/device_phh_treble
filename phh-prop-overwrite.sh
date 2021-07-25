#!/system/bin/sh

VENDOR_FINGERPRINT="$(grep ro.vendor.build.fingerprint /vendor/build.prop | cut -d'=' -f 2)"
echo "Vendor fingerprint: ${VENDOR_FINGERPRINT}"

VENDOR_BRAND_O="$(grep ro.vendor.product.brand /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_MODEL_O="$(grep ro.vendor.product.model /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_NAME_O="$(grep ro.vendor.product.name /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_DEVICE_O="$(grep ro.vendor.product.device /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_BRAND="$(grep ro.product.vendor.brand /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_MODEL="$(grep ro.product.vendor.model /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_NAME="$(grep ro.product.vendor.name /vendor/build.prop | cut -d'=' -f 2)"
VENDOR_DEVICE="$(grep ro.product.vendor.device /vendor/build.prop | cut -d'=' -f 2)"
echo "Product brand: ${VENDOR_BRAND}"
echo "Product model: ${VENDOR_MODEL}"
echo "Product name: ${VENDOR_NAME}"
echo "Product device: ${VENDOR_DEVICE}"

modify_on_match() {
    brand="$1"
    model="$2"
    name="$3"
    device="$4"

    setprop ro.product.brand ${brand}
    setprop ro.product.model ${model}
    setprop ro.product.name ${name}
    setprop ro.product.device ${device}
    setprop ro.lineage.device ${device}
    setprop ro.build.fingerprint ${VENDOR_FINGERPRINT}

    setprop ro.product.product.brand ${brand}
    setprop ro.product.product.model ${model}
    setprop ro.product.product.name ${name}
    setprop ro.product.product.device ${device}

    setprop ro.product.system.brand ${brand}
    setprop ro.product.system.model ${model}
    setprop ro.product.system.name ${name}
    setprop ro.product.system.device ${device}

    setprop ro.product.system_ext.brand ${brand}
    setprop ro.product.system_ext.model ${model}
    setprop ro.product.system_ext.name ${name}
    setprop ro.product.system_ext.device ${device}
}

if [ -n "${VENDOR_BRAND}" ] && [ -n "${VENDOR_MODEL}" ] && [ -n "${VENDOR_NAME}" ] && [ -n "${VENDOR_DEVICE}" ]; then
    modify_on_match "${VENDOR_BRAND}" "${VENDOR_MODEL}" "${VENDOR_NAME}" "${VENDOR_DEVICE}"
elif [ -n "${VENDOR_BRAND_O}" ] && [ -n "${VENDOR_MODEL_O}" ] && [ -n "${VENDOR_NAME_O}" ] && [ -n "${VENDOR_DEVICE_O}" ]; then
    modify_on_match "${VENDOR_BRAND_O}" "${VENDOR_MODEL_O}" "${VENDOR_NAME_O}" "${VENDOR_DEVICE_O}"
fi
