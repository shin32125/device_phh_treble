$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
$(call inherit-product, device/aicp/sepolicy/common/sepolicy.mk)
-include vendor/aicp/build/core/config.mk

# Don't enforce privapp-permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
	ro.control_privapp_permissions=log

# Camera
PRODUCT_PACKAGES += \
	Snap

#Lights for Xiaomi SDM660
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-service.xiaomi_sdm660
