$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
$(call inherit-product, device/aicp/sepolicy/common/sepolicy.mk)
-include vendor/aicp/build/core/config.mk

BOARD_HARDWARE_CLASS += device/phh/treble/lineagehw

# Camera
PRODUCT_PACKAGES += \
	Snap
