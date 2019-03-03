$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/aosp/common.mk)
TARGET_BOOT_ANIMATION_RES := 1080

# GoogleCamera
PRODUCT_PACKAGES += \
	GoogleCameraMod

PRODUCT_PACKAGES += \
	sap-api-java-static

# GApps
TARGET_GAPPS_ARCH := arm64
IS_PHONE := true
include vendor/gapps/config.mk