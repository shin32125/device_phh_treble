$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
$(call inherit-product, device/aicp/sepolicy/common/sepolicy.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk

PRODUCT_ENFORCE_RRO_TARGETS := framework-res

# Don't enforce privapp-permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
	ro.control_privapp_permissions=log

# Camera
PRODUCT_PACKAGES += \
	Snap
