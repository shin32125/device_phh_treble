$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, vendor/lineage/config/BoardConfigSoong.mk)
$(call inherit-product, device/lineage/sepolicy/common/sepolicy.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk
PRODUCT_SHIPPING_API_LEVEL := 30

# Fake Kernel
BOARD_KERNEL_IMAGE_NAME := Image.lz4
KERNEL_LD := LD=ld.lld
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := sunfish_defconfig
TARGET_KERNEL_SOURCE := kernel/google/sunfish
TARGET_NEEDS_DTBOIMAGE := true

PRODUCT_PACKAGES += \
   FlipFlap

#NFC
TARGET_USES_NQ_NFC := true

PRODUCT_SOONG_NAMESPACES += \
    vendor/nxp/opensource/sn100x \
    vendor/nxp/opensource/packages/apps/Nfc

PRODUCT_PACKAGES += \
   NQNfcNci \
   libnqnfc-nci \
   libnqnfc_nci_jni \
   libsn100nfc_nci_jni \
   libsn100nfc-nci \
   com.nxp.nfc.nq \
   com.nxp.nfc.nq.xml \
   com.android.nfc_extras \
   vendor.nxp.hardware.nfc@2.0-service \
   nfc_nci.nqx.default.hw \
   se_nq_extn_client \
   ls_nq_client \
   jcos_nq_client