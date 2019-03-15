$(call inherit-product, vendor/crdroid/config/common_full_phone.mk)
$(call inherit-product, device/crdroid/sepolicy/common/sepolicy.mk)

SELINUX_IGNORE_NEVERALLOWS := true

# Camera
PRODUCT_PACKAGES += \
	Snap
