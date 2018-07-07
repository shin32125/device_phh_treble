$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
$(call inherit-product, device/aicp/sepolicy/common/sepolicy.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk
