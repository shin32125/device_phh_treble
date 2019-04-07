$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)
-include vendor/crdroid/build/core/config.mk

SELINUX_IGNORE_NEVERALLOWS := true

# Camera
PRODUCT_PACKAGES += \
	Snap

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Power
PRODUCT_PACKAGES += \
	power.qcom.sm8150:64
