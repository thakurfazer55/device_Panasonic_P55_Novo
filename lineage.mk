## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := P55_Novo

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
BOARD_HAVE_QCOM_FM := true
# Inherit device configuration
$(call inherit-product, device/Panasonic/P55_Novo/device_P55_Novo.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := P55_Novo
PRODUCT_NAME := lineage_P55_Novo
PRODUCT_BRAND := Panasonic
PRODUCT_MODEL := P55 Novo
PRODUCT_MANUFACTURER := Panasonic
