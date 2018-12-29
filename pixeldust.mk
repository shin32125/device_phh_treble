$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)
$(call inherit-product, vendor/pixeldust/configs/system_optional.mk)
$(call inherit-product, vendor/googleapps/googleapps.mk)
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64