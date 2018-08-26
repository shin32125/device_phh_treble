$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
$(call inherit-product, device/aicp/sepolicy/common/sepolicy.mk)
-include vendor/aicp/build/core/config.mk

TARGET_TAP_TO_WAKE_NODE := "/sys/devices/soc/c177000.i2c/i2c-3/3-0038/fts_gesture_mode"

# Camera
PRODUCT_PACKAGES += \
	Snap
