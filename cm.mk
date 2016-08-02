# Release name
PRODUCT_RELEASE_NAME := Pure XL

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/gionee/mt6795/device_mt6795.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mt6795
PRODUCT_NAME := cm_mt6795
PRODUCT_BRAND := BLU
PRODUCT_MODEL := Pure XL (P0010UU)
PRODUCT_MANUFACTURER := Gionee
