$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
-include vendor/lineage/build/core/config.mk
-include vendor/lineage/build/core/apicheck.mk
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_PACKAGES += \
   FlipFlap \
   NotchBarKiller

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