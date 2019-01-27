$(call inherit-product, vendor/rr/config/common_full_phone.mk)
$(call inherit-product, device/rr/sepolicy/common/sepolicy.mk)

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/wake_gesture"

# Dual Wi-Fi interface
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Vendor init
TARGET_INIT_VENDOR_LIB := libinit_perseus
TARGET_RECOVERY_DEVICE_MODULES := libinit_perseus

PRODUCT_COPY_FILES += \
    /device/phh/treble/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_sdm845

# Media
PRODUCT_COPY_FILES += \
    /device/phh/treble/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Power
PRODUCT_PACKAGES += \
    power.qcom:64

# QTI
PRODUCT_COPY_FILES += \
    /device/phh/treble/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml \
    /device/phh/treble/permissions/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Telephony
PRODUCT_PACKAGES += \
    qti-telephony-common

# GoogleCamera
PRODUCT_PACKAGES += \
	GoogleCameraMod

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := rr_perseus
PRODUCT_DEVICE := perseus
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi MIX 3
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="perseus" \
    TARGET_DEVICE="perseus"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix custom property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q845-05000-1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.core_ctl_min_cpu=2 \
    ro.vendor.qti.core_ctl_max_cpu=4 \
    vendor.iop.enable_prefetch_ofr=0 \
    vendor.iop.enable_uxe=0

# RCS and IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.rcs.supported=0 \
    persist.vendor.ims.disableUserAgent=0 \
    persist.radio.calls.on.ims=1

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.flexmap_type=none \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.report_codec=1 \
    ril.subscription.types=NV,RUIM \
    ro.telephony.default_network=22,22 \
    telephony.lteOnCdmaDevice=1

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.sat.fallback.dist=45 \
    persist.camera.sat.fallback.dist.d=5 \
    persist.camera.sat.fallback.luxindex=310 \
    persist.camera.sat.fallback.lux.d=50 \
    persist.vendor.camera.perfcapture=1

# Display features
PRODUCT_PROPERTY_OVERRIDES += \
    ro.displayfeature.histogram.enable=false \
    ro.eyecare.brightness.threshold=7 \
    ro.eyecare.brightness.level=5 \
    ro.hist.brightness.threshold=7 \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/vendor/etc/sdr_config.cfg \
    ro.qcom.ad.hdr.calib.data=/vendor/etc/hdr_config.cfg \
    ro.qcom.ad.sensortype=2 \
    ro.qualcomm.cabl=0 \
    ro.whitepoint_calibration_enable=false