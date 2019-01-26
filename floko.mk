$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
-include vendor/aicp/build/core/config.mk

SELINUX_IGNORE_NEVERALLOWS := true

# Camera
PRODUCT_PACKAGES += \
	Snap
