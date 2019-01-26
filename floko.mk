$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
-include vendor/aicp/build/core/config.mk

# Camera
PRODUCT_PACKAGES += \
	Snap
