## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := P55_Novo

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/Xiaomi/hm_note_1w/device_hm_note_1w.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := P55_Novo
PRODUCT_NAME := lineage_P55_Novo
PRODUCT_BRAND := Panasonic
PRODUCT_MODEL := P55 Novo
PRODUCT_MANUFACTURER := Panasonic
