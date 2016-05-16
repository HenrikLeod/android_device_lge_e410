## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/e410/e410.mk)

PRODUCT_NAME := cm_e410

# Release name and versioning
PRODUCT_RELEASE_NAME := OptimusL1II
PRODUCT_VERSION_DEVICE_SPECIFIC :=

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := e410

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=v1_open_eu BUILD_FINGERPRINT=lge/v1_open_eu/v1:4.1.2/JZO54K/E410i10f-EUR-XX.1390287781:user/release-keys PRIVATE_BUILD_DESC="v1_open_eu-user 4.1.2 JZO54K E410i10f-EUR-XX.1390287781 release-keys"
